//
//  ReverseInteger.swift
//  leetcode
//
//  Created by Wang Kai on 2017/11/20.
//  Copyright © 2017年 Pirate. All rights reserved.
//

import Foundation

class ReverseInteger {
    func reverse(_ x: Int) -> Int {
        var reverseInt = 0
        var inputX = x
        while inputX != 0 {
            reverseInt = reverseInt * 10 + inputX % 10
            inputX = inputX / 10
            if reverseInt > Int32.max || reverseInt < Int32.min {
                return 0
            }
        }
        return reverseInt
    }
}
