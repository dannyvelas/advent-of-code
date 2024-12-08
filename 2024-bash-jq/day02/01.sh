#!/bin/bash

cat input.txt | jq -Rs '
  def is_safe:
    . as $arr
    | [range(1; length) | $arr[.] - $arr[.-1]] as $diffs
    | [range(1; $diffs|length) | [$diffs[.-1], $diffs[.]]] as $grouped_diffs
    | ([$diffs[] | select(. == 0 or abs > 3)] | length == 0) and
      ([$grouped_diffs[] | select((.[0] > 0) != (.[1] > 0))] | length == 0)
  ;
  .
  | split("\n")[:-1]
  | [ .[] | split(" ") | [.[] | tonumber] ]
  | reduce .[] as $report(0; if ($report|is_safe) then .+1 else . end)
'
