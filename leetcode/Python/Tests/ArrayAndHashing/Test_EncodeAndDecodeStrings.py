import unittest
from ArrayAndHashing import EncodeAndDecodeStrings


class MyTestCase(unittest.TestCase):
    def test_solution(self):
        cases = [
            ["neet", "code", "love", "you"],
            ["we", "say", ":", "yes"]
        ]
        solution = EncodeAndDecodeStrings.Solution()
        for s in cases:
            encoded = solution.encode(s)
            decoded = solution.decode(encoded)
            self.assertEqual(s, decoded)


if __name__ == '__main__':
    unittest.main()
