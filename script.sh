#!/bin/bash

set -e

target_dir="pdfs"

# if target directory exists, delete it
if [ -d "$target_dir" ]; then
  rm -rf $target_dir
fi

# render qmd to pdf
while IFS=$'\t' read -r award; do
    echo "$award"
    quarto render dept-news.qmd --metadata award:"${award}" --output "${award}.pdf"
done < "input.txt"

mkdir $target_dir
mv *.pdf $target_dir