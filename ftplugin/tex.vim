# File: ~/.vim/ftplugin/tex.vim
set sw=2
set expandtab
set iskeyword+=:
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
let g:Tex_Folding = 0
let g:Tex_PromptedCommands = 'footnote,cite,pageref,label,g,emph'

let g:Tex_IgnoredWarnings =
\"Underfull\n".
\"Overfull\n".
\"specifier changed to\n".
\"You have requested\n".
\"Missing number, treated as zero.\n".
\"Citation %.%# undefined\n".
\'LaTeX Font Warning:'"
" This number N says that latex-suite should ignore the first N of the above.
let g:Tex_IgnoreLevel = 3
