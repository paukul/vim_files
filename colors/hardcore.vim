" Vim color scheme

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "railscasts"

" Colors
" Foreground   #a0a0a0
" Background   #161616
" Highlight bg #505354
" Light Blue   #66d9ef
" Dark Green   #a1d052
" Red          #ff3c83
" Light Green  #afe459
" Dark Orange  #ffa542
" Purple       #b28bf8
" Grey         #708488
" Light Grey   #d6d5d1
" Pink         #ff669d
"
" Brown        #f2882d
" Dark Blue    #6D9CBE
" Tan          #FFC66D

hi Normal                    guifg=#f6f3e8 guibg=#161616
hi Cursor                    guibg=#d6d5d1
hi CursorLine                guibg=#505354
hi LineNr                    guifg=#888888 guibg=#161616
hi Search                    guibg=#dfdb74
hi Visual                    guibg=#363983

" Folds
" -----
" line used for closed folds
hi Folded                    guifg=#F6F3E8 guibg=#444444 gui=NONE

" Misc
" ----
" directory names and other special names in listings
hi Directory                 guifg=#6D9CBE gui=NONE

" Popup Menu
" ----------
" normal item in popup
hi Pmenu                     guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel                  guifg=#000000 guibg=#A5C261 gui=NONE
" scrollbar in popup
hi PMenuSbar                 guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb                guibg=#AAAAAA gui=NONE


"rubyComment
hi Comment                   guifg=#505354 gui=italic
hi Todo                      guifg=#ff669d guibg=NONE gui=italic

"rubyPseudoVariable
"nil, self, symbols, etc
hi Constant                  guifg=#6D9CBE


"rubyClass, rubyModule, rubyDefine
"def, end, include, etc
hi Define                    guifg=#ffa542

"rubyInterpolation
hi Delimiter                 guifg=#519F50

"rubyError, rubyInvalidVariable
hi Error                     guifg=#FFFFFF guibg=#990000

"rubyFunction
hi Function                  guifg=#FFC66D gui=NONE

"rubyIdentifier
"@var, @@var, $var, etc
hi Identifier                guifg=#66d9ef gui=NONE

"rubyInclude
"include, autoload, extend, load, require
hi Include                   guifg=#ffa542 gui=NONE

"rubyKeyword, rubyKeywordAsMethod
"alias, undef, super, yield, callcc, caller, lambda, proc
hi Keyword                   guifg=#CC7833

" same as define
hi Macro                     guifg=#CC7833 gui=NONE

"rubyInteger
hi Number                    guifg=#A5C261

" #if, #else, #endif
hi PreCondit                 guifg=#CC7833 gui=NONE

" generic preprocessor
hi PreProc                   guifg=#CC7833 gui=NONE

"rubyControl, rubyAccess, rubyEval
"case, begin, do, for, if unless, while, until else, etc.
hi Statement                 guifg=#CC7833 gui=NONE

"rubyString
hi String                    guifg=#afe459

hi Title                     guifg=#FFFFFF

"rubyConstant
hi Type                      guifg=#ff3c83 gui=NONE

hi DiffAdd                   guifg=#E6E1DC guibg=#144212
hi DiffDelete                guifg=#E6E1DC guibg=#660000

hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag

hi xmlTag                    guifg=#E8BF6A
hi xmlTagName                guifg=#E8BF6A
hi xmlEndTag                 guifg=#E8BF6A
