import unittest
from SlidingWindow import LongestRepeatingCharacterReplacement


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ("ABAB", 2, 4),
            ("AABABBA", 1, 4)
        ]
        solution = LongestRepeatingCharacterReplacement.Solution()
        for s, k, expected in cases:
            self.assertEqual(expected, solution.characterReplacement(s, k))


if __name__ == '__main__':
    unittest.main()
