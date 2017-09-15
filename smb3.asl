state("fceux")
{
	byte world : 0x3B1388, 0x727;
	byte bowserDoor1 : 0x3B1388, 0x2;
	byte bowserDoor2 : 0x3B1388, 0x71D;
}

split
{
	return (settings["worlds"] && old.world != current.world) ||
		(settings["bowserDoor"] && old.bowserDoor1 == 0 && current.bowserDoor1 == 1 && old.bowserDoor2 == 58 && current.bowserDoor2 == 62);
}

startup
{
	settings.Add("worlds", false, "World Change");
	settings.SetToolTip("worlds", "Split on world changes");
	settings.Add("bowserDoor", false, "Bowser Door Opens");
	settings.SetToolTip("bowserDoor", "Split after Bowser's chamber door opens and is enterable (before seeing Peach's chamber.)");
}