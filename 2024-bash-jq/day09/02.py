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

    curr_file_id = None
    amt_els = None
    r = len(disk)-1
    target_file_id = None
    while target_file_id is None or target_file_id >= 0:
        # search from right to left for a fileid and the amount of elements that takes up
        while (target_file_id is not None and disk[r] != target_file_id) or (target_file_id is None and disk[r] == '.'):
            r -= 1
        curr_file_id = disk[r]
        amt_els = 0
        i = r
        while disk[i] == curr_file_id:
            amt_els += 1
            i -= 1

        l = 0
        amt_spaces = 0
        # search from left to right for an amt of spaces >= amt_els
        while l < r:
            # find the first space index 
            while disk[l] != '.':
                l += 1
            
            # count the amount of spaces
            amt_spaces = 0
            i = l
            while disk[i] == '.':
                amt_spaces += 1
                i += 1

            if amt_spaces >= amt_els: break

        # if we're here, we either found a space or not
        # if we didnt find a space, just continue to try to accomodate the next block
        if amt_spaces < amt_els: continue

        # otherwise, lets fill the space
        for _ in range(amt_els):
            disk[l] = curr_file_id
            l += 1

        # and lets remove replace the old location of curr_file_id with dots
        for _ in range(amt_els):
            disk[r] = '.'
            r -= 1

        target_file_id = curr_file_id-1

    ans = 0
    for i, block_id in enumerate(disk):
        if block_id == '.': continue
        ans += i * block_id

    print(ans)


main()
