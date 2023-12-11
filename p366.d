module p366;

import std.stdio;
import std.container;
import std.typecons;
import std.array;
import std.string;
import io;
import core.stdc.stdlib;
import std.algorithm.sorting;
import screen;

void main(){
    string path = "../data";
    auto data = parse_input(path);
    dump_data(data);
}

Array!Screen parse_input(string path){
    Array!Screen data = Array!Screen();
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    for(int i=0;i<ncase;i++){
        int wo, ho, wr, hr;
        file.readf(" %dx%d %d:%d", wo, ho, wr, hr);
        Screen screen = new Screen(wo, ho, wr, hr);
        data.insertBack(screen);
    }
    return data;
}

void dump_data(Array!Screen screens){
    foreach (screen; screens)
    {
        writefln("%d %d %d %d", screen.wo, screen.ho, screen.wr, screen.hr);
    }
}