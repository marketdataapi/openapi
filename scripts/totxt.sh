#!/usr/bin/env bash
set -euo pipefail

1> output.txt

find . \
  -type d -name dist -prune -o \
  -type f \( -name "*.yaml" -o -name "*.yml" \) -print |
while IFS= read -r file; do
  rel="${file#./}"
  {
    echo "[begin $rel]"
    cat "$file"
    echo "[end $rel]"
    echo
  } >> output.txt
done

