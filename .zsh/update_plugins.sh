#!/bin/bash

PLUGIN_DIR="$HOME/.zsh"

echo "Updating zsh plugins..."

# zsh-autosuggestions
echo "Updating zsh-autosuggestions..."
rm -rf $PLUGIN_DIR/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $PLUGIN_DIR/zsh-autosuggestions
rm -rf $PLUGIN_DIR/zsh-autosuggestions/.git

# fzf-tab
echo "Updating fzf-tab..."
rm -rf $PLUGIN_DIR/fzf-tab
git clone --depth 1 https://github.com/Aloxaf/fzf-tab $PLUGIN_DIR/fzf-tab
rm -rf $PLUGIN_DIR/fzf-tab/.git

# syntax-highlighting
echo "Updating zsh-syntax-highlighting..."
rm -rf $PLUGIN_DIR/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $PLUGIN_DIR/zsh-syntax-highlighting
rm -rf $PLUGIN_DIR/zsh-syntax-highlighting/.git

echo "Done! Plugins updated successfully."

