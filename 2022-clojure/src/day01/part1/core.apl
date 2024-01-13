#! /usr/local/bin/dyalogscript

file ← ⊃⎕NGET'10.txt' 1
⌈/+/¨⍎¨¨file ⊆⍨ (~{''≡⍵}¨file)
