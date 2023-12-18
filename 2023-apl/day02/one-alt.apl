#! /usr/local/bin/dyalogscript
⍝ inspired by https://github.com/kspalaiologos/aoc2023/blob/main/day2/2.apl

file ← ⊃⎕NGET'./input.txt' 1
⎕←+/⍸{
  n ← ⍎¨1↓⍵⊆⍨⍵∊⎕D
  c ← 0~⍨⊃1 2 3+.×'red' 'green' 'blue'⍷¨⊂⍵
  m ← {⍺ (n[⍵])}⌸c
  sortedM←⌈/↑((⊂⍋m[;1])⌷m)[; 2]
  sortedM∧.≤12 13 14
}¨file

⍝ Notes:
⍝ n: create vector that has only numbers
⍝ c: create vector that has the ordering of colors. 1 stands for red, 2 stands for green
⍝    3 stands for blue. e.g. '7 blue 1 red 3 green' would give [3 1 2]
⍝ m: group draws of each color. sort them so that first column is red, second is green and third is blue
⍝ return: convert each vector of maximum draws to a new binary vector of length three. reduce each vector into a number with ∧
