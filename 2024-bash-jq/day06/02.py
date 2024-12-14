import sys
from typing import Tuple, Set

# true -> exited
# false -> loop
def run(start_i: int, start_j: int, start_dir: str) -> Tuple[bool, Set[Tuple[int, int]]]:
    gi, gj = start_i, start_j
    dir = start_dir
    uniq_visited = set()
    while True:
        # add curr spot to set
        uniq_visited.add((gi,gj))
        
        # calculate new position
        if dir == '^': ni, nj = gi-1, gj
        elif dir == '>': ni, nj = gi, gj+1
        elif dir == 'v': ni, nj = gi+1, gj
        else: ni, nj = gi, gj-1
        
        # if new pos is oob break
        if ni < 0 or ni >= len(lines) or nj < 0 or nj >= len(lines[0]): return True, uniq_visited
        if ni == start_i and nj == start_j and dir == start_dir: return False, uniq_visited

        # if new pos is obstacle, turn
        if lines[ni][nj] == '#':
            if dir == '^': dir = '>'
            elif dir == '>': dir = 'v'
            elif dir == 'v': dir = '<'
            elif dir == '<': dir = '^'
        else:
            gi, gj = ni, nj
    
    
lines = []
for line in sys.stdin:
    lines.append(line[:-1])

# find guard and direction they're facing
gi, gj = -1, -1
dir = '^'
for i in range(len(lines)):
    for j in range(len(lines[i])):
        c = lines[i][j]
        if c == '^' or c == '>' or c == 'v' or c == '<':
            dir = c
            gi, gj = i, j
            break

_, uniq_visited = run(gi, gj, dir)


print(len(uniq_visited))
