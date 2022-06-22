//
//  ValidAnagram.swift
//  leetcode
//
//  Created by Kai Wang on 6/21/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class ValidAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var mapS = [String: Int]()
        for char in s {
            if let count = mapS[String(char)] {
                mapS[String(char)] = count + 1
            } else {
                mapS[String(char)] = 1
            }
        }
        for char in t {
            guard let count = mapS[String(char)] else {
                return false
            }
            let remain = count - 1
            if remain == 0 {
                mapS.removeValue(forKey: String(char))
            } else {
                mapS[String(char)] = remain
            }
        }
        return mapS.isEmpty
    }

    func test() {
        let case1 = ("anagram", "nagaram")
        let case2 = ("rat", "car")
        let cases = [case1, case2]
        for input in cases {
            print(isAnagram(input.0, input.1))
        }
    }
}
