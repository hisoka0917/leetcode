//
//  LRUCache.swift
//  leetcode
//
//  Created by Kai Wang on 8/28/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class LRUCache {
    class CacheNode {
        var key: Int
        var value: Int
        var next: CacheNode?
        var prev: CacheNode?

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var head = CacheNode(key: -1, value: -1)
    private var tail = CacheNode(key: -1, value: -1)
    private var cache = [Int: CacheNode]()

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }
        remove(node)
        insert(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        guard let node = cache[key] else {
            let newNode = CacheNode(key: key, value: value)
            insert(newNode)
            cache[key] = newNode
            if cache.count > capacity,
               let lru = head.next {
                remove(lru)
                cache.removeValue(forKey: lru.key)
            }

            return
        }
        node.value = value
        remove(node)
        insert(node)
    }

    private func insert(_ node: CacheNode) {
        let prev = tail.prev
        prev?.next = node
        node.prev = prev
        node.next = tail
        tail.prev = node
    }

    private func remove(_ node: CacheNode) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        node.prev = nil
        node.next = nil
    }
}
