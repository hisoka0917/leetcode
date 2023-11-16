from typing import Optional

from datastructure.singlelistnode import ListNode


class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        dummy = node = ListNode()

        while list1 and list2:
            if list1.val < list2.val:
                node.next = list1
                list1 = list1.next
            else:
                node.next = list2
                list2 = list2.next
            node = node.next

        node.next = list1 or list2

        return dummy.next

    def solution2(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        head = ListNode(0)
        curr = head
        while list1 or list2:
            if not list1:
                curr.next = list2
                break
            if not list2:
                curr.next = list1
                break
            if list1.val < list2.val:
                curr.next = ListNode(list1.val)
                curr = curr.next
                list1 = list1.next
            else:
                curr.next = ListNode(list2.val)
                curr = curr.next
                list2 = list2.next
        return head.next
