//
//  RegularExpressionMatching.swift
//  leetcode
//
//  Created by Wang Kai on 2018/3/23.
//  Copyright © 2018年 Pirate. All rights reserved.
//

import Foundation

class RegularExpressionMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var s = s
        var p = p
        var match = false
        repeat {
            (match, p, s) = matchOnce(s, p)
        } while match && !p.isEmpty
        return match
    }

    func matchOnce(_ s: String, _ p: String) -> (Bool, String, String) {
        var regex = p
        var s = s
        var remain: Character! = s.last
        while !s.isEmpty {
            if let char = s.last {
                remain = char
                if let lastP = regex.last {
                    if lastP == "*" {
                        let repeatCh = regex[regex.index(regex.endIndex, offsetBy: -2)]
                        if repeatCh == "." {
                            s.removeLast()
                        } else {
                            if repeatCh == char {
                                s.removeLast()
                            } else {
                                regex.removeLast(2)
                            }
                        }
                    } else if lastP == "." {
                        s.removeLast()
                        regex.removeLast()
                    } else {
                        if char == lastP {
                            s.removeLast()
                            regex.removeLast()
                        } else {
                            return (false, regex, s)
                        }
                    }
                } else {
                    return (false, regex, s)
                }
            }
        }

        if !regex.isEmpty {
            if let last = regex.last, last == "*" {
                regex.removeLast(2)
            }
            return (true, regex, String(describing: remain))
        } else {
            return (true, regex, "")
        }
    }
    /*
    func isMatch(_ s: String, _ p: String) -> Bool {
        var match = true
        var regex = p
        var s = s
        var cr: Character? = nil
        while !s.isEmpty {
            let char = s.first
            if let firstReg = regex.first, firstReg == "." {
                cr = char
                regex.removeFirst()
                s.removeFirst()
                if let second = regex.first, second == "*" {
                    regex.insert(firstReg, at: regex.startIndex)
                    continue
                }
            }
            if let firstReg = regex.first, firstReg == "*" {
                if cr == char {
                    s.removeFirst()
                    continue
                } else {
                    regex.removeFirst()
                }
            }
            if let firstReg = regex.first {
                regex.removeFirst()
                if let second = regex.first, second == "*" {
                    if firstReg == char {
                        //regex.insert(firstReg, at: regex.startIndex)
                        cr = firstReg
                        s.removeFirst()
                        continue
                    } else {
                        regex.removeFirst()
                    }
                } else {
                    if firstReg != char {
                        return false
                    } else {
                        s.removeFirst()
                    }
                }
            } else {
                match = false
                break
            }
        }

        if match {
            if let index = regex.index(of: "*") {
                regex.removeSubrange(regex.index(before: index)...index)
            }
            match = regex.isEmpty
        }
        return match
    }
 */
}
