import collections
from typing import List


class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        ans = collections.defaultdict(list)
        for s in strs:
            count = [0] * 26
            for c in s:
                count[ord(c) - ord('a')] += 1
            ans[tuple(count)].append(s)
        return ans.values()

        """
        Two ways to compare anagrams:
        1. counter of words -> takes O(K) time to build counter, but takes O(N) time to find the matching counter
        2. sorted string -> takes O(klogk) time to sort, where k is the length of word, but comparison in O(1) time
        """
        # seen = defaultdict(list)
        # for word in strs:
        #     seen[''.join(sorted(word))].append(word)
        # return [grouped_strs for grouped_strs in seen.values()]