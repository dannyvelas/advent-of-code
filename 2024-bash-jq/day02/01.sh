#!/bin/bash

cat input.txt | jq -Rs '
  def is_safe:
    (if .[0] < .[1] then "increasing" else "decreasing" end) as $state
    | . as $arr
    | [range(1; length) | $arr[.] - $arr[.-1]] 
    | if ([.[] | select(. == 0 or abs > 3)] | length > 0) then
        false
      elif ([.[] | select(. < 0)] | length > 0) and ([.[] | select(. > 0)] | length > 0) then
        false
      else
        true
      end
  ;

  .
  | split("\n")[:-1]
  | [ .[] | split(" ") | [.[] | tonumber] ]
  | reduce .[] as $report(
      0;
      if ($report | is_safe) then . + 1 else . end
    )
'
