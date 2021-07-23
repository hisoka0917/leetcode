//
//  VerifyinganAlienDictionary.swift
//  leetcode
//
//  Created by Kai Wang on 7/22/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class VerifyinganAlienDictionary {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else {
            return true
        }
        let dictionary = order.enumerated().reduce(into: [Character: Int]()) { dict, element in
            dict[element.1] = element.0
        }
        var prev = words[0].map({ dictionary[$0]! })
        for i in 1 ..< words.count {
            let curr = words[i].map({ dictionary[$0]! })
            var j = 0
            var inorder = false
            while j < prev.count && j < curr.count {
                if prev[j] < curr[j] {
                    inorder = true
                    break
                } else if prev[j] > curr[j] {
                    return false
                } else {
                    j += 1
                }
            }
            if !inorder && j == curr.count && j < prev.count {
                return false
            }
            prev = curr
        }
        return true
    }

    func test() {
        let case1 = DataModel(words: ["hello","leetcode"], order: "hlabcdefgijkmnopqrstuvwxyz")
        let case2 = DataModel(words: ["word","world","row"], order: "worldabcefghijkmnpqstuvxyz")
        let case3 = DataModel(words: ["apple","app"], order: "abcdefghijklmnopqrstuvwxyz")
        let cases = [case1, case2, case3]
        for input in cases {
            print(isAlienSorted(input.words, input.order))
        }
    }

    struct DataModel {
        var words: [String]
        var order: String
    }
}
