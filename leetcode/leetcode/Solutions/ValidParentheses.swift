//
//  ValidParentheses.swift
//  leetcode
//
//  Created by Wang Kai on 2018/3/22.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for char in s {
            switch char {
            case "(", "[", "{":
                stack.append(char)
            case ")":
                if let top = stack.last, top == "(" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            case "]":
                if let top = stack.last, top == "[" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            case "}":
                if let top = stack.last, top == "{" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            default:
                break
            }
        }
        return stack.isEmpty
    }
}
