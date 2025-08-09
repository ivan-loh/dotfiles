#!/usr/bin/env bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${RED}Uninstalling dotfiles...${NC}"

for file in .shellrc .bashrc .bash_profile .zshrc .screenrc; do
    if [[ -L "$HOME/$file" ]]; then
        rm "$HOME/$file"
        echo "Removed $HOME/$file"
        
        # Restore backup if exists
        backup=$(ls -t "$HOME/$file.backup."* 2>/dev/null | head -1)
        if [[ -n "$backup" ]]; then
            mv "$backup" "$HOME/$file"
            echo -e "${GREEN}Restored $backup -> $HOME/$file${NC}"
        fi
    fi
done

echo -e "${GREEN}Uninstall complete!${NC}"
echo "Note: ~/.shellrc_local was preserved"