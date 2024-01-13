#! /usr/local/bin/dyalogscript

file ← ⊃⎕NGET'10.txt' 1
summed ← +/¨⍎¨¨file ⊆⍨ (~{''≡⍵}¨file)
+/¯3↑summed[⍋summed]
