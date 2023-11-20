from typing import List


class Solution:
    def countBits(self, n: int) -> List[int]:
        dp = [0] * (n + 1)
        offset = 1
        for i in range(1, n + 1):
            if i == offset * 2:
                offset = i
            dp[i] = 1 + dp[i - offset]
            # ans[i] = ans[i >> 1] + (i & 1)
        return dp
