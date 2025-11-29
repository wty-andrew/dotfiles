#!/usr/bin/env bash

input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size')
USAGE=$(echo "$input" | jq '.context_window.current_usage')

GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
  GIT_BRANCH=$(git branch --show-current 2>/dev/null)
fi

PERCENT_USED=0
if [ "$USAGE" != "null" ]; then
    CURRENT_TOKENS=$(echo "$USAGE" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    PERCENT_USED=$((CURRENT_TOKENS * 100 / CONTEXT_SIZE))
fi

# Catppuccin Palette
PINK=$'\e[38;2;244;184;228m'     # #f4b8e4
MAUVE=$'\e[38;2;202;158;230m'    # #ca9ee6
PEACH=$'\e[38;2;239;159;118m'    # #ef9f76
TEAL=$'\e[38;2;129;200;190m'     # #81c8be
BLUE=$'\e[38;2;140;170;238m'     # #8caaee
LAVENDER=$'\e[38;2;186;187;241m' # #babbf1
TEXT=$'\e[38;2;198;208;245m'     # #c6d0f5
SUBTEXT=$'\e[38;2;165;173;206m'  # #a5adce
SURFACE=$'\e[38;2;81;87;109m'    # #51576d
RESET=$'\e[0m'

color() { printf "%s" "${1}${*:2}${RESET}"; }

# Render
printf '%s' "$(color "$TEAL" "${CURRENT_DIR##*/}")"
if [ -n "$GIT_BRANCH" ]; then
  printf ' | %s' "$(color "$PINK" "$GIT_BRANCH")"
fi
printf ' | %s' "$(color "$BLUE" "$MODEL")"
printf ' | %s' "$(color "$PEACH" "Context: ${PERCENT_USED}%")"
printf '\n'
