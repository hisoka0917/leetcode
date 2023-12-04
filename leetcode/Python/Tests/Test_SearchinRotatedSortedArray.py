import unittest
from BinarySearch import SearchinRotatedSortedArray


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([4, 5, 6, 7, 0, 1, 2], 0, 4),
            ([4, 5, 6, 7, 0, 1, 2], 3, -1),
            ([1], 0, -1)
        ]
        solution = SearchinRotatedSortedArray.Solution()
        for nums, target, expected in cases:
            self.assertEqual(expected, solution.search(nums, target))


if __name__ == '__main__':
    unittest.main()
