package com.leetcode;

public class RemoveDuplicatesFromSortedList {
    public ListNode deleteDuplicates(ListNode head) {
        if (head == null) return head;
        ListNode current = head;
        ListNode next = current.next;
        while (next != null) {
            if (current.val == next.val) {
                next = next.next;
                current.next = next;
            } else {
                current = next;
                next = current.next;
            }
        }
        return head;
    }
}
