import sys
from collections import defaultdict
from typing import Tuple
import math

def split_num(num_digits: int, num: int) -> Tuple[int, int]:
    divisor = 10 ** (num_digits // 2)
    return num // divisor, num % divisor

def main():
    line = sys.stdin.readline().strip().split(' ')
    nums = defaultdict(int)
    for num in line:
        int_num = int(num)
        nums[int_num] += 1
    for _ in range(75):
        new_nums = defaultdict(int)
        for num, count in nums.items():
            if num == 0:
                new_nums[1] += count
            else:
                num_digits = math.floor(math.log10(num))+1
                if num_digits % 2 == 0:
                    l, r = split_num(num_digits, num)
                    new_nums[l] += count
                    new_nums[r] += count
                else:
                    new_nums[num * 2024] += count
            nums = new_nums

    total = 0
    for count in nums.values():
        total += count
    print(total)

main()
