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

" Map auto complete of (, ", ', [
 "inoremap $1 ()<esc>i
 "inoremap $2 []<esc>i
 "inoremap $3 {}<esc>i
 "inoremap $4 {<esc>o}<esc>O
 "inoremap $q ''<esc>i
 "inoremap $e ""<esc>i
 "inoremap $t <><esc>i

" Enable syntax-highlighting.
if has("syntax")
  syntax on
endif
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

"Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>



"from andree" 
function InsQuickComment()
	if &filetype=="c" 
		call setline(line("."), "/*" . getline(line(".")) . "*/")
	elseif &filetype=="c++" || &filetype=="java" || &filetype=="cpp" || &filetype=="cc"
		call setline(line("."), "//" . getline(line(".")))
        elseif &filetype=="bib"
                call setline(line("."), "@Comment - " . getline(line(".")))
        elseif &filetype=="tex"
                call setline(line("."), "%" . getline(line(".")))
	elseif &filetype=="sml"
		call setline(line("."), "(* " . getline(line(".")) . " *)")
	elseif &filetype=="html" || &filetype=="xml" || &filetype=="dtd"
		call setline(line("."), "<!--" . getline(line(".")) . "-->")
	else
		call setline(line("."), "#" . getline(line(".")))
	endif
endfunction
		
function RemQuickComment()
	if &filetype=="c"
		call setline(line("."),substitute(substitute(getline(line(".")), "^/[*]", "", ""), "[*]/$", "", ""))
	elseif &filetype=="c++" || &filetype=="java" || &filetype=="cpp"
		call setline(line("."),substitute(getline(line(".")), "^//", "", ""))
        elseif &filetype=="bib"
                call setline(line("."),substitute(getline(line(".")), "^@Comment - ", "", ""))
        elseif &filetype=="tex"
                call setline(line("."),substitute(getline(line(".")), "^%", "", ""))
	elseif &filetype=="sml" 
		call setline(line("."),substitute(substitute(getline(line(".")),"^([*]", "", ""), "[*])$", "",""))
	elseif &filetype=="html" || &filetype=="xml" || &filetype=="dtd"
		call setline(line("."),substitute(substitute(getline(line(".")),"^<!--", "", ""), "-->$", "",""))
	else
		call setline(line("."),substitute(getline(line(".")), "^#", "", ""))
	endif
endfunction

map <F6> :call InsQuickComment()<CR><CR>
map <F7> :call RemQuickComment()<CR><CR>

runtime autoload/pathogen.vim
execute pathogen#infect('$HOME/vimstuff/bundle/{}')

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
