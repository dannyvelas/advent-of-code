#! /usr/local/bin/dyalogscript
⍝ inspired by https://github.com/kspalaiologos/aoc2023/blob/main/day2/2.apl

⍝ first attempt
file ← ⊃⎕NGET'./input.txt' 1
⎕←+/⍸{
  n ← ⍎¨1↓⍵⊆⍨⍵∊⎕D
  c ← 0~⍨⊃1 2 3+.×'red' 'green' 'blue'⍷¨⊂⍵
  m ← {⍺ (n[⍵])}⌸c
  maxDraws←⌈/↑((⊂⍋m[;1])⌷m)[; 2]
  maxDraws∧.≤12 13 14
}¨file

⍝ Notes:
⍝ n:        create vector that has only numbers, skipping the first one (gameID)
⍝ c:        create vector that has the ordering of colors. 1 stands for red, 2 stands for green
⍝           3 stands for blue. e.g. '7 blue 1 red 3 green' would give [3 1 2]
⍝ m:        group draws of each color. each element in first column is a number.
⍝           each element in second column is a vector of numbers
⍝ maxDraws: sort `m` so that first column is red, second is green and third is blue. `(⊂⍋m[;1])⌷m)`
⍝           also, index second column, turning matrix into vector of vectors `[; 2]`
⍝           transform to matrix again `↑` 
⍝           get sum of each row `⌈/`
⍝ return:   convert our vector of maximum draws to a new binary vector of length three.
⍝           if 1st index ≤ 12, 1, else 0. if 1st index ≤ 13, 1 else 0. if 3rd index ≤ 14 1, else 0.
⍝           reduce each vector into a number with ∧
⍝ after:    convert each 1 in a binary vector to the value of its index (⍸)
⍝ after:    sum all

⍝ second attempt
file←⊃⎕NGET'./input.txt'1
+/{
  n ← ⍎¨⍵⊆⍨⍵∊⎕D
  c←0~⍨⊃1 2 3+.×'red' 'green' 'blue'⍷¨⊂⍵
  m←⌈/{n[¯2+1↓⍵]}⌸1 2 3,c
  (⊃n)×m∧.≤12 13 14
}¨file

⍝ Notes: (using input 'Game 1: 7 blue 1 red 3 green' as an example)
⍝ n:      create vector that has only numbers (e.g [1 7 1 3])
⍝ c:      create vector that has the ordering of colors. 1 stands for red, 2 stands for green
⍝         3 stands for blue. (e.g. [3 1 2])
⍝ m:      create new vector (lets call it `v`) which is the numbers 1 2 and 3 prepended to c. (e.g [1 2 3 3 1 2])
⍝         create a matrix `m`
⍝          - m[1] is a vector where each element is an index of where 1 appears in `v` (e.g [1 5])
⍝          - m[2] is a vector where each element is an index of where 2 appears in `v` (e.g. [2 6]), and so on. 
⍝         remove the first element of every vector in the second column
⍝          - ∀x ∊ m[1], x is an index of where 1 appears in `c`, but added by 3 (e.g. [5])
⍝          - ∀x ∊ m[2], x is an index of where 2 appears in `c`, but added by 3 (e.g. [6]), and so on.
⍝         subtract 2 from every element in every vertex in the second column
⍝          - ∀x ∊ m[1], x is an index of where 1 appears in `c`, but added by 1 (e.g. [3])
⍝          - ∀x ∊ m[2], x is an index of where 1 appears in `c`, but added by 2 (e.g. [4])
⍝         change each element `e` of each row in `m`, to `n[e]`. (e.g. m[1] would be [1], m[2] would be [3])
⍝          - the first row is the draws of red, second row, draws of green, third, draws of blue
⍝         get max of each row
⍝ return: convert our vector of maximum draws to a new binary vector of length three.
⍝         - if 1st index ≤ 12, 1, else 0. if 1st index ≤ 13, 1 else 0. if 3rd index ≤ 14 1, else 0.
⍝         - reduce each vector into a number with ∧
⍝         - multiply times gameID (⊃n) (e.g. 1)
