#include <stdio.h>
#include <stdlib.h>
#include "hanoi.h"

int main(int argc, char *argv[]) {
    int height = 3;
    if (argc <= 2) {
        if (argc == 2)
            height = atoi(argv[1]);
    }
    else {
        fprintf(stderr, "Usage: hanoi [height] (with 0 < height < 9\n)");
        return(-1);
    }
    if (height < 1 || height > 8) {
        fprintf(stderr, "Required 0 < height < 9\n");
        return(-2);
    }
    hanoi(height, 1, 3);
    return(0);
}
