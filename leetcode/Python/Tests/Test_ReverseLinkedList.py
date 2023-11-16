import unittest
from LinkedList import ReverseLinkedList
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
            ([1, 2], [2, 1]),
            ([], [])
        ]
        solution = ReverseLinkedList.Solution()
        for case, expected in cases:
            head = helper.array_to_linked_list(case)
            res = solution.reverseList(head)
            self.assertEqual(expected, helper.list_to_array(res))


if __name__ == '__main__':
    unittest.main()
