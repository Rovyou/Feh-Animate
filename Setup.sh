#!/bin/bash
# set -x

feh_render() {

  if ! xset q &>/dev/null; then
    echo "X server not running. Exiting."
    exit 1
  fi

  if [ -z "$dir" ]; then
    pattern="*"
  else
    pattern="$dir/*"
  fi

  if [ -z "$2" ]; then
    interval="0.1"
  else
    interval=$2
  fi

  while xset q &>/dev/null; do
    for image in $pattern; do
      if feh --bg-center "$image" 2>/dev/null; then
        sleep "$interval"
        if ! xset q &>/dev/null; then
          exit 0
        fi
      else
        echo "The $dir folder does not have any photo, please delete the $dir folder first"
        exit -1
      fi
    done
  done
}

convert_img_folder() {
  magick $1 -coalesce $dir"/"$name"%03d.png"
  feh_render
}

base="$(basename -- "$1")"
name="${base%.*}"
dir=$name

if [ -z "$1" ]; then
  exit -1
fi

if mkdir $dir 2>/dev/null; then
  convert_img_folder $1
else
  feh_render
fi
