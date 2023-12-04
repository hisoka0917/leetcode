import unittest
from BinarySearch import FindMinimuminRotatedSortedArray


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 4, 5, 1, 2], 1),
            ([4, 5, 6, 7, 0, 1, 2], 0),
            ([11, 13, 15, 17], 11)
        ]
        solution = FindMinimuminRotatedSortedArray.Solution()
        for nums, expected in cases:
            self.assertEqual(expected, solution.findMin(nums))


if __name__ == '__main__':
    unittest.main()
