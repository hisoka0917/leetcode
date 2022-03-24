//
//  BoatstoSavePeople.swift
//  leetcode
//
//  Created by Kai Wang on 3/24/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class BoatstoSavePeople {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted()
        var start = 0
        var end = people.count - 1
        var numOfBoats = 0

        while start <= end {
            let startW = people[start]
            let endW = people[end]
            let sumW = startW + endW

            if sumW > limit {
                end -= 1
            } else {
                start += 1
                end -= 1
            }
            numOfBoats += 1
        }
        return numOfBoats
    }

    func test() {
        let case1 = DataModel(people: [1,2], limit: 3)
        let case2 = DataModel(people: [3,2,2,1], limit: 3)
        let case3 = DataModel(people: [3,5,3,4], limit: 5)
        let cases = [case1, case2, case3]
        for input in cases {
            print(numRescueBoats(input.people, input.limit))
        }
    }

    struct DataModel {
        let people: [Int]
        let limit: Int
    }
}
