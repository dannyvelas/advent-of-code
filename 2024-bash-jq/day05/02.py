import sys
from collections import defaultdict
from typing import List, Dict, Set

graph = defaultdict(set)
for line in sys.stdin:
    if line == '\n': break
    needed_before, needed_after = line[:-1].split('|')
    graph[needed_after].add(needed_before)


def sort(present: Set[str]) -> List[str]:
    visited = set()
    result = []

    def dfs(node: str):
        if node in visited: return
        visited.add(node)

        for neighbor in graph[node]:
            if neighbor in present:
                dfs(neighbor)

        result.append(node)

    for node in graph:
        dfs(node)

    return result

lines = []
for line in sys.stdin:
    lines.append(line[:-1].split(','))

ans = 0
for line in lines:
    blacklist = set()
    was_blacklisted = False
    present = set()
    for num in line:
        if num in blacklist:
            was_blacklisted = True
        blacklist.update(graph[num])
        present.add(num)
    result = []
    if was_blacklisted:
        result = sort(present)
        ans += int(result[len(result) // 2])

print(ans)
