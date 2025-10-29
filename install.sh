#!/usr/bin/env bash
# arieltr
# symlink dotfiles to system
set -e

BLUE="\033[34m"
GREEN="\033[32m"
RED="\033[31m"
MAGENTA="\033[35m"
RESET="\033[0m"

echo -e "${MAGENTA}Installing dotfiles...${RESET}"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAPPING_FILE="$DOTFILES_DIR/dotfiles.list"

if [[ ! -f "$MAPPING_FILE" ]]; then
    echo -e "${RED}Mapping file \"dotfiles.list\" not found in $DOTFILES_DIR${RESET}"
    exit 1
fi

while IFS= read -r line; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    src=$(echo "$line" | awk '{print $1}')
    dest=$(echo "$line" | awk '{print $2}')

    mkdir -p "$(dirname "$dest")"

    if [[ -e "$dest" || -L "$dest" ]]; then
        mv "$dest" "$dest.bak"
        echo -e "${RED}Backed up $dest${RESET}"
    fi

    ln -s "$DOTFILES_DIR/$src" "$dest"
    echo -e "${GREEN}Linked ${BLUE}$src -> $dest${RESET}"

done < "$MAPPING_FILE"

echo -e "${MAGENTA}All dotfiles installed!${RESET}"
