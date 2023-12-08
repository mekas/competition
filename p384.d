module p384;

import std.stdio;
import std.container;
import std.typecons;
import std.array;
import core.stdc.stdlib;
import std.algorithm;
import std.string;
import std.range;
import io;

void main(){
    string path = "../data";
    Array!(Tuple!(Array!bool, Array!bool)) values = parse_input(path);
    Array!int result = process_list(values);
    print!(int).printArray(result.data());
}

int process_pair(Array!(Array!bool) vectors, Tuple!(Array!bool, Array!bool) pair){
    int count = 0;
    //loop all vectors
    int i=0;
    foreach (bits; vectors)
    {
        writefln("%d", i);
        int d1 = hamming_distance(bits, pair[0]);
        int d2 = hamming_distance(bits, pair[0]);
        if(d1 == d2){
            count++;
            writefln("d1: %d, d2: %d", d1, d2);
            printBoolArray(bits);
            printBoolArray(pair[0]);
            printBoolArray(pair[1]);
        }
        i++;
    }
    return count;
}

Array!int process_list(Array!(Tuple!(Array!bool, Array!bool)) data){
    Array!int result = Array!int();
    result.reserve(data.length());
    Array!(Array!bool) vectors = Array!(Array!bool)();
    //generate a 3rd number 
    bool[] x = new bool[data.length()];
    generate_bitvector(vectors, x, data.length(), 0);
    foreach (pair; data)
    {
        int val = process_pair(vectors, pair);
        result.insertBack(val);
    }
    return result;
}

void generate_bitvector(ref Array!(Array!bool) vectors, bool[] x, ulong len, int pos){
    if(pos==len){
        vectors.insertBack(Array!bool(x));
    }
    else{
        bool[] space = [false, true];
        foreach (bool key; space)
        {
            x[pos] = key;
            generate_bitvector(vectors, x, len, pos+1);
        }
    }
}

int hamming_distance(Array!bool vecA, Array!bool vecB){
    ulong len = vecA.length();
    Array!bool vecXor = Array!bool();
    vecXor.reserve(len);
    foreach (i; iota(0, len))
    {
        bool res = vecA[i] ^ vecB[i];
        vecXor.insertBack(res);
    }

    return sum_array_bool(vecXor);
}

int sum_array_bool(Array!bool vals){
    return vals.fold!((a,b) => a + b);
}

Array!(Tuple!(Array!bool, Array!bool)) parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    auto data = Array!(Tuple!(Array!bool, Array!bool))();
    for(int i=0;i<ncase;i++){
        string v, v2;
        //file.readf!" %s %s"(v, v2);
        string line = file.readln();
        //writefln("%s", strip(line));
        string[] word = strip(line).split(" ");
        v = word[0];
        v2 = word[1];
        Array!bool bletter = stringArrToBoolVector(v);
        Array!bool bletter2 = stringArrToBoolVector(v2);
        Tuple!(Array!bool, Array!bool) pair;
        pair[0]=bletter;
        pair[1]=bletter2;
        data.insertBack(pair);
    }
    return data;
}

Array!bool stringArrToBoolVector(string data){
    //writefln("%s", data);
    auto boolVector = Array!bool();
    for(int i=0;i<data.length;i++){
        if(data[i] == '1'){
            boolVector.insert(true);
        } else{
            boolVector.insert(false);
        }
    }
    return boolVector;
}