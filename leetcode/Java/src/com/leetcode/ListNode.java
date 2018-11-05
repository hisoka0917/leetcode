package com.leetcode;

import java.util.ArrayList;

public class ListNode {
    int val;
    ListNode next;

    ListNode(int x) {
        val = x;
    }

    ListNode(int[] array) {
        if (array.length == 0) return;
        val = array[0];
        ListNode p = this;
        for(int i = 1; i < array.length; i++) {
            ListNode tmp = new ListNode(array[i]);
            p.next = tmp;
            p = p.next;
        }
    }

    public ArrayList<Integer> toList() {
        ArrayList<Integer> array = new ArrayList<>();
        ListNode node = this;
        while (node != null) {
            array.add(node.val);
            node = node.next;
        }
        return array;
    }
}
