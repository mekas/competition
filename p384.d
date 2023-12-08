module p384;

import std.stdio;
import std.container;
import std.typecons;
import std.array;
import std.string;

void main(){
    string path = "../data";
    auto data = parse_input(path);
    printArrayOfTuple(data);
}

void printArrayOfTuple(Array!(Tuple!(Array!bool, Array!bool)) data){
    foreach (pair; data)
    {
        string bits1 = boolArrayToString(pair[0]);
        string bits2 = boolArrayToString(pair[1]);
        writefln("%s %s", bits1, bits2);
    }
}

string boolArrayToString(Array!bool bits){
    string bitstring = "";

    foreach (bit; bits)
    {
        if(bit == true)
            bitstring ~= "1";
        else
            bitstring ~= "0";
    }
    return bitstring;
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