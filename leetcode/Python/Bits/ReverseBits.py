class Solution:
    def reverseBits(self, n: int) -> int:
        res = 0
        for i in range(32):
            bit = (n >> i) & 1
            res += bit << (31 - i)
            # res = res << 1
            # res |= n & 1
            # n = n >> 1
        return res
