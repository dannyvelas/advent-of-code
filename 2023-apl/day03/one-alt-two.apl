#! /usr/local/bin/dyalogscript
file←↑⊃⎕NGET'./input.txt'1

adj←∨/∨/~(⎕D,'. ')∊⍨{⍵}⌺3 3⊢file
msk←file∊⎕D

(∨/¨msk⊆⍥,adj)⌿msk⊆⍥,file

+⌿⍎¨(∨/¨msk⊆⍥,adj)⌿msk⊆⍥,file
