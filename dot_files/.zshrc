
## 補完機能
autoload -U compinit
compinit -u

## 補完で大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..
# フルパスの時でも今のディレクトリを外す場合の設定
zstyle ':completion:*' ignore-parents parent pwd

## 環境変数LANG
# export LANG=ja_JP.UTF-8
# $ printenv
# で確認すると、既に設定されてたからコメントアウト

## 色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
local GREEN=$'%{\e[0;32m%}'
local PINK=$'%{\e[0;35m%}'
local DEFAULT=$'%{\e[0;m%}'

## lsをカラーで表示
alias ls="ls -G -w"


## プロンプト
PROMPT="$GREEN OcBookPro%1(v|%F{green}%1v%f|) %(!.#.$) $DEFAULT"
RPROMPT="[$PINK%~$DEFAULT]"
# PROMPT   : デフォルトのプロンプト
# RPROMPT  : 右側に表示するプロンプト

## branch名の表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' - (%b)'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

## コピペしやすいようにコマンド実行後は右プロンプトを消す
setopt transient_rprompt


## コマンド履歴機能
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

## emacsキーバインド
bindkey -e
# Ctrl-R で履歴をさかのぼりたい癖が抜けない・・・

## cd の履歴を参照できる
setopt auto_pushd
# cd -[ここでTabを押す]
# 補完機能とセット

## 補完候補を詰めて表示
setopt list_packed


## 複数ファイルを一括リネームするzmv
autoload -Uz zmv
alias zmv='noglob zmv -W'



## .zshrc.mine に書かれた設定を.zshrc の設定に加える
# これにより、テスト的に機能を追加することができる
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

