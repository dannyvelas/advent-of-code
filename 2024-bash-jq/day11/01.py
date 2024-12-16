import sys
from typing import Tuple
import math

def split_num(num: int) -> Tuple[int, int]:
    divisor = 10
    while num // divisor > divisor:
        divisor *= 10
    return num // divisor, num % divisor

def main():
    line = sys.stdin.readline().strip().split(' ')
    nums = [int(x) for x in line]
    for _ in range(25):
        new_nums = []
        for num in nums:
            if num == 0:
                new_nums.append(1)
            elif (math.floor(math.log10(num))+1) % 2 == 0:
                l, r = split_num(num)
                new_nums.extend([l, r])
            else:
                new_nums.append(num * 2024)
            nums = new_nums

    print(len(nums))

main()
