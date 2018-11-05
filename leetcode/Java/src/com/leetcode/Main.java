package com.leetcode;

import java.util.ArrayList;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        RemoveDuplicatesFromSortedList solution = new RemoveDuplicatesFromSortedList();
        int[] array = {};
        ListNode list = new ListNode(array);
        ListNode removed = solution.deleteDuplicates(list);
        ArrayList<Integer> result = removed.toList();

        System.out.println(result);
    }
}
