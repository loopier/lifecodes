( // desert

// bg
Tdef(\desert_bg, {
	a.cmd("/create % solid", ~bg);
	a.cmd("/size % % %", ~bg, ~displayWidth, ~displayHeight);
	a.cmd("/color % %", ~bg, ~desertBgColor);
});

Tdef(\desert_sun, {
	a.cmd("/free %", ~sun);
	a.cmd("/create % circle", ~sun);
	a.cmd("/color % %", ~sun, ~desertSunColor);
	a.cmd("/speed % %", ~sun, rrand(0.5,1));
	a.cmd("/size % 1.1", ~sun);
	a.cmd("/y % %", ~sun, ~sunY);
	a.cmd("/tween % linear /position/y % %", ~sunTime, ~sun, ~sunEndY);
});

Tdef(\desert_clouds, {
	~clouds.do{|i|
		var actor = "%-%?".format(~cld, i.asInteger);
		a.cmd("/create % brush-short", actor);
		a.cmd("/opacity % %", actor, (i+1));
	};
});

Tdef(\desert_mountains, {
	a.cmd("/free mnt*");
	~mountains.do{ |i|
		var actor = "%-%".format(~mnt, i.asInteger);
		a.cmd("/create % square", actor);
		a.cmd("/color % %", actor, ~desertColor);
		a.cmd("/size % %", actor, rrand(0.1,0.2));
		a.cmd("/scale/x % %", actor, rrand(0.1,2));
		a.cmd("/scale/y % %", actor, rrand(0.1,1));
		a.cmd("/x % %", actor, ~displayWidth.rand);
		a.cmd("/y % %", actor, ~mountainsY);
		a.cmd("/move/x % %", actor, 30.rand2);
		a.cmd("/opacity % %", actor, rrand(0.9,0.95));
		a.cmd("/angle % %", actor, 20.rand2);
	};
});

Tdef(\desert_ground, {
	a.cmd("/free gnd*");
	~groundSquares.do{ |i|
		var actor = "%-%".format(~gnd, i.asInteger);
		a.cmd("/create % square", actor);
		a.cmd("/color % %", actor, ~desertColor);
		a.cmd("/x % %", actor, (~displayWidth / ~groundSquares * i + 480));
		a.cmd("/y % %", actor, ~desertGndY);
		a.cmd("/speed % %", actor, rrand(0.5,1));
	};
});

Tdef(\desert_seeds, {
	a.cmd("/free seed-*");
	~seeds.do{ |i|
		var actor = "%-%".format(~seed, i.asInteger);
		var y = i.linlin(0,~seeds, 0, 1);
		a.cmd("/create % seed-grow-1", actor);
		a.cmd("/x % %", actor, ~displayWidth.rand);
		a.cmd("/y % %", actor, y * (~displayHeight-690) + 690);
		a.cmd("/scale % %", actor, y.linlin(0,1, 0.5, 1.5));
		a.cmd("/speed % %", actor, rrand(0.5,1));
		a.cmd("/stop %", actor);
		a.cmd("/frame % %", actor, 6.rand);
		a.cmd("/color % %", actor, ~desertColor);
		a.cmd("/state/add % seed-grow-1 seed-1", actor);
		a.cmd("/state/add % seed-1 seed-1 flower-1 flower-2 seed-akh", actor);
		a.cmd("/state/add % flower-1 seed-grow-1", actor);
		a.cmd("/state/add % flower-2 seed-grow-1", actor);
		a.cmd("/state/add % seed-akh seed-grow-1", actor);
	};
});

Tdef(\desert_harlequin, {
	a.cmd("/free %", ~harlequin);
	// a.cmd("/create ha harlequin-clock");
	a.cmd("/create % shape", ~harlequin);
	a.cmd("/size % %", ~harlequin, ~harlequinSize);
	a.cmd("/angle %", ~harlequin, 360.rand);
	a.cmd("/y % %", ~harlequin, 500);
	a.cmd("/angle % %", ~harlequin, -10);
	// a.cmd("/create %-gnd rocks", ~harlequin);
	// a.cmd("/parent %-gnd ha", ~harlequin);
	// a.cmd("/y %-gnd %", ~harlequin, 640);
	a.cmd("/x %* %", ~harlequin, ~displayWidth * 6 / 9);
	a.cmd("/color %* % % %", ~harlequin, 0.93, 0.45, 0.11);
	a.cmd("/stop %", ~harlequin);
	a.cmd("/frame % %", ~harlequin, 12.rand);
});

Tdef(\desert_life, {
	~seeds.do{|i|
		var actor = "%-%".format(~seed, i.asInteger);
		a.cmd("/play %", actor.debug);
		1.wait;
	};
});

Tdef(\desert, {
	Tdef(\desert_bg).play;
	Tdef(\desert_sun).play;
	Tdef(\desert_clouds).play;
	Tdef(\desert_mountains).play;
	Tdef(\desert_ground).play;
	Tdef(\desert_seeds).play;
	Tdef(\desert_harlequin).play;
});


// ~harlequinUpdate = Pfunc{|e|
// 	a.cmd("/next/frame %", ~harlequin);
// };

)