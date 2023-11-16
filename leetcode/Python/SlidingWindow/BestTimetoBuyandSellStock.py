from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        res = 0
        lowest = prices[0]
        for price in prices:
            if price < lowest:
                lowest = price
            res = max(res, price - lowest)

        return res

    def twoPointerSolution(self, prices: List[int]) -> int:
        if len(prices) == 1:
            return 0
        res = 0
        l, r = 0, 1
        while r < len(prices):
            diff = prices[r] - prices[l]
            if prices[r] - prices[l] < 0:
                l = r
            else:
                res = max(res, diff)
            r += 1
        return res
