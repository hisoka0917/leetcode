//
//  Trie.swift
//  leetcode
//
//  Created by Kai Wang on 7/15/22.
//  Copyright © 2022 Pirate. All rights reserved.
//

import Foundation

class TrieNode {
    var children = [UInt16: TrieNode]()
    var endOfWord = false
}

class Trie {
    var root: TrieNode

    init() {
        root = TrieNode()
    }

    func insert(_ word: String) {
        var current = root
        for char in Array(word.utf16) {
            if !current.children.keys.contains(char) {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.endOfWord = true
    }

    func search(_ word: String) -> Bool {
        var current = root
        for char in Array(word.utf16) {
            guard let childNode = current.children[char] else {
                return false
            }
            current = childNode
        }
        return current.endOfWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var current = root
        for char in Array(prefix.utf16) {
            guard let childNode = current.children[char] else {
                return false
            }
            current = childNode
        }
        return true
    }
}
