#!/bin/bash

#'
#[2 2 2 2 2 1]
#[2 2 1]
#[1 2 1] => [1, -1]
#'

cat input.txt | jq -Rn '
  def is_safe:
    . as $arr
    | [range(1; length) | $arr[.] - $arr[.-1]] as $diffs
    | [range(1; $diffs|length) | [$diffs[.-1], $diffs[.]]] as $grouped_diffs
    | ([$diffs[] | select(. == 0 or abs > 3)] | length == 0) and
      ([$grouped_diffs[] | select((.[0] > 0) != (.[1] > 0))] | length == 0)
  ;
  
  def is_safe_dampened:
    . as $arr
    | [ range(length) | ($arr[:.] + $arr[.+1:])]
    | [ .[] | is_safe]
    | any
  ;
  
  reduce inputs as $report(
    0; 
    if ($report | split(" ") | [.[] | tonumber] | is_safe_dampened) then
      .+1
    else
      .
    end
  )
'
