import sys
from typing import Tuple, Optional
import math

def split_num(num: int) -> Optional[Tuple[int, int]]:
    left, right = 0, 0
    num_digits = math.floor(math.log10(num))+1
    if num_digits % 2 != 0: return None
    for i in range(num_digits):
        if i < num_digits // 2:
            last_digit = num % 10
            right = (last_digit * (10**i)) + right 
            num //= 10
        else:
            last_digit = num % 10
            left = (last_digit * (10**(i - (num_digits // 2)))) + left
            num //= 10
    return left, right

def main():
    line = sys.stdin.readline().strip().split(' ')
    nums = [int(x) for x in line]
    for _ in range(25):
        new_nums = []
        for num in nums:
            if num == 0:
                new_nums.append(1)
            else:
                split = split_num(num)
                if split is not None:
                    new_nums.extend([split[0], split[1]])
                else:
                    new_nums.append(num * 2024)
            nums = new_nums

    print(len(nums))

main()
