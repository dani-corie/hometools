#!/bin/bash
 
FILENAME_INPUT=$1
FILENAME_STUB=$(basename "$FILENAME_INPUT" .pdf)

FILENAME_OUTPUT="$FILENAME_STUB-foldable.pdf"

FILENAME_TEMP1="$FILENAME_STUB-temp1.pdf"
FILENAME_TEMP2="$FILENAME_STUB-temp2.pdf"

pdfjam "$FILENAME_INPUT" '5-2' --angle 180 --a4paper --outfile "$FILENAME_TEMP1"
pdfjam "$FILENAME_INPUT" '6-8,1' --a4paper --outfile "$FILENAME_TEMP2"

pdfjam "$FILENAME_TEMP1" "$FILENAME_TEMP2" --landscape --a4paper --nup 4x2 --frame true --outfile "$FILENAME_OUTPUT"

rm "$FILENAME_TEMP1" "$FILENAME_TEMP2"
