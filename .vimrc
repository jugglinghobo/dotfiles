call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim' " Silver Searcher
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-haml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'vim-scripts/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'Shutnik/jshint2.vim'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

Plug 'tpope/vim-abolish' " smart substitute with S
Plug 'tpope/vim-fugitive' " GIT plugin
Plug 'tpope/vim-surround' " Surround stuff with ys*
Plug 'Raimondi/delimitMate' " quote/bracket autocomplete
Plug 'tpope/vim-repeat' " DOT repeat for plugin commands of tpope
Plug 'tpope/vim-commentary' " GCC for comments

Plug 'MarcWeber/vim-addon-mw-utils' " snipmate dependency
Plug 'tomtom/tlib_vim' "snipmate dependency
Plug 'garbas/vim-snipmate' " snippets
Plug 'honza/vim-snippets' " snippets for snipmate
Plug 'tpope/vim-rbenv' " Rbenv support
Plug 'tpope/vim-endwise' " Adds 'end'

" Color schemes
Plug 'flazz/vim-colorschemes'
Plug 'kreeger/benlight'
Plug 'junegunn/seoul256.vim'
Plug 'blackgate/tropikos-vim-theme'
Plug 'xero/sourcerer.vim'

call plug#end()

" JSHint executable
set runtimepath+=~/.vim/bundle/jshint2.vim/
" run JSHint after every save
" let jshint2_save = 1

" We're running Vim, not Vi!
set nocompatible

" Show line numbers
set number

" Relative line numbers
" set rnu

" Always show status line
set laststatus=2

" Show git branch in status line
" set statusline=%<%f\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %h%m%r%=%-14.(%l,%c%V%)\ %{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %P

set ruler

" No backups
set noswapfile
set nobackup
set nowb

" Encoding and stuff
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix

" Smart indentation
filetype plugin on
filetype indent on

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Disable cursor blink
" set gcr=a:blinkon0

" Shut the fuck up
set visualbell
set noerrorbells

set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" Scroll horizontally to see entire line. No automatic wrapping
set nowrap

" Ignore case when searching
set ignorecase

" Only consider capital letters when explicitly typed
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" Highlight dynamically as pattern is typed
set incsearch

" Don' highligth matches by default
set nohlsearch

" Use old regexpengine, much fastah!
set regexpengine=1
" Jump to matches when entering regexp
set showmatch

" Show incomplete commands
" set showcmd

" http://usevim.com/2012/10/19/vim101-set-hidden/
set hidden

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the filename in the window titlebar
set title

" Show the current mode
set showmode

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show "invisible" characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Scrolling
set scrolloff=10 " Start scrolling when we're 10 lines away from margins
set sidescrolloff=10
set sidescroll=1

" Optimize for fast terminal connections
set ttyfast

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Enhance command-line completion
" set wildmenu

" Add the g flag to search/replace by default
set gdefault

" Don’t add empty newlines at the end of files
set noeol

" Word completion when spell checking enabled
" set complete+=kspell

" Use ag over Grep
set grepprg=ag\ --vimgrep

" Only redraw when necessary
set lazyredraw

set backspace=indent,eol,start

set splitright

" split key mappings
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Load bash profile
" set shellcmdflag=-ic

" Enable syntax highlighting
syntax on

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

augroup configgroup
  autocmd!
  " Automatically wrap text after 80 lines in markdown files
  autocmd BufRead,BufNewFile *.md set wm=2 tw=80

  " Treat .json files as .js
  autocmd BufRead,BufNewFile *.json setfiletype json syntax=javascript

  " Custom filetypes
  autocmd BufRead,BufNewFile *.prawn set filetype=ruby
  autocmd BufRead,BufNewFile .punchrc set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufEnter *.rb syn match error contained "\<binding.pry\>"

  " Enable autocomplete for ruby files
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " Highlight fenced code blocks in markdown files
  let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

  " Stuff I don't care about when writing,
  autocmd FileType gitcommit,markdown,text,tex set nornu nolist

  autocmd FileType markdown map <leader><CR> :! pandoc % \| bcat<CR>

  autocmd BufRead,BufNewFile *.bib set nornu nolist

  " Where to wrap lines
  autocmd FileType haml,html,tex set wrap
  autocmd FileType haml,html,tex noremap <buffer> j gj
  autocmd FileType haml,html,tex noremap <buffer> k gk

  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

if has("gui_running")
  syntax on
  set bs=2
  set background=light
endif

let mapleader = "\<Space>"

" Because rbenv rubies take ages to load
let g:ruby_path = system('echo $HOME/.rbenv/shims')

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

" Center screen on current line
" nnoremap <silent> <C-l> zz
" Search for word under cursor with K
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>
" Into the void
nnoremap ; :
nnoremap , ;

" apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<CR>

nnoremap <leader>x :%s/\s\+$//<CR>

" Search with leader
map <leader>t :CtrlP<CR>
" Search most recently used
map <leader>r :CtrlPMRU<CR>
" Search buffer
map <leader>p :CtrlPBuffer<CR>
map <leader>b :CtrlPBuffer<CR>
map <C-M> :CtrlPBuffer<CR>

" Search file
map <leader>s :%s/
" Use abolish search
map <leader>S :%Subvert/
" Search globally
map :A :Ag!<space>
" Search with ag from previous search
" map :A :AgFromSearch!<space>
" Replace double quotes with single quotes
map :" :s/"/'/<CR>
map :' :s/'/"/<CR>
" Replace tightened brackets with loose brackets
" map :{ :s/{\(.*[^}]\)/{ \1 /<CR>

" Reformat bracketed block to do..end block
map <leader>r ^f{xido<CR>A\<BS>\<BS><CR>endkf(a<CR>:s/, :/,\r:/<CR>A<BS><BS>i<CR>j=%

" Toggle :focus in specs
map <c-f> :s/\(.*\)[^do]/\= submatch(0) =~ ':focus' ?
      \substitute(submatch(1), ', :focus', ' ', 'g') :
      \"".submatch(1).", :focus "/<CR>:w<CR>

" Save with W
nnoremap :W :w
" Blame
" map <leader>b :Gblame<CR>
" Shell commands
map <leader>; :!
" Fast save
" map <leader>w :w<CR>
" Edit alternative (spec) file in split
" map <leader>st :AV<CR>
" Edit vimrc
" map <leader>ev :vs $MYVIMRC<CR>
" Toggle Git Gutter
" map <leader>g :GitGutterToggle<CR>
" Fast help
" map <leader>h :help<space>

" Stop
map <leader><leader>; :stop<CR>


" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>)])))))]))))

" nnoremap <tab>   <c-w>w
" nnoremap <S-tab> <c-w>W

if has('nvim')
  tnoremap <Esc> <c-\><c-n>
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" let g:aghighlight=1

" Stuff for Ctrl-p to ignore
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Don't open in split when tree is open
let g:ctrlp_dont_split = 'netrw'

let g:ctrlp_user_command = 'ag %s -l --hidden -g ""'


" Use pymatcher for super fast matchig.
" if has('nvim')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" endif

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" Do not clear filenames cache, to improve CtrlP startup
let g:ctrlp_clear_cache_on_exit = 0

" Similar to nerdtree
let g:netrw_liststyle=3

" I still hate balloons
let g:netrw_nobeval=1

" .ctrlp marks root
let g:ctrlp_root_markers = ['.ctrlp']

" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240

let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1

" Because I can't type for shit
iab relaod reload
iab relado reload
iab udpate update
iab udpate_attribute update_attribute
iab udpate_attributes update_attributes
iab fasle false
iab flase false
iab shuold should

" Umlaute
" inoremap ae ä
" inoremap ue ü
" inoremap oe ö
" inoremap Ae ä
" inoremap Ue ü
" inoremap Oe ö

" inoremap <C-c> <nop>

" source local vimrc
if filereadable(glob(".vimrc.local"))
  source .vimrc.local
endif

set background=dark
colorscheme blazer

