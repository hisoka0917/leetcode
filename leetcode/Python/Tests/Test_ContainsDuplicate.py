import unittest
from ArrayAndHashing import ContainsDuplicate


class TestContainsDuplicate(unittest.TestCase):

    def test_solution(self):
        cases = [
            ([1, 2, 3, 1], True),
            ([1, 2, 3, 4], False),
            ([1, 1, 1, 3, 3, 4, 3, 2, 4, 2], True)
        ]
        solution = ContainsDuplicate.Solution()
        for case, expected in cases:
            self.assertEqual(expected, solution.containsDuplicate(case))


if __name__ == '__main__':
    unittest.main()
