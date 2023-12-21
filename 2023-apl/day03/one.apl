#! /usr/local/bin/dyalogscript
getBoxIndices ← {
  bI ← ((⍺-1) (⍵-1)) ((⍺-1) ⍵) ((⍺-1) (⍵+1)) (⍺ (⍵-1)) (⍺ (⍵+1)) ((⍺+1) (⍵-1)) ((⍺+1) ⍵) ((⍺+1) (⍵+1))
  isInBound ← {(1≤⊃⍵) ∧ (3≥⊃⍵) ∧ (1≤⊃⌽⍵) ∧ (140≥⊃⌽⍵)}
  boundedIndices ← bI[⍸isInBound¨bI]
  boundedIndices
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
boxIndices ← {⊃getBoxIndices/⍵}¨indices
{numsMatrix[⊃⍵; ⊃⌽⍵]}¨¨boxIndices
