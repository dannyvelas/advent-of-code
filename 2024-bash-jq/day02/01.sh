#!/bin/bash

cat input.txt | jq -Rs '
  def is_safe:
    (if .[0] < .[1] then "increasing" else "decreasing" end) as $state
    | reduce .[] as $el(
        {prev: -1, result: true};
        (($el - .prev) | abs) as $abs
        | if .prev != -1 and ($abs < 1 or $abs > 3) then
            .result = false
          elif .prev != -1 and .result and $state == "increasing" and .prev > $el then
            .result = false
          elif .prev != -1 and .result and $state == "decreasing" and .prev < $el then
            .result = false
          else
            .
          end
        | .prev = $el
      )
    | .result
  ;
  
  .
  | split("\n")[:-1]
  | [ .[] | split(" ") | [.[] | tonumber] ]
  | reduce .[] as $report(
      0;
      if ($report | is_safe) then . + 1 else . end
    )
'
