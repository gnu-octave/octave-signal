[bbut, abut]=butter(4,.4);
[bche, ache]=cheby1(4, 1, .4);
[bell,aell] = nellip(1, 20, .4, .43);
[hbut,w]=freqz(bbut, abut, 400);
[hche,w]=freqz(bche, ache, 400);
[hell,w]=freqz(bell, aell, 400);
xlabel("Frequency")
ylabel("Magnitude")
plot(w./pi, abs(hbut), ';butter(4,0.4);')
hold('on');
plot(w./pi, abs(hche), ';cheby1(4,1,0.4);')
plot(w./pi, abs(hell), ';nellip(1,20,0.4,0.43);')
hold('off');
