import unittest
from LinkedList import LinkedListCycle
import helper


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 2, 0, -4], 1, True),
            ([1, 2], 0, True),
            ([1], -1, False)
        ]
        solution = LinkedListCycle.Solution()
        for arr, pos, expected in cases:
            head = helper.build_cycle_list(arr, pos)
            res = solution.hasCycle(head)
            self.assertEqual(expected, res)


if __name__ == '__main__':
    unittest.main()
