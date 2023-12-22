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
indices ← ⊃,/↓⍳⍴↑file
indicesOfNums ← indices/⍨0≠{numsMatrix[⊃⍵; ⊃⌽⍵]}¨indices
boxIndices ← getBoxIndices¨indicesOfNums
isInBound ← {(∧/1≤⍵)∧((⊃⍴numsMatrix)≥⊃⍵)∧((2⊃⍴numsMatrix)≥⊃⌽⍵)}
boundedIndices ← {⍵[⍸isInBound¨⍵]}¨boxIndices
indicesNextToSpecialChars ← indicesOfNums/⍨{∨/{¯2=numsMatrix[⊃⍵; ⊃⌽⍵]}¨⍵}¨boundedIndices
⎕ ← +/{numsMatrix[⊃⍵; ⊃⌽⍵]}¨indicesNextToSpecialChars
