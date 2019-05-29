package com.leetcode;

public class ReverseLinkedList {
    public ListNode reverseList(ListNode head) {
        ListNode prev = null;
        while (head != null) {
            ListNode next = head.next;
            head.next = prev;
            prev = head;
            head = next;
        }
        return prev;
    }

    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        ListNode list = new ListNode(arr);
        ReverseLinkedList solution = new ReverseLinkedList();
        System.out.println(solution.reverseList(list).toList());
    }
}
