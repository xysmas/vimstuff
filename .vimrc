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
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
autocmd filetype python set expandtab
autocmd filetype python set sw=4
autocmd filetype python set softtabstop=4
autocmd filetype python set smarttab
" makes backspace work correctly
set backspace=indent,eol,start


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


" vim-latex stuff
" this one sets leader+x to compile with xelatex
" function SetXeTex()
  " let g:Tex_CompileRule_pdf = 'xelatex -src-specials -interaction=nonstopmode $*'
" endfunction
" map <Leader>lx :<C-U>call SetXeTex()<CR>


function CompileXeTex()
  let oldCompileRule=g:Tex_CompileRule_pdf
  let g:Tex_CompileRule_pdf = 'xelatex  -src-specials -interaction=nonstopmode $*'
  call Tex_RunLaTeX()
  let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeTex()<CR>

" huge timesaver
nnoremap ; :
"
" for airline to show up at first open
set laststatus=2
"
" quick switching between windows
set wmw=0
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>

"
set splitbelow
set splitright

" Visualize tabs, trailing whitespaces and funny characters
" http://www.reddit.com/r/programming/comments/9wlb7/proggitors_do_you_like_the_idea_of_indented/c0esam1
" https://wincent.com/blog/making-vim-highlight-suspicious-characters
set list
set listchars=nbsp:¬,tab:»·,trail:·

" Breaking lines with \[enter] without having to go to insert mode
nmap <leader><cr> i<cr><Esc>


" options for airlinelet
let g:airline_powerline_fonts = 1
" spelling
setlocal spell spelllang=en_us

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
