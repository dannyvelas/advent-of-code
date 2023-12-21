#! /usr/local/bin/dyalogscript
getBoxIndices ← {
  bI ← ((⍺-1) (⍵-1)) ((⍺-1) ⍵) ((⍺-1) (⍵+1)) (⍺ (⍵-1)) (⍺ (⍵+1)) ((⍺+1) (⍵-1)) ((⍺+1) ⍵) ((⍺+1) (⍵+1))
  filteredOutLessThan1 ← bI[⍸{∧/1≤⍵}¨bI]
  filteredOutLessThan1
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

⍝ part1, define `b`
file ← ⊃⎕NGET 'input.txt' 1
↑mergeNumsIntoOneIndex¨file

⍝ part 2
⍝indices ← ⍳⍴↑file
⍝boxIndices ← {⊃getBoxIndices/⍵}¨indices
⍝{{b[⍺; ⍵]}/⍵}¨¨boxIndices
