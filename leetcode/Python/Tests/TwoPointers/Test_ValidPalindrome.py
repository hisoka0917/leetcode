import unittest
from TwoPointers import ValidPalindrome


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ("A man, a plan, a canal: Panama", True),
            ("race a car", False),
            (" ", True)
        ]
        solution = ValidPalindrome.Solution()
        for case, expected in cases:
            self.assertEqual(expected, solution.isPalindrome(case))


if __name__ == '__main__':
    unittest.main()
