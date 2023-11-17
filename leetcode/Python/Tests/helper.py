from typing import Optional

from datastructure.singlelistnode import ListNode
from datastructure.binarytree import TreeNode


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


def array_to_binary_tree(arr: [int]) -> Optional[TreeNode]:
    if not arr:
        return None

    nodes = [TreeNode(x) if x is not None else None for x in arr]
    for i in range(len(arr)):
        if i * 2 + 1 < len(arr):
            nodes[i].left = nodes[i * 2 + 1]
        if i * 2 + 2 < len(arr):
            nodes[i].right = nodes[i * 2 + 2]

    return nodes[0]


def tree_to_array(root: Optional[TreeNode]) -> [int]:
    if not root:
        return []
    res = []
    node_queue = [root]
    while node_queue:
        length = len(node_queue)
        for i in range(length):
            node = node_queue.pop(0)
            res.append(node.val)
            node_queue.append(node.left)
            node_queue.append(node.right)
        if all((x is None for x in node_queue)):
            break

    return res
