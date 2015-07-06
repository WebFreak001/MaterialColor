import std.file;
import std.stdio;
import std.conv;
import std.string;

void main()
{
	string file = readText("Material.txt");

	auto output = File("Material.gpl", "w");

	output.writeln("GIMP Palette");
	output.writeln("Name: Material Design");
	output.writeln();

	foreach (line; file.split('\n'))
	{
		if (line.strip().length == 0)
			continue;

		output.writefln(line.convertColor());
	}
}

string convertColor(string line)
{
	if (line[0] == '#')
		line = line[1 .. $];

	ubyte r = toImpl!ubyte (line[0 .. 2], 16);
	ubyte g = toImpl!ubyte (line[2 .. 4], 16);
	ubyte b = toImpl!ubyte (line[4 .. 6], 16);
	string name = line[6 .. $].strip();

	return std.format.format("%s %s %s %s", r, g, b, name);
}
