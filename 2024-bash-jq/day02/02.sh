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
    | [$diffs[] | select((. > 0 and $state == "pos") or (. < 0 and $state == "neg"))] as $goodsteps
    | if (($goodsteps|length) < (($diffs|length)-1)) then
        false
      else
        [range(1; $goodsteps|length) | $goodsteps[.] - $goodsteps[.-1]]
        | ([.[] | select(abs > 3)] | length>0)
      end
  ;
  .
  | split("\n")[:-1]
  | [ .[] | split(" ") | [.[] | tonumber] ]
  | .[]
  | is_safe
  #| reduce .[] as $report(0; if ($report | is_safe) then .+1 else . end)
'
