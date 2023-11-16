import unittest
from LinkedList import MergeTwoSortedLists
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1, 2, 4], [1, 3, 4], [1, 1, 2, 3, 4, 4]),
            ([], [], []),
            ([], [0], [0])
        ]
        solution = MergeTwoSortedLists.Solution()
        for list1, list2, expected in cases:
            head1 = helper.array_to_linked_list(list1)
            head2 = helper.array_to_linked_list(list2)
            res = solution.mergeTwoLists(head1, head2)
            self.assertEqual(expected, helper.list_to_array(res))


if __name__ == '__main__':
    unittest.main()
