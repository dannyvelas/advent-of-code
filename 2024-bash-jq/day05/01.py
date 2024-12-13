import sys
from collections import defaultdict

m = defaultdict(set)
for line in sys.stdin:
    if line == '\n': break
    l, r = line[:-1].split('|')
    m[r].add(l)

lines = []
for line in sys.stdin:
    lines.append(line[:-1].split(','))

ans = 0
for line in lines:
    blacklist = set()
    was_blacklisted = False
    for num in line:
        if num in blacklist:
            was_blacklisted = True
            break
        blacklist.update(m[num])
    if not was_blacklisted:
        ans += int(line[len(line) // 2])

print(ans)
