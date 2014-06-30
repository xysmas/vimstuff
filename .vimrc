set nu
set incsearch
set tabstop=3
set shiftwidth=3
set hlsearch
set showmatch
set autoindent
set smartindent
set mouse=a
set nocompatible
" Map auto complete of (, ", ', [
 inoremap $1 ()<esc>i
 inoremap $2 []<esc>i
 inoremap $3 {}<esc>i
 inoremap $4 {<esc>o}<esc>O
 inoremap $q ''<esc>i
 inoremap $e ""<esc>i
 inoremap $t <><esc>i

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

execute pathogen#infect()

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
