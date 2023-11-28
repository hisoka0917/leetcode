import unittest
from SlidingWindow import LongestSubstringWithoutRepeatingCharacters


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ("tmmzuxt", 5),
            ("abcabcbb", 3),
            ("bbbbb", 1),
            ("pwwkew", 3)
        ]
        solution = LongestSubstringWithoutRepeatingCharacters.Solution()
        for s, expected in cases:
            self.assertEqual(expected, solution.lengthOfLongestSubstring(s))


if __name__ == '__main__':
    unittest.main()
