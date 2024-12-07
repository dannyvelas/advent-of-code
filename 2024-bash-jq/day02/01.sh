#!/bin/bash

cat input.txt | jq -Rs '
  .
  | split("\n")[:-1]
  | [ .[] | split(" ") | [.[] | tonumber] ]
  | reduce .[] as $report(
      0;
      [range(1; $report | length) | $report[.] - $report[.-1]] as $diffs
      | if ([$diffs[] | select(. == 0 or abs > 3)] | length > 0) then
          .
        elif ([$diffs[] | select(. < 0)] | length > 0) and ([$diffs[] | select(. > 0)] | length > 0) then
          .
        else
          . + 1
        end
    )
'
