#!/bin/bash

input_source=$1
filename=$(basename -- "$input_source")
extension="${filename##*.}"
filename="${filename%.*}"

idx=1
output_duration=1800

while ffmpeg -i $input_source -t $output_duration -ss $((($idx-1)*$output_duration)) $filename-$idx.$extension; do
    idx=$((idx+1))
done

