package com.leetcode;

public class PalindromeNumber {
    public boolean isPalindrome(int x) {
        if (x < 0) return false;
        int rev = 0;
        int origin = x;
        while (x > 0) {
            int tmp = x % 10;
            rev = rev * 10 + tmp;
            if (rev > Integer.MAX_VALUE) return false;
            x /= 10;
        }
        return rev == origin;
    }
}
