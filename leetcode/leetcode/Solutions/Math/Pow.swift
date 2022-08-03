//
//  Pow.swift
//  leetcode
//
//  Created by Kai Wang on 8/2/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class Pow {
    func myPow(_ x: Double, _ n: Int) -> Double {

        func recursion(_ n: Int) -> Double {
            guard n != 0 else { return 1 }
            guard x != 0 else { return 0 }

            let res = recursion(n / 2)
            return n % 2 == 0 ? res * res : res * res * x
        }

        let res = recursion(abs(n))
        return n < 0 ? 1 / res : res
    }

    func test() {
        let case1 = (2.00000, 10)
        let case2 = (2.10000, 3)
        let case3 = (2.00000, -2)
        let cases = [case1, case2, case3]
        for input in cases {
            print(myPow(input.0, input.1))
        }
    }
}
