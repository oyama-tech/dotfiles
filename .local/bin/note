#!/usr/bin/env bash
set -euo pipefail

# 設定（環境変数で上書き可）
NOTES_DIR="${NOTES_DIR:-$HOME/notes}"
DATE_FMT="${DATE_FMT:-%Y-%m-%d}"

# 引数：today（デフォルト）、または YYYY-MM-DD
input="${1:-today}"

# 入力 -> 日付文字列に解決
if [[ "$input" == "today" ]]; then
  datestr="$(date +"$DATE_FMT")"
else
  # 簡易バリデーション（YYYY-MM-DD）
  if [[ ! "$input" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Usage: note [today|YYYY-MM-DD]" >&2
    exit 1
  fi
  datestr="$input"
fi

mkdir -p "$NOTES_DIR"

file="$NOTES_DIR/$datestr.md"

# 初回ならテンプレから生成 or デフォルト生成
if [[ ! -f "$file" ]]; then
  if [[ -f "$NOTES_DIR/.template.md" ]]; then
    sed \
      -e "s/{{DATE}}/$datestr/g" \
      -e "s/{{TITLE}}/$datestr notes/g" \
      "$NOTES_DIR/.template.md" > "$file"
  else
    {
      printf "# %s\n\n" "$datestr"
      printf "- "
    } > "$file"
  fi
fi

cd "$NOTES_DIR"
exec nvim "$file"
