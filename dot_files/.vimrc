
" 構文ハイライト
syntax enable

set background=dark
set background=light
colorscheme desert

" 行番号を表示
set number

" vim 空白可視化
set list
set listchars=tab:»-,trail:-,extends:»,eol:_,precedes:«,nbsp:%

" タブをスペースに置き換える
set expandtab

" タブに対するスペースの大きさ
set tabstop=4
set shiftwidth=4
set softtabstop=0

" Makefileはnoexpandtabでいきたい
if expand("%:t") =~ "Makefile"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

" 言語別のソフトタブ化
" for Python
augroup Python
   autocmd!
   autocmd FileType python setl tabstop=4 softtabstop=4 shiftwidth=4  expandtab
   autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" for Ruby
augroup Ruby
   autocmd!
   autocmd FileType python setl tabstop=2 softtabstop=4 shiftwidth=4  expandtab
   autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
augroup END

" ターミナルからクリップボードにコピー&ペースト
map "Y "*y
map "P "*p

" ファイル新規作成時にテンプレートの値を挿入
" ruby
" #!/usr/bin/env ruby
autocmd BufNewFile *.rb   0r $HOME/.vim/templates/ruby.rb 
" python
" #!/usr/bin/env python
" # -*- coding: utf-8 -*-
autocmd BufNewFile *.py   0r $HOME/.vim/templates/python.py
" html
" http://qiita.com/saba1024/items/e2a057e8a41a6f89cac8
autocmd BufNewFile *.html 0r $HOME/.vim/templates/html.html

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" ステータスラインを常に表示する
set laststatus=2

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on
