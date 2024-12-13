import sys

lines = []
for line in sys.stdin:
    lines.append(line[:-1])

target = 'MAS'
amt = 0
for i, line in enumerate(lines):
    for j in range(len(line)):
        if line[j] != 'X': continue

        dirs = [ [-1,0], [-1,-1], [0,-1], [1,-1], [1,0], [1,1], [0,1], [-1,1] ]
        for diri, dirj in dirs:
            offset = 0
            ni, nj = i+diri, j+dirj
            while ni >= 0 and ni < len(line) and nj >= 0 and nj < len(lines) \
                and offset < len(target) and lines[ni][nj] == target[offset]:
                offset += 1
                ni += diri
                nj += dirj
            if offset == len(target):
                amt += 1
print(amt)
