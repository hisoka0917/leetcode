//
//  MedianofTwoSortedArrays.swift
//  leetcode
//
//  Created by Kai Wang on 8/12/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class MedianofTwoSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let total = nums1.count + nums2.count
        let half = total / 2
        var arrayA = [Int]()
        var arrayB = [Int]()
        if nums1.count < nums2.count {
            arrayA = nums1
            arrayB = nums2
        } else {
            arrayA = nums2
            arrayB = nums1
        }

        var l = 0
        var r = arrayA.count - 1
        while true {
            let i = l + r >= 0 ? (l + r) / 2 : -1
            let j = half - i - 2
            let leftA = i >= 0 ? arrayA[i] : Int.min
            let rightA = i + 1 < arrayA.count ? arrayA[i + 1] : Int.max
            let leftB = j >= 0 ? arrayB[j] : Int.min
            let rightB = j + 1 < arrayB.count ? arrayB[j + 1] : Int.max
            if leftA <= rightB && leftB <= rightA {
                if total % 2 == 0 {
                    // even
                    return Double(max(leftA, leftB) + min(rightA, rightB)) / 2
                } else {
                    // odd
                    return Double(min(rightA, rightB))
                }
            } else if leftA > rightB {
                r = i - 1
            } else {
                l = i + 1
            }
        }
    }

    func test() {
        let case1 = ([1,3], [2])
        let case2 = ([1,2], [3,4])
        let cases = [case1, case2]
        for input in cases {
            print(findMedianSortedArrays(input.0, input.1))
        }
    }
}
