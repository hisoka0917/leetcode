import unittest
from ArrayAndHashing import TopKFrequentElements


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([3, 0, 1, 0], 1, [0]),
            ([1, 1, 1, 2, 2, 3], 2, [1, 2]),
            ([1], 1, [1])
        ]
        solution = TopKFrequentElements.Solution()
        for nums, k, expected in cases:
            self.assertEqual(expected, solution.topKFrequent(nums, k))


if __name__ == '__main__':
    unittest.main()
