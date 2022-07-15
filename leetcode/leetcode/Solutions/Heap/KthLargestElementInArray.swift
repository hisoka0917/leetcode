//
//  KthLargestElementInArray.swift
//  leetcode
//
//  Created by Wang Kai on 2018/7/25.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class KthLargestElementInArray {

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums

        func quickSelect(_ left: Int, _ right: Int) -> Int {
            // select right element as the pivot
            let pivot = nums[right]

            // Partition
            var pos = left
            for i in left ..< right {
                if nums[i] > pivot {
                    nums.swapAt(pos, i)
                    pos += 1
                }
            }
            nums.swapAt(pos, right)

            if pos > k - 1 {
                return quickSelect(left, pos - 1)
            } else if pos < k - 1 {
                return quickSelect(pos + 1, right)
            } else {
                // Kth largest index is k - 1
                return nums[pos]
            }
        }

        return quickSelect(0, nums.count - 1)
    }

    func quickSelect(list: inout [Int], left: Int, right: Int, k: Int) -> Int {
        if left == right {
            return list[left]
        }
        var pivotIndex = right
        pivotIndex = partition(list: &list, left: left, right: right, pivotIndex: pivotIndex)

        if k == pivotIndex + 1 {
            return list[pivotIndex]
        } else if k < pivotIndex + 1 {
            return quickSelect(list: &list, left: left, right: pivotIndex - 1, k: k)
        } else {
            return quickSelect(list: &list, left: pivotIndex + 1, right: right, k: k)
        }
    }

    func partition(list: inout [Int], left: Int, right: Int, pivotIndex: Int) -> Int {
        let pivotValue = list[pivotIndex]
        var i = left
        var storeIndex = left
        while i < right {
            if list[i] > pivotValue {
                list.swapAt(i, storeIndex)
                storeIndex += 1
            }
            i += 1
        }
        list.swapAt(storeIndex, right)
        return storeIndex
    }

    func test() {
        let case1 = ([3,2,1,5,6,4], 2)
        let case2 = ([3,2,3,1,2,4,5,5,6], 4)
        let cases = [case1, case2]
        for input in cases {
            print(findKthLargest(input.0, input.1))
        }
    }
}

/*** 12ms solution
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var mutableNums = nums
        return quickSelect(&mutableNums, 0, mutableNums.count - 1, k)
    }

    func quickSelect(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {

        var i = left
        var j = right

        // define pivot, choose mid
        let mid = (left + right) / 2
        let pivot = nums[mid]

        // partition
        while (i <= j) {

            // left side, move right to find a num that smaller than pivot
            while (i <= j && nums[i] > pivot) {
                i += 1
            }

            while (i <= j && nums[j] < pivot) {
                j -= 1
            }

            // swap
            if (i <= j) {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 1
                j -= 1
            }

        }

        if left + k - 1 <= j {
            return quickSelect(&nums, left, j, k)
        }

        if left + k - 1 >= i {
            return quickSelect(&nums, i, right, k - (i - left))
        }

        return nums[j+1]
    }
}
*/
