import sys
from typing import List

def main():
    ans = 0
    for line in sys.stdin:
        target, nums = line[:-1].split(': ')
        target = int(target)
        nums_a = []
        for num in nums.split(' '):
            nums_a.append(int(num))

        if isComputable(nums_a, target):
            ans += target

    print(ans)


'''
a b c d
+ * +
'''
def compute(operands: List[int], operators: List[str]) -> int:
    def expr(left: int, op: str, right: int) -> int:
        if op == '*': return left*right
        else: return left+right
    
    prev = operands[0]
    for i in range(1, len(operands)):
        prev = expr(prev, operators[i-1], operands[i])
    return prev


def isComputable(operands: List[int], target: int):
    def helper(operators: List[str]):
        amt_left = len(operands)-1 - len(operators)
        if amt_left == 0:
            result = compute(operands, operators)
            return result == target
        
        for _ in range(amt_left):
            for op in ['*', '+']:
                if helper(operators + [op]): return True

        return False

    return helper([])

main()
