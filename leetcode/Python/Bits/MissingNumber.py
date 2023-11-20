from typing import List


class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        res = len(nums)
        for i in range(len(nums)):
            res ^= i ^ nums[i]
        return res

        # count = len(nums)
        # expectedSum = count * (count + 1) // 2
        # return expectedSum - sum(nums)
