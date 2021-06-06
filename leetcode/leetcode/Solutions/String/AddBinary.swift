//
//  AddBinary.swift
//  leetcode
//
//  Created by Kai Wang on 6/6/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class AddBinary {
    func addBinary(_ a: String, _ b: String) -> String {
        var carry = 0
        var result = ""
        let aArray = Array(a)
        let bArray = Array(b)
        var aLength = aArray.count - 1
        var bLength = bArray.count - 1
        while aLength >= 0 || bLength >= 0 {
            var sum = carry
            if aLength >= 0 {
                let aNum = aArray[aLength]
                sum += Int(String(aNum)) ?? 0
                aLength -= 1
            }
            if bLength >= 0 {
                let bNum = bArray[bLength]
                sum += Int(String(bNum)) ?? 0
                bLength -= 1
            }

            let res = sum % 2
            carry = sum / 2
            result.append(String(res))
        }
        if carry > 0 {
            result.append(String(carry))
        }

        return String(result.reversed())
    }

    func test() {
        let case1 = ("11", "1")
        let case2 = ("1010", "1011")
        let case3 = ("0", "0")
        let cases = [case1, case2, case3]
        for input in cases {
            print(addBinary(input.0, input.1))
        }
    }
}
