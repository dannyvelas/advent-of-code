#! /usr/local/bin/dyalogscript
⍝ inspired by https://github.com/kspalaiologos/aoc2023/blob/main/day2/2.apl

⍝ first attempt
file←⊃⎕NGET'./input.txt'1
+/{
  n ← ⍎¨⍵⊆⍨⍵∊⎕D
  c←0~⍨⊃1 2 3+.×'red' 'green' 'blue'⍷¨⊂⍵
  m←⌈/{n[¯2+1↓⍵]}⌸1 2 3,c
  ×/m
}¨file
