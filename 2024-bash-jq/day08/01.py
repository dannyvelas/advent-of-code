import sys

def main():
    lines = []
    for line in sys.stdin:
        lines.append(line[:-1])
    
    antennas = dict()
    n, m = len(lines), len(lines[0])
    for i in range(len(lines)):
        for j in range(len(lines[i])):
            c = lines[i][j]
            if c == '.': continue
            if c not in antennas:
                antennas[c] = []
            antennas[c].append((i, j))

    def in_bounds(i: int, j: int) -> int:
        return i >= 0 and i < n and j >= 0 and j < m

    antinodes = set()
    for group in antennas.values():
        for i in range(len(group)):
            start_i, start_j = group[i]
            #print(f'{start_i} {start_j}')
            for n_i, n_j in group[i+1:]:
                #print(f'\t{n_i},{n_j}')
                # calculate x and y axis diff
                dx = n_i - start_i # 1
                dy = n_j - start_j # -3

                # calc antinodes
                (a1i, a1j) = start_i - dx, start_j - dy
                (a2i, a2j) = n_i + dx, n_j + dy
                #print(f'\t\t{a1i},{a1j}')
                #print(f'\t\t{a2i},{a2j}')

                if in_bounds(a1i, a1j):
                    antinodes.add((a1i, a1j))
                if in_bounds(a2i, a2j):
                    antinodes.add((a2i, a2j))

    #for i, j in antinodes:
    #    print(i, j)
    print(len(antinodes))


main()
