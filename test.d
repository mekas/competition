module test;

import std.stdio;
import std.array;
import std.container;
import std.range.primitives;
import std.algorithm.sorting;
import std.algorithm;

void main(){
    int[] arr; //dynamic array declaration
    arr.length = 10;
    //arr.reserve(10);
    arr[0] = 1;
    Array!int arr2 = Array!int();
    arr2.insert(10);
    arr2.insert(7);
    arr2.insert(3);
    arr2.insert(4);
    arr2.insert(40);
    auto app2 = appender!string();
    //app.put(10);
    printf("capacity: %u \n", cast(uint) arr2.length);
    //int c = arr2.removeAny();
    //int c = arr2.moveAt(2);
    //printf("extracted val: %d \n", c);
    //printf("current capacity: %u \n", cast(uint) arr2.length);
    int[] arr3 = arr2.data();
    arr3.sort!("a < b");
    arr3.each!((ref x) => x = 2*x);
    arr3.each!(x => printf("%d ", x));
}

