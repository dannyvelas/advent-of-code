#! /usr/local/bin/dyalogscript
getBoxIndices ← {
  bI ← ((⍺-1) (⍵-1)) ((⍺-1) ⍵) ((⍺-1) (⍵+1)) (⍺ (⍵-1)) (⍺ (⍵+1)) ((⍺+1) (⍵-1)) ((⍺+1) ⍵) ((⍺+1) (⍵+1))
  filteredOutLessThan1 ← bI[⍸{∧/1≤⍵}¨bI]
  filteredOutLessThan1
}

⍝ part1, define `b`
file ← ⊃⎕NGET 'input.txt' 1
↑{
  amtCols ← 2⊃⍴↑file
  isNum ← +⌿↑⎕d ⍷ ¨⊂⍵
  onlyNums ← ⍎¨isNum⊆⍵
  indicesOfStartOfNums ← ⊃¨isNum⊆(⍳≢isNum) × isNum
  isStartOfNum ← (⍳amtCols) ∊ indicesOfStartOfNums
  nums ← amtCols ⍴ 0
  (isStartOfNum/nums) ← onlyNums
  nums
}¨file

⍝ part 2
⍝indices ← ⍳⍴↑file
⍝boxIndices ← {⊃getBoxIndices/⍵}¨indices
⍝{{b[⍺; ⍵]}/⍵}¨¨boxIndices
