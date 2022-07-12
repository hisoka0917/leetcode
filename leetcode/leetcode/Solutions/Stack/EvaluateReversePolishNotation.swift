//
//  EvaluateReversePolishNotation.swift
//  leetcode
//
//  Created by Kai Wang on 7/11/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class EvaluateReversePolishNotation {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        let operators = Set<String>(["+", "-", "*", "/"])
        for token in tokens {
            if operators.contains(token) {
                let right = stack.removeLast()
                let left = stack.removeLast()
                switch token {
                    case "+":
                        stack.append(left + right)
                    case "-":
                        stack.append(left - right)
                    case "*":
                        stack.append(left * right)
                    case "/":
                        stack.append(left / right)
                    default:
                        break
                }
            } else {
                stack.append(Int(token)!)
            }
        }
        return stack.removeLast()
    }

    func test() {
        let case1 = ["2","1","+","3","*"]
        let case2 = ["4","13","5","/","+"]
        let case3 = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
        let cases = [case1, case2, case3]
        for input in cases {
            print(evalRPN(input))
        }
    }
}
