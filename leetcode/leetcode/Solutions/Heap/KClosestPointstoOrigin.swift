//
//  KClosestPointstoOrigin.swift
//  leetcode
//
//  Created by Kai Wang on 7/27/21.
//  Copyright © 2021 Pirate. All rights reserved.
//

import Foundation

class KClosestPointstoOrigin {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var pointList = [[Int]]()
        for point in points {
            let distance = point[0] * point[0] + point[1] * point[1]
            pointList.append([distance, point[0], point[1]])
        }
        let sorted = pointList.sorted(by: { $0[0] < $1[0] })
        var res = [[Int]]()
        for i in 0 ..< k {
            res.append([sorted[i][1], sorted[i][2]])
        }
        return res
    }

    func test() {
        let case1 = DataModel(points: [[1,3],[-2,2]], k: 1)
        let case2 = DataModel(points: [[3,3],[5,-1],[-2,4]], k: 2)
        let cases = [case1, case2]
        for input in cases {
            print(kClosest(input.points, input.k))
        }
    }

    struct DataModel {
        var points: [[Int]]
        var k: Int
    }
}
