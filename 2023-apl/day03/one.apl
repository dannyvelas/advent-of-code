#! /usr/local/bin/dyalogscript
getBoxIndices ← {
  i ← ⊃⍵
  j ← ⊃⌽⍵
  ((i-1) (j-1)) ((i-1) j) ((i-1) (j+1)) (i (j-1)) (i (j+1)) ((i+1) (j-1)) ((i+1) j) ((i+1) (j+1))
}

mergeNumsIntoOneIndex ← {
  isNum ← +⌿↑⎕d ⍷ ¨⊂⍵
  onlyNums ← ⍎¨isNum⊆⍵
  indicesOfStartOfNums ← ⊃¨isNum⊆(⍳≢⍵) × isNum
  isStartOfNum ← (⍳≢⍵) ∊ indicesOfStartOfNums
  nums ← (≢⍵) ⍴ 0
  (isStartOfNum/nums) ← onlyNums
  nums
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
