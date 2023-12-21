mergeNumsIntoOneIndexShort ← {
  isNum ← +⌿↑⎕d ⍷ ¨⊂⍵
  isStartOfNum ← (⍳≢⍵) ∊ ⊃¨isNum⊆(⍳≢⍵) × isNum 
  nums ← (≢⍵) ⍴ 0
  (isStartOfNum/nums) ← ⍎¨isNum⊆⍵
  nums
}
