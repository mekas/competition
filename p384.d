module p384;

import std.stdio;
import std.container;
import std.typecons;
import std.array;
import std.string;
import io;
import core.stdc.stdlib;

void main(){
    string path = "../data";
    auto data = parse_input(path);
    process_vector(data);
}

void process_vector(Array!(Tuple!(Array!bool, Array!bool)) data){
    ulong len = data.length();
    Array!(Array!bool) vectors = generate_bitvectors(len);
    printArrayOfBoolArray(vectors);
    foreach (pair; data)
    {
        
    }
}

void printArrayOfBoolArray(Array!(Array!bool) X){
    foreach (x; X)
    {
        string val = boolArrayToString(x);
        writeln(val);
    }
}

Array!(Array!bool) generate_bitvectors(ulong len){
    Array!(Array!bool) vectors = Array!(Array!bool)();
    bool[] space = [false, true];
    bool[] bits = new bool[len];
    foreach (bool bit; space)
    {
        bits[0] = bit;
        // 0
        //current_vector.insertBack(bit);
        foreach (bool bit2; space)
        {
            // 00
            //current_vector.insertBack(bit2);
            bits[1] = bit2;
            foreach (bool bit3; space)
            {
                bits[2] = bit3;
                Array!bool current_vector = Array!bool(bits);
                string val = boolArrayToString(current_vector);
                writeln(val);
                
                //vectors.insertBack(current_vector);
            }
        }
    }
    return vectors;
}

Array!(Tuple!(Array!bool, Array!bool)) parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    auto data = Array!(Tuple!(Array!bool, Array!bool))();
    for(int i=0;i<ncase;i++){
        string v, v2;
        //file.readf!" %s %s "(v, v2);
        string line  = file.readln();
        //writeln(strip(line));
        //split v to as individual character
        string[] letter = strip(line).split();
        v = letter[0];
        v2 = letter[1];
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
    auto boolVector = Array!bool();
    for(int i=0;i<data.length;i++){
        if(data[i] == '1'){
            boolVector.insert(true);
        } else
            boolVector.insert(false);
    }
    return boolVector;
}