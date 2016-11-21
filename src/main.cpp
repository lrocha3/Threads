//============================================================================
// Name        : Main.cpp
// Author      : Luis Rocha
// Version     :
// Description : Threads creation
//============================================================================

#include <iostream>
#include <thread>

#include "definitions.h"
using namespace std;

/**
 * This function will run in different threads
 */

void call_from_thread(int value, int num_threads)
{
    value++;
    printf("%d%%\n", (int)((double) value/num_threads * 100));
}



int main()
{

    thread t[num_threads];

    //Launch a group of threads
    for (int i = 0; i < num_threads; ++i) {
        t[i] = thread(call_from_thread,i, num_threads);
    }




    //Join the threads with the main thread
    for (int i = 0; i < num_threads; ++i) {
        t[i].join();
    }


    return 0;
}
