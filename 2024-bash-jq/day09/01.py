import sys

def main():
    line = sys.stdin.readline().strip()

    disk = []
    for i in range(len(line)):
        for _ in range(int(line[i])):
            if i % 2 == 0:
                disk.append(i // 2)
            else:
                disk.append('.')

    l, r = 0, len(disk)-1
    while True:
        while disk[l] != '.':
            l += 1
        while disk[r] == '.':
            r -= 1
        if l >= r: break
        disk[l] = disk[r]
        disk[r] = '.'

    ans = 0
    for i, block_id in enumerate(disk):
        if block_id == '.': break
        ans += i * block_id

    print(ans)


main()
