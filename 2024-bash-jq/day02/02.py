import json

def main():
    reports_input = input()
    reports = json.loads(reports_input)

    amt_safe = 0
    for report in reports:
        if is_safe(report):
            amt_safe += 1
    return amt_safe

def is_safe(report) -> bool:
    state = get_state(report)

    stack = []
    seen_error = False
    for level in report:
        if not stack or (is_good_step(stack[-1], level, state) and abs(level - stack[-1]) <= 3:
            stack.append(level)
        else:
            pass
            
def is_good_step(prev, level, state) -> bool:
    return (level > prev and state=="inc") or (level < prev and state=="dec")

def get_state(report):
    amt_inc, amt_dec = 0, 0
    for i in range(1, len(report)):
        if report[i] >= report[i-1]:
            amt_inc += 1
        else:
            amt_dec += 1
    return "inc" if amt_inc >= amt_dec else "dec"

main()
