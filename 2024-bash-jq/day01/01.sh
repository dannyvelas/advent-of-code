#!/bin/bash


cat input.txt | jq -Rs '
  split("\n")[:-1]
  | [ .[] | split("   ") | [.[] | tonumber ]]
  | ([.[] | .[0]] | sort) as $first
  | ([.[] | .[1]] | sort) as $second
  | reduce ($first | to_entries[]) as $f (
      0;
      . + (($f.value - $second[$f.key]) | abs)
    )
'
