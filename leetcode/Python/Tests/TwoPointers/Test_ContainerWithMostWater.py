import unittest
from TwoPointers import ContainerWithMostWater


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ([1,8,6,2,5,4,8,3,7], 49),
            ([1,1], 1)
        ]
        solution = ContainerWithMostWater.Solution()
        for height, expected in cases:
            output = solution.maxArea(height)
            self.assertEqual(expected, output)


if __name__ == '__main__':
    unittest.main()
