"animatron-startup.scd".loadRelative;
"animatron-desert.scd".loadRelative;
"animatron-underwater.scd".loadRelative;
(
Tdef(\lifecodes_test, {
	// Tdef(\desert).play;
	3.wait;
	Tdef(\desert_life).play;
	140.wait;
	Tdef(\underwater).play;
}).play
)
