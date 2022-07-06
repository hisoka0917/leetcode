//
//  FibonacciNumber.swift
//  leetcode
//
//  Created by Kai Wang on 7/5/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class FibonacciNumber {
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var n0 = 0
        var n1 = 1
        for _ in 2 ... n {
            let num = n0 + n1
            n0 = n1
            n1 = num
        }
        return n1
    }
}
