set nocompatible " be iMproved
set rtp+=/usr/local/opt/fzf
set clipboard=unnamed
set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on
set report=0
set regexpengine=1
filetype plugin indent on

" Ruby stuff
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins 
augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END
" ================

" Syntax highlighting and theme

syntax enable

" Configs to make Molokai look great
" set background=dark
" let g:molokai_original=1
  let g:rehash256=1
" set t_Co=256
" colorscheme nord 

color nord

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Lovely linenumbers
set nu

" My leader key
let mapleader=","

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

map <Leader>c :call <CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file

set laststatus=2
" clear highlighted characters from a search result 
map <C-c> :nohlsearch<cr>

" The no arrows key movement
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
runtime! macros/matchit.vim

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup
set lazyredraw
" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

let g:typescript_indent_disable = 1

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" Buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" File search
nnoremap <S-f> :Files!<return>
" Word search in files
nnoremap <C-f> :Ag<return>
" Tabbing between buffers
nnoremap <S-b> :Buffers<CR>
" Comment blocks using #
autocmd FileType apache setlocal commentstring=#\ %s
