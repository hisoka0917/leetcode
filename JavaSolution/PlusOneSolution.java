package com.company;

public class PlusOneSolution {
    public int[] plusOne(int[] digits) {
        int ex = 1;
        for (int i = digits.length - 1; i >= 0 ; i--) {
            int d = digits[i];
            d += ex;
            if (d >= 10) {
                ex = 1;
                d -= 10;
            } else {
                ex = 0;
            }
            digits[i] = d;
        }
        if (ex > 0) {
            int[] result = new int[digits.length + 1];
            result[0] = ex;
            for (int i = 0; i < digits.length; i++) {
                result[i + 1] = digits[i];
            }
            return result;
        } else {
            return digits;
        }
    }
}
