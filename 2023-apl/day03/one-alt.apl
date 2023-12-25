file←↑⊃⎕NGET'./input.txt'1
splitIntoRows ← ↑('.',⎕d) ⍷ ¨⊂file
encoded ← (+⌿splitIntoRows×⍉(2⊃⍴ file) (⊃⍴ file) 11 ⍴ 0,¯1+⍳10)+¯1×~+⌿splitIntoRows
nums ← (0<,encoded)⊆,encoded

⍝ z[⍸0<z]←∊(≢⍴10∘⊥)¨¯1+(0<,z)⊆,z
⍝ file:    read file as matrix. suppose this matrix has m rows and n columns
⍝ split:   create binary 3d matrix. this matrix will have 11 sides or faces. each side will
⍝          be a 2d matrix of `m` rows and `n` columns.
⍝          `[i,j]` of the matrix of the first face will be a 1 if `[i,j]` of file is period
⍝          `[i,j]` of the matrix of the second face will be a 1 if `[i,j]` of file is 0
⍝          `[i,j]` of the matrix of the third face will be a 1 if `[i,j]` of file is 1
⍝          and so on. there are 11 faces because there are 10 numbers 0-9, plus the face for the period
⍝ encoded: encode file into a matrix where 0 stands for a period, -1 stands for a symbol
⍝          and `n` stands for the number `n` at that position
