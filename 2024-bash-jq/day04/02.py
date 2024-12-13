import sys

lines = []
for line in sys.stdin:
    lines.append(line[:-1])

target = 'MAS'
amt = 0
for i in range(len(lines)):
    for j in range(len(lines[i])):
        if lines[i][j] != 'M' and lines[i][j] != 'S': continue
        target = 'AS' if lines[i][j] == 'M' else 'AM'
        k = 0
        ni, nj = i+1, j+1
        while ni >= 0 and ni < len(lines) and nj >= 0 and nj < len(lines[i]) \
                and k < len(target) and lines[ni][nj] == target[k]:
            k += 1
            ni += 1
            nj += 1
        if k != len(target): continue

        ni, nj = i, j+2
        if nj >= len(lines[i]): continue
        if lines[ni][nj] != 'M' and lines[ni][nj] != 'S': continue
        target = 'AS' if lines[ni][nj] == 'M' else 'AM'
        k = 0
        ni += 1
        nj -= 1
        while ni >= 0 and ni < len(lines) and nj >= 0 and nj < len(lines[i]) \
                and k < len(target) and lines[ni][nj] == target[k]:
            k += 1
            ni += 1
            nj -= 1
        if k == len(target):
            amt += 1


print(amt)
