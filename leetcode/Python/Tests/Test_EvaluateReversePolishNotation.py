import unittest
from Stack import EvaluateReversePolishNotation


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            (["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"], 22),
            (["4", "13", "5", "/", "+"], 6),
            (["2", "1", "+", "3", "*"], 9)
        ]
        solution = EvaluateReversePolishNotation.Solution()
        for tokens, expected in cases:
            self.assertEqual(expected, solution.evalRPN(tokens))


if __name__ == '__main__':
    unittest.main()
