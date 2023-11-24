module p29;
import std.stdio;
import std.container;
import std.algorithm;

void main(){
    int[] data = parse_input();
    auto index = new int[data.length];
    makeIndex!("a < b")(data, index);
    increment_counter_element(index);
    printArray(index);
}

void printArray(int[] arr){
        foreach (int val; arr)
        {
            writef("%d ", val);
        }
        writeln();
    }

int[] parse_input(){
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

void increment_counter_element(int[] arr){
    arr.each!( (ref x) => x = x+1);
    
    //print!int.printArray(arr);
}