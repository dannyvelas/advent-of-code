#! /usr/local/bin/dyalogscript

file ← ⊃⎕NGET'10.txt' 1
⌈/+/¨⍎¨¨((0≠≢¨)⊆⊢)file

⍝ approach 1 of splitting file into vectors of numbers: file ⊆⍨ ~{''≡⍵}¨file
⍝ approach 2 of splitting file into vectors of numbers: (~''∘≡¨file) ⊆ file
⍝ approach 3 of splitting file into vectors of numbers: file ⊆⍨ ~''∘≡¨file
⍝ approach 4 of splitting file into vectors of numbers: (0≠≢¨file) ⊆ file
⍝ approach 5 of splitting file into vectors of numbers: ((0≠≢¨)⊆⊢)file
