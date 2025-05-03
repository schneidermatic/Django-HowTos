#!/bin/bash

# This script downloads the latest versions of Flowbite and Tailwind CSS from CDN
# and saves them in the current directory.
# Make sure to run this script in the directory where you want to save the files.

# Tailwind CSS is a utility-first CSS framework for creating custom designs.
# For more information, visit the Tailwind CSS documentation:
# https://tailwindcss.com/docs/installation/play-cdn

# Flowbite is a library of UI components built on top of Tailwind CSS.
# For more information, visit the Flowbite documentation:
# https://flowbite.com/docs/getting-started/quickstart/

# Declare an array of "filename|url" pairs
files=(
  "flowbite_v312.min.css|https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css"
  "flowbite_v312.min.js|https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"
  "tailwind_v41.min.js|https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"
)

# Loop through the array and download each file
for entry in "${files[@]}"; do
  IFS='|' read -r filename url <<< "$entry"
  echo "Downloading $filename..."
  curl -o "$filename" "$url"
done

echo "All files downloaded successfully."