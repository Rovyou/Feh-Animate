# feh-gif-wallpaper

A simple script to set a **GIF** or other animated image as your wallpaper in i3 WM (or any WM/DE that supports `feh`).

## How It Works
- The script converts a GIF file into PNG frames using `ImageMagick (magick)`.
- All frames are stored in a folder named after the original GIF file.
- `feh` runs in a loop to render each frame with a given interval (default `0.1s`), creating an animated wallpaper effect.

## Requirements
Make sure the following packages are installed on your system:
- **feh** → sets images as wallpapers.
- **ImageMagick** (`magick`) → converts GIFs into frames.
- **xset** → checks whether the X server is running.
### Usage Guide

This script allows you to set an animated **GIF** as your wallpaper using `feh` and `ImageMagick`.
```
./Setup.sh example.gif
```

### Installation on Arch Linux / Manjaro
```
sudo pacman -S feh imagemagick xorg-xset
```
