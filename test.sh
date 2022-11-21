#!/bin/bash

TEST=(
  x
  a,b
  2323
  4,5
)

for i in ${TEST[@]}
do
  IFS=$','
  set $i
  echo $1
  echo $2
done