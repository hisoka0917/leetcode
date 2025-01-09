import unittest
from ArrayAndHashing import ValidAnagram


class MyTestCase(unittest.TestCase):

    def test_solution(self):
        cases = [
            (("anagram", "nagaram"), True),
            (("rat", "car"), False)
        ]
        solution = ValidAnagram.Solution()
        for case, expected in cases:
            self.assertEqual(expected, solution.isAnagram(case[0], case[1]))


if __name__ == '__main__':
    unittest.main()
