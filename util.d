module util;
import std.algorithm;
import io;

void increment_counter_element(int[] arr){
    arr.each!( (ref x) => x = x+1);
    
    //print!int.printArray(arr);
}