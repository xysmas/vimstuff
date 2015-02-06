set nocompatible
set nu
set incsearch
set hlsearch
set showmatch
set softtabstop=2 
set shiftwidth=2 
set expandtab
set modeline
set autoindent
set smartindent
set cindent
set mouse=a

set ignorecase
set smartcase
set magic

set formatoptions+=t
set tw=79

filetype off
" set the runtime path to include Vundle and initialize

set rtp+=~/vimstuff/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/vimstuff/bundle')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'Raimondi/delimitMate'
Plugin 'lervag/vim-latex'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif

"Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>



" runtime autoload/pathogen.vim
" execute pathogen#infect('$HOME/vimstuff/bundle/{}')

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

let g:EclimCompletionMethod = 'omnifunc'



"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"  autocmd BufEnter * match OverLength /\%74v.*/
"augroup END
set wildmenu              " Better command line auto-completion
set wildchar=<Tab>        " Set char to trigger wild-card expandsion in
                          " command line
set wildmode=list:longest " Settings for when wildchar is used

" Ignore the following stuff when expanding wildcards
set wildignore+=*.o,*.obj,.git,.svn
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.mp3
set wildignore+=*.sw?


function SetXeTex()
  let g:Tex_CompileRule_pdf = 'xelatex -src-specials -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>


function CompileXeTex()
  let oldCompileRule=g:Tex_CompileRule_pdf
  let g:Tex_CompileRule_pdf = 'xelatex  -src-specials -interaction=nonstopmode $*'
  call Tex_RunLaTeX()
  let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeTex()<CR>

nnoremap ; :
" for airline to show up at first open
set laststatus=2

" force python to use tabs of two spaces
au FileType python setl sw=2 sts=2 et
" makes backspace work correctly
set backspace=indent,eol,start

