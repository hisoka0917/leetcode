class Solution:
    def isHappy(self, n: int) -> bool:
        slow, fast = n, self.sumSquare(n)
        while slow != fast:
            slow = self.sumSquare(slow)
            fast = self.sumSquare(fast)
            fast = self.sumSquare(fast)
        return fast == 1

    def sumSquare(self, n: int) -> int:
        output = 0
        while n:
            output += (n % 10) ** 2
            n = n // 10
        return output

    def hash_set_solution(self, n: int) -> bool:
        visit = set()
        while n not in visit:
            visit.add(n)
            n = self.sumSquare(n)
            if n == 1:
                return True
        return False

