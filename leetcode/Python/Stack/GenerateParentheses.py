from typing import List


class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = []

        def backtrack(current: str, open: int, close: int):
            if open == n and close == n:
                res.append(current)
                return
            if open < n:
                backtrack(current + "(", open + 1, close)
            if close < open:
                backtrack(current + ")", open, close + 1)

        backtrack("", 0, 0)
        return res
