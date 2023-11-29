import unittest
from Stack import GenerateParentheses


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (3, ["((()))", "(()())", "(())()", "()(())", "()()()"]),
            (1, ["()"])
        ]
        solution = GenerateParentheses.Solution()
        for n, expected in cases:
            self.assertEqual(expected, solution.generateParenthesis(n))


if __name__ == '__main__':
    unittest.main()
