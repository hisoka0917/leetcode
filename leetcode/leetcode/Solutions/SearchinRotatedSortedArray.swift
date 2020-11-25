/*
You are given an integer array nums sorted in ascending order, and an integer target.

Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

If target is found in the array return its index, otherwise, return -1.



Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
Example 3:

Input: nums = [1], target = 0
Output: -1
*/

//class Solution {
//    func search(_ nums: [Int], _ target: Int) -> Int {
//    }
//}

import Foundation

class SearchinRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        let start = 0
        let end = nums.count - 1
        if nums[start] < nums[end] {
            return search(nums: nums, start: start, end: end, target: target)
        } else {
            var pivot = 0
            while pivot < nums.count - 1 && nums[pivot] < nums[pivot + 1] {
                pivot += 1
            }
            pivot += 1
            if target >= nums[start] {
                return search(nums: nums, start: 0, end: pivot - 1, target: target)
            } else {
                return search(nums: nums, start: pivot, end: nums.count - 1, target: target)
            }
        }
    }

    func search(nums: [Int], start: Int, end: Int, target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        var start = start
        var end = end
        while start <= end {
            let mid = (start + end) / 2
            if target < nums[mid] {
                end = mid - 1
            } else if target > nums[mid] {
                start = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }

    func test() {
        // [3,1] 3
        // [7,8,1,2,3,4,5,6], 2
        // [4,5,6,7,0,1,2], 0
        // [1], 0
        let input = [1]
        let target = 0
        print(search(input, target))
    }
}
