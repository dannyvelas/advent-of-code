import sys
from collections import defaultdict
from typing import List, Set

graph = defaultdict(set)

def topo(present: Set[str]) -> List[str]:
    visited: Set[str] = set()
    result: List[str] = []
    def dfs(node: str):
        if node in visited: return
        if node not in present: return
        visited.add(node)
        
        for neighbor in graph[node]:
            dfs(neighbor)

        result.append(node)

    for node in graph:
        if node in present:
            dfs(node)

    return result

for line in sys.stdin:
    if line == '\n': break
    needed_before, needed_after = line[:-1].split('|')
    graph[needed_after].add(needed_before)

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
    if was_blacklisted:
        result = topo(present)
        ans += int(result[len(result) // 2])

print(ans)
