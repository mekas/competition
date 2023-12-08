module io;

import std.stdio;
import std.container;
import std.typecons;
import std.array;

int[] parse_stdin(){
    int ncase;
    readf!"%d\n"(ncase);
    //writefln("%d", ncase);
    int[] data = new int[ncase];
    //Array!int data;
    int v;
    for(int i=0; i< ncase;i++){
        readf(" %d", v);
        data[i]=v;
    }
    return data;
}

int[] parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    //writefln("%d", ncase);
    int[] data = new int[ncase];
    //Array!int data;
    int v;
    for(int i=0; i< ncase;i++){
        file.readf!"%d "(v);
        data[i]=v;
    }
    return data;
}

void printIntArray(int[] arr){
    foreach (int val; arr)
    {
        writef("%d 1", val);
    }
}

void printStringArray(string[] arr){
    foreach (string val; arr)
    {
        writeln(val);
    }
}

template print(T){
    void printArray(T[] arr){
        foreach (T val; arr)
        {
            writef("%d ", val);
        }
        writeln();
    }
    /*
    void printContainerArray(T arr){
        foreach(T val; arr){
            writeln(val);
        }
    }*/
}

void print_tuple_values(Array!(Tuple!(Array!bool, Array!bool)) data){
    //loop outermost Array
    //writeln(data.length);
    int i=0;
    foreach (tup; data)
    {
        Array!bool v, v2;
        v = tup[0];
        v2 = tup[1];
        printBoolArray(v);
        writef(" ");
        printBoolArray(v2);
        writefln("");
        //writeln(i);
        //i++;
    }
}

void printBoolArray(Array!bool arr){
    foreach(val; arr){
        if(val == true)
            write("1");
        else
            write("0");
    }
    writeln();
}


void copy_array(int[] a, int[] b){
    for(int i=0;i<b.length;i++){
        a[i] = b[i];
    }
}
