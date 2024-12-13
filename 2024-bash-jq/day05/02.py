import sys
from collections import defaultdict
from typing import List, Set, DefaultDict

graph = defaultdict(set)

def topo(node: str, present: Set[str], result: List[str], _in: DefaultDict[str, int]):
    def dfs(node: str):
        result.append(node)

        for neighbor in graph[node]:
            if neighbor in present:
                _in[neighbor] -= 1
                if _in[neighbor] == 0:
                    dfs(neighbor)

    dfs(node)
    return 

for line in sys.stdin:
    if line == '\n': break
    needed_before, needed_after = line[:-1].split('|')
    graph[needed_before].add(needed_after)

lines = []
for line in sys.stdin:
    lines.append(line[:-1].split(','))

ans = 0
i = 0
for line in lines:
    blacklist = set()
    was_blacklisted = False
    present = set()
    _in = defaultdict(int)
    for num in line:
        for edge in graph[num]:
            _in[edge] += 1
        if num in blacklist:
            was_blacklisted = True
        blacklist.update(graph[num])
        present.add(num)
    if was_blacklisted:
        result = []
        for node in line:
            if _in[node] == 0:
                topo(node, present, result, _in)
        print(i)
        print(result)
        ans += int(result[len(result) // 2])
    i += 1

print(ans)
