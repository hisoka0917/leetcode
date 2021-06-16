//
//  MergeSortedArray.swift
//  leetcode
//
//  Created by Kai Wang on 6/15/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class MergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var i = m + n - 1
        while p2 >= 0 {
            if p1 >= 0 && nums1[p1] > nums2[p2] {
                nums1[i] = nums1[p1]
                p1 -= 1
            } else {
                nums1[i] = nums2[p2]
                p2 -= 1
            }
            i -= 1
        }
    }

    func test() {
        let case1 = DataModel(nums1: [1,2,3,0,0,0], m: 3, nums2: [2,5,6], n: 3)
        let case2 = DataModel(nums1: [1], m: 1, nums2: [], n: 0)
        let case3 = DataModel(nums1: [0], m: 0, nums2: [1], n: 1)
        let case4 = DataModel(nums1: [4,5,6,0,0,0], m: 3, nums2: [1,2,3], n: 3)
        let case5 = DataModel(nums1: [4,0,0,0,0,0], m: 1, nums2: [1,2,3,5,6], n: 5)
        let case6 = DataModel(nums1: [1,2,4,5,6,0], m: 5, nums2: [3], n: 1)
        let case7 = DataModel(nums1: [-1,0,0,3,3,3,0,0,0], m: 6, nums2: [1,2,2], n: 3)

        let cases = [case1, case2, case3, case4, case5, case6, case7]
        for input in cases {
            var nums1 = input.nums1
            let m = input.m
            let nums2 = input.nums2
            let n = input.n
            merge(&nums1, m, nums2, n)
            print(nums1)
        }
    }

    struct DataModel {
        var nums1: [Int]
        var m: Int
        var nums2: [Int]
        var n: Int
    }
}
