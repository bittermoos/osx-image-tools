#!/bin/bash
OUTPUT_BASE_DIR="~/Pictures/Archive"

get_creation_date () { mdls -name kMDItemContentCreationDate -raw "${1}" | cut -d' ' -f1; }
get_file_type () { file "${1}" | grep JPEG 1>/dev/null && echo jpeg || echo raw; }

for f in "$@"
do
  date_dir=$(get_creation_date "${f}")
  type_dir=$(get_file_type "${f}")
  target_dir="${OUTPUT_BASE_DIR}/${date_dir}/${type_dir}/"
  mkdir -p ${target_dir}
  cp -n "${f}" ${target_dir}
done
