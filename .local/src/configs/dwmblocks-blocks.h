//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/					/*Update Interval*/	/*Update Signal*/
	{"DAB ", 	"TZ=':America/New_York' date '+%H:%M'",		30,			0},
	{"ITA ", 	"TZ=':Europe/Rome' date '+%H:%M'",		30,			0},
	{"", 		"date '+%H:%M'",				30,			0},
	{"%", 		"cat /sys/class/power_supply/BAT0/capacity",	20,			0},	
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
