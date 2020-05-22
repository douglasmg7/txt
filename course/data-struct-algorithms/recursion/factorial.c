/*
    Factorial definition:
        Valid for non-negative numbers
        Denoted by n!
        Is the product of all positive integers from 1 to n
        5! = 5 * 4 * 3 * 2 * 1 = 120
*/
#include <stdio.h>
#include <stdlib.h>

unsigned long factorial(unsigned long n);

int main(int argc, char *argv[]) {

    if (argc < 2) {
        printf("%s\n", argv[0]); 
        printf("usage: %s integer-number\n", argv[0]); 
    }

    // Convert param to unsigned long.
    char *pchar;
    unsigned long val = strtoul(argv[1], &pchar, 10);
    /* printf("pointer dereference value: %s\n", pchar); */
    /* printf("val: %lu\n", val); */

    if (val == 0) {
        printf("Invalid parameter: %s, it must be a integer > 0.\n", argv[1]); 
    }
    printf("Factorial of %s: %lu\n", argv[1], factorial(val));
}

unsigned long factorial(unsigned long n) {
    if (n == 0)
        return 1;
    else {
        return n * factorial(n-1);
    }
}
