( // app setup
"animatron-config.scd".loadRelative;
"animatron-desert.scd".loadRelative;
a = Animatron.boot;
a.cmd("/post alo");
a.cmd("/log/level info");
a.cmd("/window/size % %", ~displayWidth, ~displayHeight);
a.cmd("/assets/path %", ~assetsPath);
a.cmd("/assets");
a.cmd("/commands/load %/lifecodes.ocl", ~basePath);
a.cmd("/commands");
a.cmd("/load *");
a.cmd("/animations");
a.cmd("/editor/toggle");
);


~desert.(~interval);
~desert_life.();
