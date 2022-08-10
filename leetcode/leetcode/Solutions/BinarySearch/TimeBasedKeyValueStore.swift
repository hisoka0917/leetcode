//
//  TimeBasedKeyValueStore.swift
//  leetcode
//
//  Created by Kai Wang on 8/9/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TimeMap {
    var store: [String: [(timestamp: Int, value: String)]]

    init() {
        self.store = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((timestamp: timestamp, value: value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let array = store[key], !array.isEmpty else {
            return ""
        }
        var left = 0
        var right = array.count - 1
        var res = ""
        while left <= right {
            let mid = (left + right) / 2
            if array[mid].timestamp <= timestamp {
                res = array[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return res
    }

    static func test() {
        let timeMap = TimeMap()
        timeMap.set("love", "high", 10)
        timeMap.set("love", "low", 20)
        print(timeMap.get("love", 5))
        print(timeMap.get("love", 10))
        print(timeMap.get("love", 15))
        print(timeMap.get("love", 20))
        print(timeMap.get("love", 25))
    }
}
