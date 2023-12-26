file←↑⊃⎕NGET'./input.txt'1
encoded ← ¯1+(⎕d,'.')⍳l
nums ← (10>,encoded)⊆,encoded
mapped ← ∊{(≢⍵)⍴10⊥⍵}¨nums
encoded[⍸10>encoded] ← mapped

⍝ file:    read file as matrix. suppose this matrix has m rows and n columns
⍝ encoded: encode file into a matrix where 10 stands for a period, 11 stands for a symbol
⍝          and `n` stands for the number `n` (0-9) at that position
⍝ nums:    an array of arrays. each inner array is a character of numbers
⍝ mapped:  transform each element of nums `e` to an array that is `s` duplicates of `e`, where
⍝          `s` is the amount of digits of `e`. once you're done, flatten. so instaed of an array
⍝          of arrays, we will have an array of numbers
⍝ encoded[⍸10>encoded]
⍝          get all of the indices `i` of `encoded` that represent a number. (aka indices where e < 10).
⍝          at the first such index, set mapped[1]. at the second such index, mapped[2], and so on.
⍝          there should be an equal amount of such indices as length of mapped


prettier ← (11|encoded) - 2×encoded∊12
⍝ prettier: make 11s into 0s. make 
