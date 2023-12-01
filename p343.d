import std.stdio;
import std.container;
import std.typecons;
import std.array;

void main(){
    string path = "../data";
    parse_input(path);
}

Array!(Tuple!(Array!bool, Array!bool)) parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    auto data = Array!(Tuple!(Array!bool, Array!bool))();
    for(int i=0;i<ncase;i++){
        string v, v2;
        file.readf!" %s %s "(v, v2);
        //writefln("%s %s", v, v2);
        //split v to as individual character
        string[] letter = v.split();
        auto bletter = stringArrToBoolVector(letter);
        string[] letter2 = v.split();
        auto bletter2 = stringArrToBoolVector(letter2);
        Tuple!(Array!bool, Array!bool) pair;
        pair[0]=bletter;
        pair[1]=bletter2;
        data.insertBack(pair);
    }
    return data;
}

Array!bool stringArrToBoolVector(string[] data){
    auto boolVector = Array!bool();
    foreach(string letter; data){
        if(letter == "1"){
            boolVector.insert(true);
        } else
            boolVector.insert(false);
    }
    return boolVector;
}