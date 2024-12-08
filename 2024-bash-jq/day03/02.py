from typing import Optional, Tuple

with open('input.txt') as f:
    on = True
    ans = 0
    for line in f:
        i = 0
        def parse_num(i: int) -> Tuple[Optional[int], int]:
            start = i
            res = 0
            # parse_num
            while i < len(line) and line[i].isdigit() and i-start < 3:
                res *= 10
                res += int(line[i])
                i += 1
            if i == start: return None, start+1
            return res, i

        def parse_mul(i: int) -> Tuple[Optional[int], int]:
            start = i
            # parse mul
            expected = 'mul('
            while i < len(line) and i-start < len(expected) and expected[i-start]==line[i]:
                i += 1
            if i-start < len(expected): return None, start+1

            # parse num
            left_op, new_i = parse_num(i)
            if left_op is None: return None, start+1
            i = new_i

            # parse comma
            if line[i] != ',': return None, start+1
            
            # parse num
            right_op, new_i = parse_num(i)
            if right_op is None: return None, start+1
            i = new_i

            # parse close paren
            if line[i] != ')': return None, start+1
            i += 1

            return right_op*left_op, i

        def parse_dont(i: int) -> Tuple[bool, int]:
            start = i
            expected = 'don\'t()'
            while i < len(line) and i-start < len(expected) and line[i] == expected[i-start]:
                i += 1
            if i-start < len(expected): return False, start+1
            return True, i
        
        def parse_do(i: int) -> Tuple[bool, int]:
            start = i
            expected = 'do()'
            while i < len(line) and i-start < len(expected) and line[i] == expected[i-start]:
                i += 1
            if i-start < len(expected): return False, start+1
            return True, i
        
        while i < len(line):
            if line[i] == 'm' and on:
                res, new_i = parse_mul(i)
                if res is not None:
                    ans += res
                i = new_i
            elif line[i] == 'd' and on:
                ok, new_i = parse_dont(i)
                if ok:
                    on = False
                i = new_i
            elif line[i] == 'd' and not on:
                ok, new_i = parse_do(i)
                if ok:
                    on = True
                i = new_i
            else:
                i += 1
    print(ans)
