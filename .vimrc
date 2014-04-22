set nocompatible

" Initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax enable
filetype plugin indent on
let g:load_doxygen_syntax=1

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Color scheme
set background=dark
colorscheme solarized

" Add line numbers
set number
set ruler

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" enable mouse
set mouse=a

" Height of command bar
"set cmdheight=2

" enable WiLd menu
set wildmenu
set wildignore=*0,*~

" a buffer becomes hidden when it is abandoned
set hid

" don't redwar while executing macors
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
set mat=2

" Always show status line
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" 0 to first non-blank character
map 0 ^

" Strip trailing whitespaces on each save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" make uses real tabs
au FileType make set noexpandtab

" Highlight characters behind the 120 chars margin
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" Disable code folding
set nofoldenable

" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.o$', '\.d$', '\.bak$']

" Taglist
map <C-i> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1
" let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1

" Doxygen Toolkit
let g:DoxygenToolkit_briefTag_pre = "   "
let g:DoxygenToolkit_paramTag_pre = "   \\param "
let g:DoxygenToolkit_returnTag = "   \\returns "

" OmniCppComplete
map <C-F12> :!ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Returns true if paste mode is enabled
fun! HasPaste()
  if &paste
    return 'PASTE MODE '
  en
  return ''
endfun

