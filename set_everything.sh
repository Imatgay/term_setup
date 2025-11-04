#!/bin/sh

set -e

P10K_DIR="$HOME/powerlevel10k"
VIM_BUNDLE_DIR="$HOME/.vim/bundle"
EVERFOREST_DIR="$VIM_BUNDLE_DIR/everforest"
ZSHRC_PATH="$HOME/.zshrc"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

# 1.  Powerlevel10k 
echo "Checking Powerlevel10k..."
if [ ! -d "$P10K_DIR" ]; then
    echo "Cloning Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
    echo "Powerlevel10k already cloned."
fi

# 2. Everforest
echo "Checking Everforest Vim theme..."
mkdir -p "$VIM_BUNDLE_DIR"

if [ ! -d "$EVERFOREST_DIR" ]; then
    echo "Cloning Everforest (color schee for vim)..."
    git clone --depth=1 https://github.com/sainnhe/everforest.git "$EVERFOREST_DIR"
else
    echo "Everforest already cloned."
fi

# 3. dotfiles
echo "Copying config files to $HOME..."

CONFIG_FILES=".vimrc .p10k.zsh"

for file in $CONFIG_FILES; do
    SOURCE_FILE="$SCRIPT_DIR/dotfiles/$file"
    if [ -f "$SOURCE_FILE" ]; then
        cp -f "$SOURCE_FILE" "$HOME/"
        echo "Copied $file."
    else
        echo "Warning: $file not found in $SCRIPT_DIR. Skipping."
    fi
done

# 3a. Configure .zshrc ---
P10K_SOURCE_LINE='source ~/powerlevel10k/powerlevel10k.zsh-theme'
P10K_CONFIG_COMMENT='# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.'
P10K_CONFIG_LINE='[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh'

if ! grep -qF "$P10K_SOURCE_LINE" "$ZSHRC_PATH"; then
    echo "Adding Powerlevel10k source to $ZSHRC_PATH"
    echo "\n# Powerlevel10k Theme
$P10K_SOURCE_LINE" >> "$ZSHRC_PATH"
else
    echo "Powerlevel10k source already in $ZSHRC_PATH."
fi

if ! grep -qF "$P10K_CONFIG_LINE" "$ZSHRC_PATH"; then
    echo "Adding Powerlevel10k config to $ZSHRC_PATH"
    echo "\n# Powerlevel10k Config
$P10K_CONFIG_COMMENT
$P10K_CONFIG_LINE" >> "$ZSHRC_PATH"
else
    echo "Powerlevel10k config already in $ZSHRC_PATH."
fi

printf "Relaunch shell to apply changes now? (y/n) "
read -r response

case "$response" in
    [yY]|[yY][eE][sS])
        echo "Relaunching shell..."
        exec zsh
        ;;
    *)
        echo "Please relaunch your shell manually at your convenience (e.g., run 'exec zsh')."
        ;;
esac

