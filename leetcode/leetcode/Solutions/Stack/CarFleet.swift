//
//  CarFleet.swift
//  leetcode
//
//  Created by Kai Wang on 8/8/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class CarFleet {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let pairs = zip(position, speed).sorted { $0.0 < $1.0 }
        var stack = [Double]()
        for (p, s) in pairs.reversed() {
            let arrival = Double(target - p) / Double(s)
            if stack.isEmpty || arrival > stack.last! {
                stack.append(arrival)
            }
//            guard let last = stack.last, last >= arrival else {
//                stack.append(arrival)
//                continue
//            }
        }
        return stack.count
    }

    func test() {
        let case1 = (12, [10,8,0,5,3], [2,4,1,1,3])
        let case2 = (10, [3], [3])
        let case3 = (100, [0,2,4], [4,2,1])
        let cases = [case1, case2, case3]
        for input in cases {
            print(carFleet(input.0, input.1, input.2))
        }
    }
}
