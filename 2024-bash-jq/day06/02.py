import sys
from typing import Tuple, Set, List

# true -> exited
# false -> loop
def run(lines: List[List[str]], start_i: int, start_j: int, start_dir: str) -> Tuple[bool, Set[Tuple[int, int]]]:
    gi, gj = start_i, start_j
    dir = start_dir
    uniq_visited = set()
    loop = set()
    while True:
        # add curr spot to set
        uniq_visited.add((gi,gj))
        loop.add((gi,gj,dir))
        
        # calculate new position
        if dir == '^': ni, nj = gi-1, gj
        elif dir == '>': ni, nj = gi, gj+1
        elif dir == 'v': ni, nj = gi+1, gj
        else: ni, nj = gi, gj-1
        
        # if new pos is oob break
        if ni < 0 or ni >= len(lines) or nj < 0 or nj >= len(lines[0]): return True, uniq_visited
        if (ni,nj,dir) in loop: return False, uniq_visited

        # if new pos is obstacle, turn
        if lines[ni][nj] == '#':
            if dir == '^': dir = '>'
            elif dir == '>': dir = 'v'
            elif dir == 'v': dir = '<'
            elif dir == '<': dir = '^'
        else:
            gi, gj = ni, nj
    
    
def main():
    lines: List[List[str]] = []
    for line in sys.stdin:
        chars = []
        for c in line[:-1]:
            chars.append(c)
        lines.append(chars)

    # find guard and direction they're facing
    start_i, start_j = -1, -1
    start_dir = '^'
    for i in range(len(lines)):
        for j in range(len(lines[i])):
            c = lines[i][j]
            if c == '^' or c == '>' or c == 'v' or c == '<':
                start_dir = c
                start_i, start_j = i, j
                break

    amt = 0
    _, uniq_visited = run(lines, start_i, start_j, start_dir)
    print(len(uniq_visited))
    for pi, pj in uniq_visited:
        if (pi, pj) == (start_i, start_j): continue
        lines[pi][pj] = '#'
        exits, _ = run(lines, start_i, start_j, start_dir)
        if not exits:
            amt += 1
        lines[pi][pj]  = '.'
    print(amt)

main()
