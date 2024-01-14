#! /usr/local/bin/dyalogscript

I←⌷⍨∘⊃⍨⍤0 99 ⍝ sane indexing
file ← ⊃⎕NGET'input.txt' 1
+/((3↑⍒)I⊢)+/¨⍎¨¨((0≠≢¨)⊆⊢)file
