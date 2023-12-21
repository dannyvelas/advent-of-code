#! /usr/local/bin/dyalogscript
getBoxIndices ← {
  i ← ⊃⍵
  j ← ⊃⌽⍵
  ((i-1) (j-1)) ((i-1) j) ((i-1) (j+1)) (i (j-1)) (i (j+1)) ((i+1) (j-1)) ((i+1) j) ((i+1) (j+1))
}

mergeNumsIntoOneIndex ← {
  m ← ↑('.',⎕d) ⍷ ¨⊂⍵
  isSymbol ← ~+⌿m
  isNum ← +⌿1↓m
  onlyNums ← ⍎¨isNum⊆⍵
  indicesOfStartOfNums ← ⊃¨isNum⊆(⍳≢⍵) × isNum
  isStartOfNum ← (⍳≢⍵) ∊ indicesOfStartOfNums
  nums ← (≢⍵) ⍴ 0
  (isStartOfNum/nums) ← onlyNums
  nums + isSymbol×¯2
}

⍝ part1, define `numsMatrix`
file ← ⊃⎕NGET 'input.txt' 1
numsMatrix ← ↑mergeNumsIntoOneIndex¨file

⍝ part 2
indices ← ⍳⍴↑file
boxIndices ← getBoxIndices¨indices
isInBound ← {(∧/1≤⍵)∧((⊃⍴numsMatrix)≥⊃⍵)∧((2⊃⍴numsMatrix)≥⊃⌽⍵)}
boundedIndices ← {⍵[⍸isInBound¨⍵]}¨boxIndices


{numsMatrix[⊃⍵; ⊃⌽⍵]}¨¨boundedIndices


⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝ scratch work:: ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
base ← ↑('.',⎕d) ⍷ ¨⊂line
isSymbol ← ~+⌿base
isNum ← +⌿1↓base
encoded ← isNum + isSymbol×2




⍝ first row: 1 if is a '.'
⍝ second row: 1 if is a 0
⍝ third row: 1 if is a 1
⍝ ...
⍝ 11th row: 1 if is a 9
↑('.',⎕d) ⍷ ¨⊂line

⍝-1 to 9 as 11x140 matrix: 
⍉(≢line) 11 ⍴ ¯2+⍳11

⍝ '.' = -1
⍝ symbol = 0
⍝ number = number itself
encodedM ← +⌿(↑('.',⎕d) ⍷ ¨⊂line) × ⍉(≢line) 11 ⍴ ¯2+⍳11

