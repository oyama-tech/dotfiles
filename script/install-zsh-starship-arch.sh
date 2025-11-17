#!/usr/bin/env bash
set -e

echo "=== Arch Linux: zsh + starship インストール ==="

# ---- 必要パッケージ ----
sudo pacman -Sy --noconfirm zsh starship eza

# ---- ~/.zshrc に starship 初期化を追加（重複しないようチェック）----
if ! grep -q 'starship init zsh' "$HOME/.zshrc" 2>/dev/null; then
  echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
  echo ">> ~/.zshrc に starship init を追加しました。"
else
  echo ">> ~/.zshrc にはすでに starship init が存在します。"
fi

# ---- デフォルトシェルを zsh に設定 ----
ZSH_PATH="$(command -v zsh)"

if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  echo ">> デフォルトシェルを zsh に変更します..."
  chsh -s "$ZSH_PATH"
  echo ">> デフォルトシェルの変更完了。（次回ログインから有効）"
else
  echo ">> デフォルトシェルはすでに zsh です。"
fi

# ---- bash 起動時に自動で zsh に移行する保険設定 ----
# いまのログインシェルが bash の場合のみ、~/.bashrc の末尾に追加
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  if ! grep -q 'exec zsh' "$HOME/.bashrc" 2>/dev/null; then
    echo 'exec zsh' >> "$HOME/.bashrc"
    echo ">> ~/.bashrc に 'exec zsh' を追加（当面の間、自動で zsh に切り替わります）"
  fi
fi

echo "=== 完了！ログアウトして再ログインすると zsh がデフォルトになります ==="

