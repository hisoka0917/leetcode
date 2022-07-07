//
//  GroupAnagrams.swift
//  leetcode
//
//  Created by Kai Wang on 7/6/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [[Character: Int]: [String]]()
        strs.forEach { str in
            let keyDict = str.reduce(into: [:]) { counts, letter in
                counts[letter, default: 0] += 1
            }
            map[keyDict, default: []].append(str)
        }
        return Array(map.values)

//        var map = [[Int]: [String]]()
//
//        for str in strs {
//            var lettersCount = [Int](repeating: 0, count: 26)
//            for char in str {
//                let value = Int(char.asciiValue! - Character("a").asciiValue!)
//                lettersCount[value] += 1
//            }
//            map[lettersCount, default: [String]()].append(str)
//        }
//
//        return Array(map.values)
    }

    func test() {
        let case1 = ["eat","tea","tan","ate","nat","bat"]
        let case2 = [""]
        let case3 = ["a"]
        let cases = [case1, case2, case3]
        for input in cases {
            print(groupAnagrams(input))
        }
    }
}
