from typing import List


class Solution:
    def findMin(self, nums: List[int]) -> int:
        start, end = 0, len(nums) - 1
        curr_min = float("inf")

        while start < end:
            mid = (start + end) // 2
            curr_min = min(curr_min, nums[mid])

            if nums[mid] < nums[end]:
                end = mid - 1
            else:
                start = mid + 1
        return min(curr_min, nums[start])
