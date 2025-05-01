#include <stdio.h>
#include <inttypes.h>
#include "hanoi.h"

void move(uint32_t disc, uint8_t from, uint8_t to) {
    printf(" Move Disc %d From %d To %d\n", disc, from, to);
}

void hanoi(uint32_t tower_height, uint8_t from, uint8_t to) {
    if (tower_height == 1) {
        move(tower_height, from, to);
    }
    else {
        uint8_t inter = 6 - from - to;
        hanoi(tower_height-1, from, inter);
        move(tower_height, from, to);
        hanoi(tower_height-1, inter, to);
    }
}


