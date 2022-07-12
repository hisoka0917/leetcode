//
//  GenerateParentheses.swift
//  leetcode
//
//  Created by Kai Wang on 7/11/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class GenerateParentheses {
    func generateParenthesis(_ n: Int) -> [String] {
        // only add open parenthesis if open < n
        // only add close parenthesis if close < open
        // validate IIF open == close == n
        var res = [String]()

        func backtrack(_ current: String, _ countOpen: Int, _ countClose: Int) {
            if countOpen == n && countClose == n {
                res.append(current)
                return
            }
            if countOpen < n {
                backtrack(current + "(", countOpen + 1, countClose)
            }
            if countClose < countOpen {
                backtrack(current + ")", countOpen, countClose + 1)
            }
        }

        backtrack("", 0, 0)

        return res
    }

    func test() {
        let cases = [3, 1]
        for input in cases {
            print(generateParenthesis(input))
        }
    }
}
