file←↑⊃⎕NGET'./input.txt'1

encoded←(⎕d,'.')⍳file
prettier←(11|encoded) - 2×encoded∊12
nums ← ¯1+(0<,prettier)⊆,prettier
mapped ← ∊{(≢⍵)⍴10⊥⍵}¨nums
prettier[⍸0<prettier] ← mapped

⍝ file:     read file as matrix. suppose this matrix has m rows and n columns
⍝ encoded:  encode file into a matrix where 11 stands for a period, 12 stands for a symbol
⍝           and every other element will represent a number at at index `i` of file.
⍝           a number at index `i` in this matrix will be set to `file[i]+1`
⍝ prettier: we convert the representation of periods from  11s to 0s. and all 12s to -1.
⍝           we keep numbers as is because we want to avoid confusion with an element being a true 0
⍝           or being a period. this step may seem useless now, but will be useful in the future,
⍝           because in the future, our matrix will hold numbers that are greater than 10. so without
⍝           this step, there would be ambiguity as to whether an element is a true 11 or a period.
⍝ nums:     an array of an array of numbers. after we created this array, we subtracted 1 from each
⍝           number. (making it the true number from file, not n+1)
⍝ mapped:   transform each element of nums `e` to an array that is `s` duplicates of `e`, where
⍝           `s` is the amount of digits of `e`. once you're done, flatten. so instaed of an array
⍝           of arrays, we will have an array of numbers
⍝ prettier[⍸0<prettier]
⍝          get all of the indices `i` of `encoded` that represent a number. (aka indices where e < 10).
⍝          at the first such index, set mapped[1]. at the second such index, mapped[2], and so on.
⍝          there should be an equal amount of such indices as length of mapped
