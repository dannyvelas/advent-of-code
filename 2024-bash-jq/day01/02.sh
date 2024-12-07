#!/bin/bash


cat input.txt | jq -Rs '
  split("\n")[:-1]
  | [ .[] | split("   ") ]
  | (reduce .[] as $item (
      {};
      if .[$item[1]] == null then
        .[$item[1]] = 1
      else
        .[$item[1]] = .[$item[1]] + 1
      end
    )) as $secondFreqMap
  | reduce .[] as $item (
      0;
      if $secondFreqMap[$item[0]] != null then
        . + (($item[0]|tonumber) * $secondFreqMap[$item[0]])
      else
        .
      end
    )
'
