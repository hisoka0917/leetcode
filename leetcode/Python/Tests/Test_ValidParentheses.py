import unittest
from Stack import ValidParentheses


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ("()", True),
            ("()[]{}", True),
            ("(}", False)
        ]
        solution = ValidParentheses.Solution()
        for case, expected in cases:
            self.assertEqual(expected, solution.isValid(case))


if __name__ == '__main__':
    unittest.main()
