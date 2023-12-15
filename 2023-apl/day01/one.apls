⍝ first attempt
file ← ⊃⎕NGET 'input.txt'
splitByNL ← (~file ∊ (⎕UCS 10))⊆file
onlyNums ← {(⍵∊⎕D) / ⍵}¨splitByNL
firstAndLast ← {(⊃⍵) ((≢⍵)⊃⍵)}¨onlyNums
ans ← +⌿⍎¨firstAndLast

⍝ second attempt
file ← ⊃⎕NGET 'input.txt'
splitByNL ← (~file ∊ (⎕UCS 10))⊆file     ⍝ `⎕UCS 10` is a NL. make an array where every NL is a 0. partition `file` at the indices where this array has 0s
onlyNums ← ~∘(¯1 ⎕C ⎕a)¨splitByNL        ⍝ `(¯1 ⎕C ⎕a)` gives lowercase a-z. ~∘(¯1 ⎕C ⎕a) is a function that takes one argument. it will return the argument without any characters a-z.
firstAndLast ← {(⊃⍵) ((≢⍵)⊃⍵)}¨onlyNums
ans ← +/⍎¨firstAndLast

⍝ third attempt
file ← ⊃⎕NGET 'input.txt'
ans←+/⍎¨{(⊃⍵)((≢⍵)⊃⍵)}¨~∘(¯1 ⎕C ⎕A)¨(~(⎕UCS 10)∊⍨file)⊆file


⍝ fourth attempt (learned from kspalaiologos approach)
file ← ⊃⎕NGET 'input.txt' 1
ans ←+/{2⊃⎕vfi(⊃,⊃∘⌽)((⍵∊⎕d)/⍵)}¨file

⍝ fifth attempt (fourth attempt but using C combinator ⍨)
file ← ⊃⎕NGET 'input.txt' 1
ans ← ⊃+/{2⊃⎕vfi(⊃,⊃∘⌽)⍵/⍨⎕d∊⍨⍵}¨file
