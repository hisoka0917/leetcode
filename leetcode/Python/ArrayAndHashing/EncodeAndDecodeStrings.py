from typing import List


class Solution:

    def encode(self, strs: List[str]) -> str:
        if not strs:
            return ""
        sizes, res = [], ""
        for s in strs:
            sizes.append(len(s))
        for sz in sizes:
            res += str(sz)
            res += ','

        res += '#'
        for s in strs:
            res += s
        return res

    def decode(self, s: str) -> List[str]:
        if not s:
            return []
        i = 0
        sizes = []
        while s[i] != '#':
            sz = ""
            while s[i] != ',':
                sz += s[i]
                i += 1
            sizes.append(int(sz))
            i += 1

        i += 1
        res = []
        for sz in sizes:
            res.append(s[i : i + sz])
            i += sz
        return res
