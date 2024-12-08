#!/bin/bash

regex="mul\((\d{1,3}),(\d{1,3})\)"

cat input.txt | jq -Rn --arg regex $regex '
  def compute_line:
    [ match($regex; "g") | ( [ .captures[].string | tonumber] | reduce .[] as $e(1; .*$e)) ]
    | add
  ;
  
  reduce inputs as $report(
    0; 
    . + ($report | compute_line)
  )
'
