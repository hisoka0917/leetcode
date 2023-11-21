import collections
from typing import List


class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        count = {}
        freq = [[] for i in range(len(nums) + 1)]
        for n in nums:
            count[n] = 1 + count.get(n, 0)
        for n, c in count.items():
            freq[c].append(n)

        res = []
        for i in range(len(freq) - 1, 0, -1):
            for n in freq[i]:
                res.append(n)
                if len(res) == k:
                    return res

        # counter = {}
        # for n in nums:
        #     counter[n] = 1 + counter.get(n, 0)
        # res = sorted(counter.items(), key=lambda x: x[1], reverse=True)
        # topK = res[:k]
        # return list(map(lambda x: x[0], topK))
