depends = argv (){1};
if (! isempty (depends))
  pkg ("load", strsplit (depends){:});
endif

addpath (fullfile (pwd, "inst"));
addpath (fullfile (pwd, "src"));

dirs = {fullfile(pwd, "inst"), fullfile(pwd, "src")};
[~, nfail] = __run_test_suite__ (dirs, {});
exit (nfail > 0);
