( // desert

// bg
~desert_bg = {
	a.cmd("/create % solid", ~bg);
	a.cmd("/size % % %", ~bg, ~displayWidth, ~displayHeight);
	a.cmd("/color % %", ~bg, ~desertBgColor);
};

~desert_sun = {
	a.cmd("/free %", ~sun);
	a.cmd("/create % circle", ~sun);
	a.cmd("/color % %", ~sun, ~desertSunColor);
	a.cmd("/speed % %", ~sun, rrand(0.5,1));
	a.cmd("/size % 1.1", ~sun);
	a.cmd("/y % %", ~sun, ~sunY);
	a.cmd("/tween % linear /position/y % %", ~sunTime, ~sun, ~sunEndY);
	a.cmd("/tween % linear /color % %", ~desertSkyTime, ~bg, ~desertSkyColor);
};

~desert_clouds = {
	a.cmd("/free %*", ~cld);
	~clouds.do{|i|
		var actor = "%-%".format(~cld, i.asInteger);
		a.cmd("/create % brush-short", actor);
		a.cmd("/opacity % %", actor, rrand(0.5,0.6));
		a.cmd("/play/range % % %", actor, 21, 31);
		a.cmd("/move/x % %", actor, 50.rand2);
		a.cmd("/move/y % %", actor, 20.rand2);
		a.cmd("/y % %", actor, ~desertCloudsY);
		a.cmd("/scale/x % %", actor, 8);
		a.cmd("/speed % %", actor, rrand(0.5,0.8));
		a.cmd("/color % %", actor, ~desertBgColor);
		if(0.5.coin) { a.cmd("/flip/h %", actor) };
	};
	a.cmd("/tween % linear /color %* %", ~desertSkyTime, ~cld, ~desertCloudColor);
};

~desert_whale = {
	var actor = ~whale;
	a.cmd("/free %", actor);
	a.cmd("/create % whale", actor);
	a.cmd("/color % %", actor, ~desertColor);
	a.cmd("/angle % %", actor, ~desertWhaleAngle);
	a.cmd("/size % %", actor, ~desertWhaleSize);
	a.cmd("/x % %", actor, ~desertWhaleX);
	a.cmd("/y % %", actor, ~desertWhaleY + 130);
	// a.cmd("/front % %-%", actor, ~cld, ~clouds-1);
};

~desert_mountains = {
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
};

~desert_ground = {
	a.cmd("/free gnd*");
	~groundSquares.do{ |i|
		var actor = "%-%".format(~gnd, i.asInteger);
		a.cmd("/create % square", actor);
		a.cmd("/color % %", actor, ~desertColor);
		a.cmd("/x % %", actor, (~displayWidth / ~groundSquares * i + 480));
		a.cmd("/y % %", actor, ~desertGndY);
		a.cmd("/speed % %", actor, rrand(0.5,1));
	};
};

~desert_seeds = {
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
};

~desert_tv = {
	a.cmd("/create tv tv");
	a.cmd("/color tv* %", ~desertPlantColorA);
	a.cmd("/angle tv 5");
	a.cmd("/position/x tv %", ~displayWidth * 4 / 9 - 200);
	a.cmd("/position/y tv %", ~displayHeight / 2 + 120)
	a.cmd("/behind tv seed-%", 15);
};

~desert_harlequin = {
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
};

~desert_life = {
	Tdef(\desert_life, {
		~seeds.do{|i|
			var actor = "%-%".format(~seed, i.asInteger);
			a.cmd("/play %", actor);
			a.cmd("/tween % linear /color % %", rrand(1,10), actor, [~desertPlantColorA, ~desertPlantColorB].choose);
			1.wait;
		};
		a.cmd("/tween % linear /color %* %", rrand(10,20), ~gnd, ~desertPlantColorA);
		a.cmd("/tween % linear /color %* %", rrand(10,20), ~mnt, ~desertPlantColorA);
		a.cmd("/tween % linear /color %* %", rrand(10,20), ~whale, ~desertPlantColorA);
		a.cmd("/tween % linear /color %* %", rrand(10,20), ~harlequin, ~desertPlantColorB);
	}).play;
};

~desert = { |interval|
	Tdef(\desert, {
		~desert_bg.();
		interval.wait;
		~desert_sun.();
		interval.wait;
		~desert_clouds.();
		interval.wait;
		~desert_whale.();
		interval.wait;
		~desert_mountains.();
		interval.wait;
		~desert_ground.();
		interval.wait;
		~desert_seeds.();
		interval.wait;
		~desert_harlequin.();
	}).play;
};


// ~harlequinUpdate = Pfunc{|e|
// 	a.cmd("/next/frame %", ~harlequin);
// };

)