# ====== PATH ======
export PATH="$HOME/.local/bin:$PATH"

# ====== history settings ======
setopt sharehistory
setopt histignorealldups

# ====== 補完 ======
autoload -Uz compinit
compinit

# ====== HHKB / vi 風カーソル移動（Ctrl+H/J/K/L） ======
# Ctrl+H → 左
bindkey '^H' backward-char
# Ctrl+J → 下（次の履歴 / 次の行）
bindkey '^J' down-line-or-history
# Ctrl+K → 上（前の履歴 / 前の行）
bindkey '^K' up-line-or-history
# Ctrl+L → 右
bindkey '^L' forward-char

# ====== HHKB Delete キー (Fn+~) を Delete として認識させる ======
bindkey '\e[3~' delete-char
bindkey -M viins '\e[3~' delete-char
bindkey -M vicmd '\e[3~' delete-char

# #zsh で「最強の快適さ」を作るための “推奨3つセット
# ====== autosuggestions（過去履歴の薄い文字） ======
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777777'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ====== fzf-tab（Tab 補完を最強にする） ======
source ~/.zsh/fzf-tab/fzf-tab.zsh

# ====== syntax-highlighting（文法色付け、最後に書く！） ======
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===== eza (ls の上位互換) =====
# EZA_COLORS="uu=2;33:gu=2;33"
# export EZA_COLORS="di=38;5;104:fi=38;5;129:ln=38;5;147:ex=38;5;99:uu=38;5;57:gu=38;5;57"
export EZA_COLORS="\
di=38;5;63:\
fi=38;5;254:\
ln=38;5;69:\
lp=38;5;99:\
ex=38;5;40:\
uu=38;5;57:\
gu=38;5;57:\
ur=38;5;12:\
uw=38;5;57:\
ux=38;5;93:\
ue=38;5;99:\
gr=38;5;12:\
gw=38;5;57:\
gx=38;5;93:\
tr=38;5;12:\
tw=38;5;57:\
tx=38;5;93:\
da=38;5;12"
alias ls="eza --group --icons --color=auto --time-style=long-iso"
alias ll="eza -l --group --icons --color=auto --time-style=long-iso"
alias la="eza -la --group --icons --color=auto --time-style=long-iso"

# --- EDITOR setting ------
export EDITOR=nvim

# --- yazi setting --------
alias y="yazi"

function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"

    yazi "$@" --cwd-file="$tmp"

    if cwd="$(cat "$tmp")" && [ -n "$cwd" ]; then
        cd "$cwd"
    fi

    rm -f "$tmp"
}

# --- zoxide setting ---------------------
eval "$(zoxide init zsh)"

# ====== プロンプト ======
# export PROMPT="%n@%m %~ %# "
eval "$(starship init zsh)"

# fzf key binding ------------------------
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
