//
//  WordBreak.swift
//  leetcode
//
//  Created by Kai Wang on 8/5/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[s.count] = true
        let string = Array(s)
        for i in stride(from: string.count - 1, to: -1, by: -1) {
            for word in wordDict {
                if i + word.count <= string.count && word == String(string[i ..< i + word.count]) {
                    dp[i] = dp[i + word.count]
                }
                if dp[i] {
                    break
                }
            }
        }

        return dp[0]
    }

//    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//            guard s.count>0, wordDict.count>0 else { return false }
//            var isMatch = Array(repeating: false, count: s.count)
//
//            for i in 0..<s.count {
//                let substring = String(s.prefix(i+1))
//
//                for word in wordDict where substring.hasSuffix(word){
//                    let preIndex = i-word.count
//
//                    if preIndex<0 || preIndex>=0 && isMatch[preIndex] {
//                        isMatch[i] = true
//                        break
//                    }
//                }
//            }
//            return isMatch[s.count-1]
//        }

    func test() {
        let case1 = DataModel(s: "leetcode", wordDict: ["leet", "code"])
        let case2 = DataModel(s: "applepenapple", wordDict: ["apple","pen"])
        let case3 = DataModel(s: "catsandog", wordDict: ["cats","dog","sand","and","cat"])
        let cases = [case1, case2, case3]
        for input in cases {
            print(wordBreak(input.s, input.wordDict))
        }
    }

    struct DataModel {
        var s: String
        var wordDict: [String]
    }
}
