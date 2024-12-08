import json

def main():
    reports_input = input()
    reports = json.loads(reports_input)

    amt_safe = 0
    for report in reports:
        if is_safe(report):
            amt_safe += 1
    print(amt_safe)

def is_safe(report) -> bool:
    stack = []
    seen_err = False
    for level in report:
        if stack and not is_good_step(stack[-1], level, state):
            if seen_err: return False
            seen_err = True
            continue
        while stack and abs(level - stack[-1]) > 3:
            if seen_err: return False
            seen_err = True
            stack.pop()
        stack.append(level)
    return True
            
def is_good_step(prev, level, state) -> bool:
    return (level > prev and state=="inc") or (level < prev and state=="dec")

main()
