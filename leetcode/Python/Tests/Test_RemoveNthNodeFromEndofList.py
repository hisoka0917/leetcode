import unittest
from LinkedList import RemoveNthNodeFromEndofList
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3, 4, 5], 2, [1, 2, 3, 5]),
            ([1], 1, []),
            ([1, 2], 1, [1])
        ]
        solution = RemoveNthNodeFromEndofList.Solution()
        for arr, n, expected in cases:
            head = helper.array_to_linked_list(arr)
            res = solution.removeNthFromEnd(head, n)
            self.assertEqual(expected, helper.list_to_array(res))


if __name__ == '__main__':
    unittest.main()
