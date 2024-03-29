//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT_PRINTIG_H
#define OS_PROJEKAT_PRINTIG_H

#include "../h/syscall_c.h"

typedef unsigned long uint64;

extern "C" uint64 copy_and_swap(uint64 &lock, uint64 expected, uint64 desired);

void printString(char const *string);

char* getString(char *buf, int max);

int stringToInt(const char *s);

void printInt(int xx, int base=10, int sgn=0);



#endif //OS_PROJEKAT_PRINTIG_H
