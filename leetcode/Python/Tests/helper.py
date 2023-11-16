from typing import Optional

from datastructure.singlelistnode import ListNode


def list_to_array(head: Optional[ListNode]) -> [int]:
    res = []
    curr = head
    while curr:
        res.append(curr.val)
        curr = curr.next
    return res


def array_to_linked_list(arr: [int]) -> Optional[ListNode]:
    dummy = ListNode(0)
    head = dummy
    for i in arr:
        node = ListNode(i)
        head.next = node
        head = node
    return dummy.next


def build_cycle_list(arr: [int], pos: int) -> Optional[ListNode]:
    dummy = ListNode()
    tail = dummy
    for i in arr:
        temp = ListNode(i)
        tail.next = temp
        tail = temp

    node = dummy
    while pos >= 0:
        node = node.next
        pos -= 1
    if node != dummy:
        tail.next = node

    return dummy.next
