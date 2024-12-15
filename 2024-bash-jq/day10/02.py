import sys
from collections import defaultdict, deque

def main():
    lines = []
    for line in sys.stdin:
        num_line = []
        for c in line[:-1]:
            num_line.append(int(c))
        lines.append(num_line)

    n, m = len(lines), len(lines[0])
    def in_bounds(i: int, j: int) -> bool:
        return i >= 0 and i < n and j >= 0 and j < m
    
    # populate graph. key->i,jcoord. value-> List[i,jcoord]
    graph = defaultdict(list) 
    trailheads = set()
    for i in range(len(lines)):
        for j in range(len(lines[i])):
            node = lines[i][j]
            if node == 0:
                trailheads.add((i,j))
            dirs = [[i-1,j], [i,j-1], [i+1,j], [i,j+1]]
            for ni, nj in dirs:
                if in_bounds(ni, nj) and lines[ni][nj] == lines[i][j]+1:
                    graph[(i,j)].append((ni, nj))

    def bfs(start_i: int, start_j: int, target: int) -> int:
        q = deque()
        #visited = set()

        q.append((start_i, start_j))
        #visited.add((start_i, start_j))

        amt_of_targets = 0
        while q:
            (pi, pj) = q.popleft()
            if lines[pi][pj] == target:
                amt_of_targets += 1
                continue
            for ni, nj in graph[(pi,pj)]:
                #if (ni, nj) in visited: continue
                q.append((ni,nj))
                #visited.add((ni,nj))
        return amt_of_targets

    score = 0
    for i, j in trailheads:
        score += bfs(i, j, 9)

    print(score)

main()
