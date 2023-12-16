⍝ first attempt
]Display ⎕ ← {((⊃⍵)⎕R((≢⍵)⊃⍵)) ⍺} \ ('aabbcc' 'a1' 'b2')

{((⊃⍺)⎕R((≢⍺)⊃⍺)) ⍵}/(('three' '3') ('two' '2') ('one' '1') 'onetwone')

⍝ second attempt after looking at kspalaiologos ans
n←2 9⍴'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine',1↓⎕d
⍝ why is n⍷¨⊂'slconeightfoureight557m38' different to n⍷'slconeightfoureight557m38'?


⍝ third attempt
file ← ⊃⎕NGET '/Users/dannyvelasquez/RemoteGit/MyGithub/advent-of-code/2023-apl/day01/input.txt' 1

⍝ create matrix with 2 rows and 9 columns. in the first row are the strings 'one', 'two',... 'nine'
⍝ in the second row are the numbers 1, 2,... 9
n←2 9⍴'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine',1↓⎕d

+/{(10 1)+.×(⊃,(⊃⌽))0~⍨⊃(⍳9)+.×+⌿n⍷¨⊂⍵}¨file
⍝ for each line in file
⍝   enclose the string so that it becomes a vector of one element
⍝   for each character in `line` run `find`. output should be a matrix with 2 rows and 9 columns.
⍝     each element is a binary vector of length `k`, where `k` is the length of `line`.
⍝     let a given vector in the first row of the matrix be defined as `v(i)` where `i` is the column of the vector.
⍝     an element at element `j` in `v(i)` will be 1 if the `j`th character of `line` is equal to `i`.
⍝     let a given vector in the second row of the matrix be defined as `w(i)` where `i` is the column of the vector.
⍝     an element at element `j` in `w(i)` will be 1 if the `j`th character of `line` is the string version of `i`.
⍝   merge the first and second rows of this matrix +⌿ to make it into a vector
⍝   calculate the dot product of this vector against a vector 1-9
⍝   remove the 0s of this vector
⍝   get first and last to form a 2-element vector
⍝   multiply first element by 10 and second element by 1
⍝   sum first element and second element
⍝ sum all numbers

