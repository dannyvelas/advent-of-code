#! /usr/local/bin/dyalogscript
file ← ⊃⎕NGET 'input.txt' 1
+/{
  splitLine←⍵⊆⍨~⍵∊':'

  ⍝ first part of a line is a gameID, parse it into int and save
     gameID←⍎{⍵/⍨⎕D∊⍨⍵}⊃splitLine
 
  ⍝ convert second part of line to an array of arrays. each inner array is two elements: a number and a color
     sndPart←{⍵⊆⍨~⍵∊' '}¨{⍵⊆⍨~⊃+⌿(2 1⍴', ' '; ')⍷¨⊂⍵}⊃1↓splitLine
 
  ⍝ create a 3x2 matrix. 1st column is color names. 2nd column are the drawings of that color
     m←(2⊃¨sndPart){⍺(⊃¨⍵)}⌸sndPart
 
  ⍝ sort matrix above by sorting the values of the first column
     sortedM←(⊂⍋m[;1])⌷m
 
  ⍝ convert sortedMatrix to a matrix of only numbers. no color information.
  ⍝ also, transpose so that now each column corresponds to one color. before, each row corresponded to a color
     nums←⍉↑⍎¨¨sortedM[;2]
 
  ⍝ convert matrix above to be a vector, each element will be the max of its column
  ⍝ create new vector by subtracting 14 from first col (blue), 13 from second column (green), and 12 from last column (red)
  ⍝ get minimum of new vector. set variable to 1 if the minimum is greater than or equal to 0. or 0 if minimum is smaller than 0
     isPossible←0≤⌊/14 13 12-⌈⌿nums
 
  ⍝ if variable was 1 return gameID. if variable was 0 return 0
     isPossible×gameID
}¨file
