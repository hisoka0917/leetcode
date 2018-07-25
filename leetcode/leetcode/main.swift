//
//  main.swift
//  leetcode
//
//  Created by Wang Kai on 2017/11/20.
//  Copyright © 2017年 Pirate. All rights reserved.
//

import Foundation

let nums = [3,2,3,1,2,4,5,5,6]
let k = 7
let solution = KthLargestElementInArray()
let i = solution.findKthLargest(nums, k)
print(i)
