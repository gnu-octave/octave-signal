## Makefile to simplify Octave Forge package maintenance tasks
##
## Copyright 2015-2016 Carnë Draug
## Copyright 2015-2016 Oliver Heimlich
## Copyright 2015-2019 Mike Miller
##
## Copying and distribution of this file, with or without modification,
## are permitted in any medium without royalty provided the copyright
## notice and this notice are preserved.  This file is offered as-is,
## without any warranty.

MKOCTFILE ?= mkoctfile
OCTAVE    ?= octave
SED       ?= sed
SHA256SUM ?= sha256sum
TAR       ?= tar
GZIP      ?= gzip
MAKEINFO  ?= makeinfo
MAKEINFO_HTML_OPTIONS := --no-headers --set-customization-variable 'COPIABLE_LINKS 0' --set-customization-variable 'COPIABLE_ANCHORS 0' --no-split 

# work out a possible help generator
ifeq ($(strip $(QHELPGENERATOR)),)
  ifneq ($(shell qhelpgenerator-qt5 -v 2>/dev/null),)
    QHELPGENERATOR = qhelpgenerator-qt5
  else ifneq ($(shell /usr/lib64/qt6/libexec/qhelpgenerator -v 2>/dev/null),)
    QHELPGENERATOR = /usr/lib64/qt6/libexec/qhelpgenerator
  else ifneq ($(shell qcollectiongenerator-qt5 -v 2>/dev/null),)
    QHELPGENERATOR = qcollectiongenerator-qt5
  #else ifneq ($(shell qhelpgenerator -qt5 -v 2>/dev/null),)
  # v4 doesnt work
  #  QHELPGENERATOR = qhelpgenerator -qt5
  else ifneq ($(shell qcollectiongenerator -qt5 -v 2>/dev/null),)
$(GZIP)    QHELPGENERATOR = qcollectiongenerator -qt5
  else
    QHELPGENERATOR = true
  endif
endif

PACKAGE := $(shell $(SED) -n -e 's/^Name: *\(\w\+\)/\1/p' DESCRIPTION)
VERSION := $(shell $(SED) -n -e 's/^Version: *\(\w\+\)/\1/p' DESCRIPTION)
DATE := $(shell $(SED) -n -e 's/^Date: *\(\w\+\)/\1/p' DESCRIPTION)
DEPENDS := $(shell $(SED) -n -e 's/^Depends[^,]*, *\(.*\)/\1/p' DESCRIPTION | $(SED) 's/ *([^()]*)//g; s/ *, */ /g')

BASEDIR ?= $(realpath $(CURDIR))

## Detect which VCS is used
vcs := $(if $(wildcard .hg),hg,$(if $(wildcard .git),git,unknown))
ifeq ($(vcs),hg)
release_dir_dep := $(BASEDIR)/.hg/dirstate
HG           := hg
HG_CMD        = $(HG) --config alias.$(1)=$(1) --config defaults.$(1)= $(1)
HG_ID        := $(shell $(call HG_CMD,identify) --id | $(SED) -e 's/+//' )
REPO_TIMESTAMP := $(firstword $(shell $(call HG_CMD,log) --rev $(HG_ID) --template '{date|hgdate}'))
endif
ifeq ($(vcs),git)
release_dir_dep := $(BASEDIR)/.git/index
GIT          := git
REPO_TIMESTAMP := $(firstword $(shell $(GIT) log -n1 --date=unix --format="%ad"))
endif

TAR_REPRODUCIBLE_OPTIONS := --sort=name --mtime="@$(REPO_TIMESTAMP)" --owner=0 --group=0 --numeric-owner
TAR_OPTIONS  := --format=ustar $(TAR_REPRODUCIBLE_OPTIONS)

RELEASE_DIR     := $(PACKAGE)-$(VERSION)
RELEASE_TARBALL := $(PACKAGE)-$(VERSION).tar.gz
HTML_DIR        := $(PACKAGE)-html
HTML_TARBALL    := $(PACKAGE)-html.tar.gz

.PHONY: help dist html release install all check doctest run doc clean maintainer-clean
.PHONY: build-docs cleandocs

help:
	@echo "Targets:"
	@echo "   dist             - Create $(RELEASE_TARBALL) for release"
	@echo "   html             - Create $(HTML_TARBALL) for release"
	@echo "   release          - Create both of the above and show md5sums"
	@echo
	@echo "   install          - Install the package in GNU Octave"
	@echo "   all              - Build all oct files"
	@echo "   check            - Execute package tests (w/o install)"
	@echo "   doctest          - Execute package doc tests (w/o install)"
	@echo "   run              - Run Octave with development in PATH (no install)"
	@echo "   doc              - Build Texinfo package manual"
	@echo
	@echo "   clean            - Remove releases, html documentation, and oct files"
	@echo "   maintainer-clean - Additionally remove all generated files"

$(RELEASE_DIR): $(release_dir_dep)
	@echo "Creating package version $(VERSION) release ..."
	-rm -rf $@
ifeq (${vcs},hg)
	$(call HG_CMD,archive) --exclude ".hg*" --type files --rev $(HG_ID) $@
endif
ifeq (${vcs},git)
	$(GIT) archive --format=tar --prefix="$@/" HEAD | $(TAR) -x
	$(RM) "$@/.gitignore"
endif
	$(MAKE) BASEDIR=$(BASEDIR) -C $@ build-docs
	cd "$@" && $(RM) -f Makefile .hg*
	# doc/mkfuncdocs.py doc/mkqhcp.py
	chmod -R a+rX,u+w,go-w $@

$(RELEASE_TARBALL): $(RELEASE_DIR)
	$(TAR) -cf - $(TAR_OPTIONS) $< | $(GZIP) -9n > $@
	-rm -rf $<

$(HTML_DIR): install
	@echo "Generating HTML documentation. This may take a while ..."
	-rm -rf $@
	$(OCTAVE) --silent \
	  --eval 'page_screen_output (false);' \
	  --eval 'set (0, "defaultfigurevisible", "off");' \
	  --eval 'pkg load generate_html $(PACKAGE);' \
	  --eval 'generate_package_html ("$(PACKAGE)", "$@", "octave-forge");'
	chmod -R a+rX,u+w,go-w $@

$(HTML_TARBALL): $(HTML_DIR)
	$(TAR) -cf - $(TAR_OPTIONS) $< | $(GZIP) -9n > $@
	-rm -rf $<

dist: $(RELEASE_TARBALL)

html: $(HTML_TARBALL)

release: dist html
	@$(SHA256SUM) $(RELEASE_TARBALL) $(HTML_TARBALL)
	@echo "Upload @ https://sourceforge.net/p/octave/package-releases/new/"
	@echo "Execute: hg tag \"$(VERSION)\""

install: $(RELEASE_TARBALL)
	@echo "Installing package locally ..."
	$(OCTAVE) --silent --eval 'pkg install $(RELEASE_TARBALL);'

all:
	cd src && $(MAKE) $@
	cd src && $(MAKE) PKG_ADD PKG_DEL

# using __run_test_suite__ as is available in octave 3.8+
check: all
	$(OCTAVE) --silent \
	  --eval 'if (! isempty ("$(DEPENDS)")); pkg load $(DEPENDS); endif;' \
	  --eval 'addpath (fullfile (pwd, "inst"));' \
	  --eval 'addpath (fullfile (pwd, "src"));' \
	  --eval 'if exist("oruntests") == 2, runtestsfunc=@oruntests;, else runtestsfunc=@runtests;, endif;' \
	  --eval 'runtestsfunc ("inst"); runtestsfunc ("src");'

doctest: all
	$(OCTAVE) --silent \
	  --eval 'if (! isempty ("$(DEPENDS)")); pkg load $(DEPENDS); endif;' \
	  --eval 'pkg load doctest;' \
	  --eval 'addpath (fullfile (pwd, "inst"));' \
	  --eval 'addpath (fullfile (pwd, "src"));' \
	  --eval 'doctest ({"src", "inst"});'

run: all
	$(OCTAVE) --silent --persist \
	  --eval 'if (! isempty ("$(DEPENDS)")); pkg load $(DEPENDS); endif;' \
	  --eval 'addpath (fullfile (pwd, "inst"));' \
	  --eval 'addpath (fullfile (pwd, "src"));' \
	  --eval '__load_signal__;'

doc: build-docs

doc/version.texi: $(release_dir_dep)
	@echo Generating $@
	@echo "@c autogenerated from Makefile" > $@
	@echo "@set VERSION $(VERSION)" >> $@
	@echo "@set PACKAGE $(PACKAGE)" >> $@
	@echo "@set DATE $(DATE)" >> $@

doc/functions.texi: $(release_dir_dep)
	cd doc && ./mkfuncdocs.py --src-dir=../inst/ --src-dir=../src/ ../INDEX | $(SED) 's/@seealso/@xseealso/g' > functions.texi

doc/$(PACKAGE).qhc: doc/$(PACKAGE).texi doc/functions.texi doc/version.texi
	# extract html
	cd doc && SOURCE_DATE_EPOCH=$(REPO_TIMESTAMP) $(MAKEINFO) --html --css-ref=$(PACKAGE).css $(MAKEINFO_HTML_OPTIONS) $(PACKAGE).texi

ifeq ($(QHELPGENERATOR),true)
	$(warning No QHELPGENERATOR ... skipping QT doc build)
else
	# try also create qch file if can
	cd doc && ./mkqhcp.py $(PACKAGE) && $(QHELPGENERATOR) $(PACKAGE).qhcp -o $(PACKAGE).qhc
	cd doc && $(RM) -f $(PACKAGE).qhcp $(PACKAGE).qhp
endif

doc/$(PACKAGE).info: doc/$(PACKAGE).texi doc/functions.texi doc/version.texi
	cd doc && $(MAKEINFO) $(PACKAGE).texi

build-docs: doc/$(PACKAGE).qhc  doc/$(PACKAGE).info

clean-docs:
	$(RM) -f doc/$(PACKAGE).html
	$(RM) -f doc/$(PACKAGE).qhc
	$(RM) -f doc/$(PACKAGE).qch
	$(RM) -f doc/$(PACKAGE).info
	$(RM) -f doc/functions.texi
	$(RM) -f doc/version.texi

clean: clean-docs
	-rm -rf $(RELEASE_DIR) $(RELEASE_TARBALL) $(HTML_TARBALL) $(HTML_DIR)
	cd src && $(MAKE) $@

maintainer-clean: clean
