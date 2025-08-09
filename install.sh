#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Installing dotfiles...${NC}"

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Backup and link function
link_file() {
    local src="$1"
    local dst="$2"
    
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        mv "$dst" "$dst.backup.$(date +%Y%m%d)"
        echo -e "${YELLOW}Backed up existing $dst${NC}"
    fi
    
    ln -sf "$src" "$dst"
    echo -e "${GREEN}Linked $src -> $dst${NC}"
}

# Link core files
link_file "$DOTFILES/.shellrc" "$HOME/.shellrc"
link_file "$DOTFILES/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES/.bash_profile" "$HOME/.bash_profile"
link_file "$DOTFILES/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/.screenrc" "$HOME/.screenrc"

# Create local config if needed
if [[ ! -f "$HOME/.shellrc_local" ]]; then
    cat > "$HOME/.shellrc_local" << 'EOF'
#!/usr/bin/env bash
# Machine-specific settings

# export DEV_ID="i-1234567890abcdef0"
# export EDITOR="vim"
# alias myproject="cd ~/Projects/myproject"
EOF
    echo -e "${GREEN}Created ~/.shellrc_local for machine-specific settings${NC}"
fi

mkdir -p "$HOME/bin"

echo -e "${GREEN}Installation complete!${NC}"
echo "Reload your shell: source ~/.${SHELL##*/}rc"