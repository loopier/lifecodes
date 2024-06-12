(
~basePath = thisProcess.nowExecutingPath.dirname;
~assetsPath = "%/../animations".format(~basePath);
~displayWidth = 1920*3;
~displayHeight = 1200;
~interval = 0.1;

~palette = ().know_(true);
~palette.purewhite = Color(1,1,1);
~palette.white = Color(0.97,0.95,0.87);
~palette.black = Color(0,0,0);
~palette.blue_dk = Color(0.05,0.08,0.09);
~palette.blue = Color(0.21,0.28,0.32);
~palette.blue_mid = Color(0.35,0.4,0.45);
~palette.blue_lt = Color(0.45,0.58,0.66);
~palette.yellow = Color(1,0.93,0.29);
~palette.yellow_dk = Color(0.91,0.63,0.2);
~palette.orange = Color(0.91,0.43,0.09);
~palette.orange_lt = Color(0.91,0.63,0.29);
~palette.red = Color(0.32,0.05,0.08);
~palette.red_lt = Color(0.42,0.05,0.08);
~palette.red_dk = Color(0.32,0.05,0.08);
~palette.gray_dk = Color(0.12,0.17,0.20);
~palette.gray = Color(0.59,0.61,0.62);
~palette.green = Color(0.4,0.5,0.0);
~palette.green_lt = Color(0.6,0.7,0.3);
~palette.green_hl = Color(0.91,0.83,0.4);
~palette.green_dk = Color(0.3,0.4,0.1);

~bg = "bg";
~harlequin = "ha";
~sun = "sun";
~gnd = "gnd";
~mnt = "mnt";
~seed = "seed";
~cld = "cld";

~desertColor = ~palette.orange.asCmdArgs;
~desertBgColor = ~palette.red_lt.asCmdArgs;
~desertSunColor = ~palette.yellow.asCmdArgs;
~desertPlantColorA = ~palette.green_hl.asCmdArgs;
~desertPlantColorB = ~palette.green_lt.asCmdArgs;

~harlequinSize = 0.5;
~groundSquares = 8;
~mountains = 25;
~seeds = 50;
~clouds = 6;

~mountainsY = 680;
~desertGndY = 1200;
~desertCloudsY = ~displayHeight / 2 + 25;

~sunTime = 140;
~sunY = ~displayHeight + 50;
~sunEndY = ~displayHeight.neg / 2;

~desertCloudsY = ~displayHeight / 2 + 20;

~desertWhaleX = ~displayWidth * 5 / 9;
~desertWhaleY = ~displayHeight / 2 + 100;
~desertWhaleAngle = 15;
~desertWhaleSize = 0.5;

)
