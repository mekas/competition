import std.stdio;
import std.format;
import io;
import std.container;
import std.algorithm;
import util;

int main()
{
    string path = "../data";
    auto data = parse_input(path);
    auto index = new int[data.length];
    makeIndex!("a < b")(data, index);
    increment_counter_element(index);
    print!int.printArray(index);
    return 1;
}