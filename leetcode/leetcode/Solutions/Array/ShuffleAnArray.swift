//
//  ShuffleAnArray.swift
//  leetcode
//
//  Created by Kai Wang on 7/20/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class ShuffleAnArray {
    private var original: [Int]
    init(_ nums: [Int]) {
        original = nums
    }

    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return original
    }

    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        return original.shuffled()
    }
}
