class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        char_index = {}
        max_length = 0
        left = 0
        for i, char in enumerate(s):
            if char in char_index:
                left = max(left, char_index[char] + 1)
            max_length = max(max_length, i - left + 1)
            char_index[char] = i
        return max_length
