#!/usr/bin/env bash
input=$(cat)

if command -v jq >/dev/null 2>&1; then
  model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
  used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
  cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "."')
else
  model="Unknown"
  used_pct=""
  cwd="."
fi

ctx_label="ctx: ${used_pct:---}%"
stage="Idea"
if [ -f "$cwd/production/stage.txt" ]; then
  stage=$(head -1 "$cwd/production/stage.txt" | tr -d '\r\n')
fi

printf "%s | %s | %s" "$ctx_label" "$model" "$stage"
