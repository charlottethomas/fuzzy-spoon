#!/bin/bash
width=750;
filelist=`find ./ -name "*.jpg"`
for image_file in $filelist; do
  dirname=$(dirname "$image_file")
  filename=$(basename "$image_file")
  extension="${filename##*.}"
  hashname=$((0x$(sha1sum <<<"${filename%.*}"|cut -c1-8)))
  postname="${dirname##*/}"

  echo converting $filename in $dirname
  convert $image_file -resize ${width} $dirname/${postname}_${hashname}.${extension}
  mv $image_file $dirname/${postname}_${hashname}_full.${extension}
done
