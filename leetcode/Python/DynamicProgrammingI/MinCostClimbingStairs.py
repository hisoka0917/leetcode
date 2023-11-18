from typing import List


class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        for i in range(len(cost) - 3, -1, -1):
            cost[i] += min(cost[i + 1], cost[i + 2])

        return min(cost[0], cost[1])

    def extra_space_solution(self, cost: List[int]) -> int:
        minCosts = [0] * len(cost)
        minCosts[0], minCosts[1] = cost[0], cost[1]
        for i in range(2, len(cost)):
            minCosts[i] = min(minCosts[i - 2], minCosts[i - 1]) + cost[i]

        return min(minCosts[-1], minCosts[-2])
