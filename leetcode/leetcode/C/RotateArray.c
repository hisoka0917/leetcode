//
//  RotateArray.c
//  leetcode
//
//  Created by Wang Kai on 2018/9/3.
//  Copyright © 2018年 Pirate. All rights reserved.
//

#include <stdio.h>

void rotateArray(int* nums, int numsSize, int k) {
    k %= numsSize;
    int *rotated = (int *)malloc(sizeof(int) * numsSize);
    memcpy(rotated, nums + numsSize - k, sizeof(int) * k);
    memcpy(rotated + k, nums, sizeof(int) * (numsSize - k));
    memcpy(nums, rotated, sizeof(int) * numsSize);
}
