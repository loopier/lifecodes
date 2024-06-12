(
Tdef(\underwater, {
	~seeds.do{|i|
		var actor = "%-%".format(~seed, i.asInteger);
		a.cmd("/state/add % seed-1 bubble-grow", actor);
		a.cmd("/state/add % bubble-grow bubble", actor);
		a.cmd("/state/add % bubble bubble", actor);
	};
	a.cmd("/tween % linear /color % %", ~gndFadeTime, ~bg, ~underwaterColor);
	a.cmd("/tween % sine /color %* %", ~gndFadeTime, ~cld, ~underwaterColor);

	a.cmd("/tween % sine /rotate % %", ~harlequinTime * 4, ~harlequin, (2*pi).rand.debug);
	a.cmd("/tween % sine /color % %", ~harlequinTime, ~harlequin, ~underwaterColorLt);

	a.cmd("/tween % sine /color % %", ~gndFadeTime, ~whale, ~whaleColor);
	a.cmd("/tween % sine /position % % %", ~whaleTime, ~whale, ~whaleEndX, ~whaleEndY);
	a.cmd("/tween % sine /rotation % %", ~whaleTime, ~whale, ~whaleEndAngle);
	~seeds.do{|i|
		var actor = "%-%".format(~seed, i.asInteger);
		a.cmd("/tween % sine /position/y % %", rrand(10,40), actor, ~displayHeight.rand);
		a.cmd("/tween % sine /rotation % %", rrand(10,20), actor, (pi*2).rand2);
		a.cmd("/tween % linear /color % %", rrand(10,20), actor, [~underwaterColorMid, ~underwaterColorLt].choose);
		a.cmd("/tween % linear /opacity % %", actor, rrand(0.8,1));
		1.0.rand.wait;
	};


	~groundSquares.do{|i|
		var actor = "%-%".format(~gnd, i.asInteger);
		a.cmd("/tween % sine /position % % %", ~gndFadeTime , actor, ~displayWidth.rand, ~displayHeight.rand);
		a.cmd("/tween % sine /rotation % %", ~gndFadeTime, actor, pi.rand2);
		a.cmd("/tween % linear /color % %", ~gndFadeTime/2, actor, [~underwaterColor, ~underwaterColorDk, ~underwaterColorMid, ~underwaterColorLt].choose);
		1.0.rand.wait;
	};
	~clouds.do{|i|
		var actor = "%-%".format(~cld, i.asInteger);
		a.cmd("/tween % sine /position % % %", ~gndFadeTime , actor, ~displayWidth.rand, ~displayHeight.rand);
		a.cmd("/tween % sine /rotation % %", ~gndFadeTime, actor, pi.rand2);
		a.cmd("/tween % linear /color % %", ~gndFadeTime/2, actor, [~underwaterColor, ~underwaterColorDk, ~underwaterColorMid, ~underwaterColorLt].choose);
		1.0.rand.wait;
	};
	~mountains.do{|i|
		var actor = "%-%".format(~mnt, i.asInteger);
		a.cmd("/free %", actor);
		1.0.rand.wait;
	};

	a.cmd("/play ha");
	a.cmd("/speed ha 1.5");

	Tdef(\underwater_bubbles).play;
});

Tdef(\underwater_bubbles, {
	~seeds.do{|i|
		var actor = "%-%".format(~seed, i.asInteger);
		a.cmd("/state/add % bubble bubble bubble-weed bubble-pop bubble-trisquelion", actor);
		a.cmd("/state/add % bubble-weed bubble-grow", actor);
		a.cmd("/state/add % bubble-pop bubble-grow", actor);
		a.cmd("/state/add % bubble-trisquelion trisquelion trisquelion-bubble", actor);
		a.cmd("/state/add % trisquelion trisquelion trisquelion-bubble", actor);
		a.cmd("/state/add % trisquelion-bubble bubble", actor);
		1.0.rand.wait;
	};
})
)
// a.cmd("/free cld*")
// a.cmd("/color bg %", ~palette.red.asCmdArgs)
// Tdef(\desert).play
// Tdef(\desert_life).play
// Tdef(\underwater).play
// Tdef(\underwater_bubbles).play

// a.cmd("/animations")
// a.cmd("/actors")
// a.cmd("/free sun")
// a.cmd("/color cld* %", ~palette.red_lt.asCmdArgs)
// a.cmd("/color bg %", ~palette.red_lt.asCmdArgs)
// a.cmd("/commands")