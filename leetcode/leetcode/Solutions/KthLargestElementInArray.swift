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
        var list = nums
        return quickSelect(list: &list, left: 0, right: list.count - 1, k: k)
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
