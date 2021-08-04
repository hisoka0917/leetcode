//
//  DecodeString.swift
//  leetcode
//
//  Created by Kai Wang on 8/3/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class DecodeString {
    func decodeString(_ s: String) -> String {
        var stack = [String]()
        for char in s {
            if char != "]" {
                stack.append(String(char))
            } else {
                var substr = ""
                while stack.last! != "[" {
                    substr = String(stack.removeLast()) + substr
                }
                stack.removeLast()
                var k = ""
                while "0123456789".contains(stack.last ?? "") {
                    k = String(stack.removeLast()) + k
                }
                stack.append(String(repeating: substr, count: Int(k)!))
            }
        }
        return stack.joined()
    }

    func test() {
        let case1 = "3[a]2[bc]"
        let case2 = "3[a2[c]]"
        let case3 = "2[abc]3[cd]ef"
        let case4 = "abc3[cd]xyz"
        let cases = [case1, case2, case3, case4]
        for input in cases {
            print(decodeString(input))
        }
    }
}
