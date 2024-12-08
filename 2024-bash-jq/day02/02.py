import json
from typing import List

def is_ok(report: List[int]) -> bool:
    ok = True
    only_inc = True
    only_dec = True
    for i in range(len(report)-1):
        diff = report[i+1]-report[i]
        if diff > 0:
            only_dec = False
        elif diff < 0:
            only_inc = False
        if not (1 <= abs(diff) <= 3):
            ok = False
            break
    return ok and (only_inc or only_dec)

def main():
    reports_input = input()
    reports = json.loads(reports_input)

    amt_safe = 0
    for report in reports:
        any_ok = False
        def consider(i: int):
            nonlocal any_ok
            b = report[:i] + report[i+1:]
            if is_ok(b):
                any_ok = True

        consider(0)
        for i in range(len(report)-1):
            diff = report[i+1]-report[i]
            if abs(diff) < 1 or abs(diff) > 3:
                consider(i)
                consider(i+1)
                break
            elif i + 2 < len(report):
                diff_2 = report[i+2] - report[i+1]
                if (diff > 0) != (diff_2 > 0):
                    consider(i)
                    consider(i+1)
                    consider(i+2)
                    break
        if any_ok:
            amt_safe += 1

    print(amt_safe)

main()
