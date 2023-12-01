module p385;

import std.stdio;
import io;
import std.random;
import std.math;
import std.typecons;
import std.range;

void main(){
    string path = "../data";
    int[] data = parse_input(path);
    foreach (int val; data)
    {
        Tuple!(int, int) pair = generate_gcd_pair(val);
        writef("%d %d ", pair[0], pair[1]);
    }
    writeln();

    //validate phase
    int step = validate_gcd(9, 7);
    //writefln("%d", step);
}

Tuple!(int, int) generate_gcd_pair(int max_step){
    // for gcd generation we start from 
    int low = 0;
    int high = 1;
    int seed = pow(2,16);
    // then we must generate the next gcd by iterating
    // next = high * random + low
    // ex: 2 = 1*1 + 0  
    Mt19937 rnd = Random(seed);

    foreach (i; 0..max_step)
    {
        int rndval = uniform(1, 10, rnd);
        //int rndval = rnd.front();
        //int rndval = [0,1,2,3,4].choice();
        int next = high*rndval + low;
        low = high;
        high = next;
    }
    Tuple!(int, int) pair = tuple(high, low); 
    return pair;
}

int validate_gcd(long high,long low){
    //writefln("gcd pair: %d %d\n", high, low);
    if(low == 0)
        return 0;
    else{
        long rem = high % low;
        high = low;
        low = rem;
        return 1 + validate_gcd(high, low);
    }
}