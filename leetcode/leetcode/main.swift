//
//  main.swift
//  leetcode
//
//  Created by Wang Kai on 2017/11/20.
//  Copyright © 2017年 Pirate. All rights reserved.
//

import Foundation

let solution = MergeTwoSortedLists()
let l1 = arrayToList([1,5,9,21])
let l2 = arrayToList([3,6,7,10,12,41])
let result = solution.mergeTwoLists(l1, l2)

print(listToArray(result))
