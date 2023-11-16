class Solution:
    def isValid(self, s: str) -> bool:
        hashmap = {
            "}": "{",
            "]": "[",
            ")": "("
        }
        stack = []
        for c in s:
            if c not in hashmap:
                stack.append(c)
            else:
                if not stack or stack[-1] != hashmap[c]:
                    return False
                stack.pop()
        return not stack
