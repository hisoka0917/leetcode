//
//  Implementstrstr.c
//  leetcode
//
//  Created by Wang Kai on 2018/8/29.
//  Copyright © 2018年 Pirate. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int strStr(char* haystack, char* needle) {
    for (int i = 0; ; i++) {
        for (int j = 0; ; j++) {
            if (j == strlen(needle)) return i;
            if (i + j == strlen(haystack)) return -1;
            if (needle[j] != haystack[i + j]) break;
        }
    }
}
