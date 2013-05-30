## zmv
autoload zmv

## 言語
export LANG=en_US.UTF-8

## emacsキーバインド
bindkey -e

## 補完機能
autoload -U compinit
compinit -u

## 補完で大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt hist_ignore_dups
setopt share_history

## 色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

## PATH設定
export MANPATH=/opt/local/man:$MANPATH
export PATH=/usr/local/bin:usr/local/sbin:/opt/local/bin:/opt/local/sbin/:$PATH

local GREEN=$'%{\e[0;32m%}'
local PINK=$'%{\e[0;35m%}'
local DEFAULT=$'%{\e[0;m%}'

# branch名の表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' - (%b)'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="$GREEN OcBookPro%1(v|%F{green}%1v%f|) %(!.#.$) $DEFAULT"
RPROMPT="[$PINK%~$DEFAULT]"

## コピペしやすいようにコマンド実行後は右プロンプトを消す
setopt transient_rprompt

alias  javac='javac -J-Dfile.encoding=UTF8'
alias  java='java -Dfile.encoding=UTF8' 

export java7=/Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents/Home/bin/java
export java7c=/Library/Java/JavaVirtualMachines/jdk1.7.0_07.jdk/Contents/Home/bin/javac

alias emacs="emacs -nw"
alias resh="source ~/.zshrc"
alias ls="ls -G -w"
alias jpf='/Users/e115747/Desktop/jpf-core/bin/jpf'

export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export PATH=$PATH:/Users/e115747/.rbenv/versions/1.9.3-preview1/lib/ruby/gems/1.9.1/gems/rvm-1.11.3.5/lib
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## pushdの設定
setopt auto_pushd

alias urasoe="ssh urasoe"
alias yomitan="ssh yomitan"

## Android用
PATH=/Users/e115747/Library/android-sdk-macosx/tools:$PATH
PATH=/Users/e115747/Library/android-sdk-macosx/platform-tools:$PATH

## processing
PATH=/Users/e115747/Desktop/processing-1.5.1/processing:$PATH

## ディレクトリを記憶
setopt auto_pushd

## コマンドの間違いを指摘
setopt correct

## 補完候補を詰めて表示
setopt list_packed

# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..

# フルパスの時でも今のディレクトリを外す場合の設定
zstyle ':completion:*' ignore-parents parent pwd

# kkzさん見てください！
eval "$(rbenv init -)"

# hgの文字コード
export HGENCODING=UTF-8

# Pyhon環境変数
export PYTHONSTARTUP=~/.pystartup

typeset -U path
