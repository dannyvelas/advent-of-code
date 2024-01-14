#! /usr/local/bin/dyalogscript

file ← ⊃⎕NGET'10.txt' 1
summed ← +/¨⍎¨¨((0≠≢¨)⊆⊢)file
+/summed[¯3↑⍋summed]
