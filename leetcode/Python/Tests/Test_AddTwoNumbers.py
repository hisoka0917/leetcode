import unittest
from LinkedList import AddTwoNumbers
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([2, 4, 3], [5, 6, 4], [7, 0, 8]),
            ([0], [0], [0]),
            ([9, 9, 9, 9, 9, 9, 9], [9, 9, 9, 9], [8, 9, 9, 9, 0, 0, 0, 1])
        ]
        solution = AddTwoNumbers.Solution()
        for arr1, arr2, expected in cases:
            l1 = helper.array_to_linked_list(arr1)
            l2 = helper.array_to_linked_list(arr2)
            res = solution.addTwoNumbers(l1, l2)
            self.assertEqual(expected, helper.list_to_array(res))


if __name__ == '__main__':
    unittest.main()
