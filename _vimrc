"=============================================================================
" NeoBundleでplugin管理設定
"=============================================================================
"
"
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim.git/
    call neobundle#rc(expand('~/dotfiles/vimfiles/bundle/'))

endif

 " My Bundles here:
 "
 " original repos on github
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'Lokaltog/vim-easymotion'
 "NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'} zencodingあるから無効
 NeoBundle 'tpope/vim-rails.git'
 NeoBundle 'mattn/zencoding-vim'
 NeoBundle 'sjl/gundo.vim'
 NeoBundle 't9md/vim-textmanip'
 NeoBundle 'mattn/hahhah-vim'
 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/vimproc'
 NeoBundle 'Shougo/vimshell'
 NeoBundle 'Shougo/vimfiler'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'Lokaltog/vim-powerline'
 NeoBundle 'nathanaelkane/vim-indent-guides'


 " vim-scripts repos
 NeoBundle 'L9'
 NeoBundle 'FuzzyFinder'
 NeoBundle 'surround.vim'
 "NeoBundle 'AutoComplPop' neocomplcacheがあるので無効
 NeoBundle 'css_color.vim'
 NeoBundle 'The-NERD-Commenter'
 NeoBundle 'unite.vim'
 "NeoBundle 'The-NERD-tree' vimfilerがあるので無効
 NeoBundle 'YankRing.vim'
 " non github repos
 NeoBundle 'git://git.wincent.com/command-t.git'

 filetype plugin on
 filetype indent on     " required! 

 """ Vundleでpluginの管理
 "set nocompatible               " be iMproved
 "filetype off                   " required!

 "set runtimepath+=~\vimfiles\bundle\vundle
 "call vundle#rc('~\vimfiles\bundle')
 "
 "" let Vundle manage Vundle
 " required! 
 " Bundle 'gmarik/vundle'

 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..



"=============================================================================
" 基本設定
"=============================================================================
"
"シンタックスON＝色付け
syntax on
colorscheme bespin
"
"新規htmlファイル作成時テンプレートを読み込む
autocmd BufNewFile *.html 0r ~/.vim/templates/skel.html

"新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルを作るディレクトリ
set backupdir=~/.vim/vimbackup
"
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"クリップボードをWindowsと連携
set clipboard=unnamed

"Vi互換をオフ
set nocompatible

"スワップファイル用のディレクトリ
set directory=~/.vim/vimbackup
"
"タブの代わりに空白文字を挿入する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

" コマンド入力欄の高さを3行分に設定
set cmdheight=3

" 常にステータスラインを表示
set laststatus=2

"シフト移動幅
"set shiftwidth=4
"
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
set wrapscan

"split時の移動キーマッピング
map <C-j> <C-W>j<C-w>_
map <C-k> <C-W>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-l> <C-w>l<C-w>_

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"ハアハアステータスライン
set statusline=%{g:HahHah()}\ %f\ %m%r%h%w[%Y][%{&fenc}][%{&ff}]%=%c,%l%11p%%

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

" タブをタブとして扱う(スペースに展開しない)
"set noexpandtab

".txtファイルで自動的に日本語入力ON
au BufNewFile,BufRead *.txt set iminsert=2
".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2


""表示系
"全角スペースを視覚化
highlight SpecialKey cterm=NONE ctermfg=gray guifg=gray
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

" tab文字と行末の可視化
set list
"set lcs=tab:>.,eol:$,trail:_,extends:\

" 不可視文字表示
se list lcs=
se lcs +=tab:>\ 
se lcs +=trail:_ "行末空白
se lcs +=extends:\ "画面に表示しきれない (続く)
se lcs +=precedes:< "画面に表示しきれない (続く)
se lcs +=eol:$
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

"カーソル行の強調表示
set cursorline


"スペースキーでカーソルを画面中心に保ってスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz

"<Leader><Leader>で変更があれば保存
noremap <Leader><Leader> :up<CR>

" <C-s>で保存
noremap <C-S>	:update<CR>
vnoremap <C-S>	<C-C>:update<CR>
inoremap <C-S>	<C-O>:update<CR>

"ノーマルモードでもエンターキーで改行を挿入
noremap <CR> o<ESC>

"ビジュアルモード時vで行末まで選択
vnoremap v $h

"コマンドモードで Ctl + v で貼り付ける
"cmap <C-v> <C-R>+ うまく動かないので無効

"挿入モードで Ctl + v で貼り付ける
imap <C-v> <C-R>+

"全て選択
nmap <silent> <F5> ggVG
nmap <silent> <F6> :%y<CR>


"=============================================================================
" プラグイン周りの設定
"=============================================================================
"
"
"""---------------------------------------------- FuzzyFinder.vimの設定
""vimのtab機能とFuzzyfinderを簡単にマッピング
"http://d.hatena.ne.jp/mickey24/20090310/1236633777
set showtabline=2

" Tabs
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" FuzzyFinder.vimのキーマッピング
nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'


"""---------------------------------------------- Nerd_Commenter の基本設定
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle


"""---------------------------------------------- Unite.vimの設定
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1 "縦分割で開く
let g:unite_winwidth = 40 "横幅40で開く

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
"inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR> zencodingで使いたいので無効

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction


"""---------------------------------------------- gundo用マッピング 
nmap U :<C-u>GundoToggle<CR>
"移動と同時にプレビューをしない
let g:gundo_auto_preview = 0


"""---------------------------------------------- textmanip.vim用の設定
""http://vim-users.jp/2011/07/hack223/
" 選択したテキストの移動
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)

" 行の複製
vmap <D-d> <Plug>(textmanip-duplicate-down)
nmap <D-d> <Plug>(textmanip-duplicate-down)


"""---------------------------------------------- neocomplcacheの設定
""http://vim-users.jp/2010/10/hack177/
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_enable_smart_case = 1 "neocomplcacheのsmart case機能を有効化します。 smart caseは'smartcase'と同様に、大文字が入力されるまで大文字小文字の区別を無視するという機能です。
let g:neocomplcache_enable_underbar_completion = 1 "これは_区切りの補完を有効化
let g:neocomplcache_min_syntax_length = 3 "シンタックスをキャッシュするときの最小文字長を3にしている
inoremap <expr><C-g> neocomplcache#undo_completion() ""前回行われた補完をキャンセル
inoremap <expr><C-l> neocomplcache#complete_common_string() ""補完候補のなかから、共通する部分を補完
inoremap <expr><C-y> neocomplcache#close_popup() "現在選択している候補を確定
inoremap <expr><C-e> neocomplcache#cancel_popup() "現在選択している候補をキャンセルし、ポップアップを閉じる


"""---------------------------------------------- vimshell用設定
""http://d.hatena.ne.jp/firepig/20101205/1291524527
let $PATH=$VIM.'\bin'.';'.$PATH

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "

" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>


"""---------------------------------------------- syntastic 文法チェック
""http://poozxxx.hatenablog.com/entry/2012/06/21/000914
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [], 
  \ 'passive_filetypes': ['html', 'javascript'] }
let g:syntastic_auto_loc_list = 1 
"let g:syntastic_javascript_checker = 'gjslint'


"""---------------------------------------------- YankRing.vimの説明↓
""http://nanasi.jp/articles/vim/yankring_vim.html


"""---------------------------------------------- Vim-EasyMotionの設定
""http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


"""---------------------------------------------- vim-indent-guidesの設定
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=233

let g:indent_guides_enable_on_vim_startup = 1


"""---------------------------------------------- zencodingの設定
"Ctrl+BをC-y,にする
imap <C-b> <C-y>,
