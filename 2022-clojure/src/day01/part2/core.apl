#! /usr/local/bin/dyalogscript

I←⌷⍨∘⊃⍨⍤0 99 ⍝ sane indexing
file ← ⊃⎕NGET'10.txt' 1
summed ← +/¨⍎¨¨((0≠≢¨)⊆⊢)file
+/summed I⍨¯3↑⍋summed
