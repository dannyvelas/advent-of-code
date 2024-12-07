#!/bin/bash

#'
#[2 2 2 2 2 1]
#[2 2 1]
#[1 2 1] => [1, -1]
#'

cat input.txt | jq -Rs '
  def is_safe:
    . as $arr
    | [range(1; length) | $arr[.] - $arr[.-1]] as $diffs
    | ([$diffs[]|select(. > 0)]|length) as $amt_pos
    | ([$diffs[]|select(. < 0)]|length) as $amt_neg
    | (if $amt_pos >= $amt_neg then "pos" else "neg" end) as $state
    | [$diffs[] | (. != 0 and abs <= 3 and ((. > 0 and $state == "pos") or (. < 0 and $state == "neg")))] as $level_results
    | $level_results
    #| (([$level_results[] | select(.|not)]|length) <= 1)
  ;
  [1,2,7,8,9] | is_safe
  #.
  #| split("\n")[:-1]
  #| [ .[] | split(" ") | [.[] | tonumber] ]
  #| reduce .[] as $report(0; if ($report | is_safe) then .+1 else . end)
'