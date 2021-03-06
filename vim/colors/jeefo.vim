" Vim color file
" Converted from Textmate theme Sunburst using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "jeefo"
" good colors
" use 5, 6

hi Cursor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=#a7a7a7 gui=NONE | " ctermbg=248
hi Visual ctermfg=NONE ctermbg=236 cterm=NONE gui=NONE guibg=#2c3033 guifg=NONE
hi CursorLine ctermfg=NONE ctermbg=234 term=NONE cterm=NONE guifg=NONE guibg=#191919 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=234 term=NONE cterm=NONE guifg=NONE guibg=#191919 gui=NONE
hi CursorLineNr ctermfg=11 ctermbg=55 cterm=BOLD guifg=#ff0000 guibg=#191919 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#191919 gui=NONE
hi VertSplit ctermfg=238 ctermbg=238 cterm=NONE guifg=#484848 guibg=#484848 gui=NONE
hi MatchParen ctermfg=0 ctermbg=5 cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi StatusLine ctermfg=231 ctermbg=238 cterm=bold guifg=#f8f8f8 guibg=#484848 gui=bold
hi StatusLineNC ctermfg=231 ctermbg=238 cterm=NONE guifg=#f8f8f8 guibg=#484848 gui=NONE
hi Pmenu ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2c3033 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=17 cterm=NONE guifg=NONE guibg=#142d4b gui=NONE
hi Search ctermfg=NONE ctermbg=17 cterm=NONE guifg=NONE guibg=#142d4b gui=NONE
hi Directory ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE

" Line number
hi LineNr cterm=NONE ctermbg=234 ctermfg=7 gui=NONE guibg=#191919 guifg=#7c7c7c

" Fold line
hi Folded cterm=NONE ctermbg=NONE ctermfg=249 guifg=#aeaeae guibg=#000000 gui=NONE
hi FoldColumn cterm=NONE ctermbg=NONE ctermfg=249 gui=NONE guibg=#000000 guifg=#aeaeae

hi Normal cterm=NONE ctermbg=NONE ctermfg=255 gui=NONE guibg=#000000 guifg=#f8f8f8
hi Boolean ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi Character ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi Comment cterm=NONE ctermbg=NONE ctermfg=196 gui=italic guibg=NONE guifg=#ae0000
hi Conditional ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi Constant ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi Define ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=1 ctermbg=NONE cterm=BOLD guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=3 ctermbg=NONE cterm=BOLD guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi Identifier ctermfg=118 ctermbg=NONE cterm=NONE guifg=#99cf50 guibg=NONE gui=NONE
hi Keyword ctermfg=6 ctermbg=NONE cterm=NONE gui=NONE guibg=NONE guifg=#e28964
hi Label ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE

" Keywords colors
hi Function cterm=NONE ctermbg=NONE ctermfg=2

" Invisible characters
hi NonText cterm=NONE ctermbg=NONE ctermfg=240
hi SpecialKey cterm=NONE ctermbg=NONE ctermfg=240

hi Operator ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f8 guibg=NONE gui=NONE
hi Statement ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi StorageClass ctermfg=113 ctermbg=NONE cterm=NONE guifg=#99cf50 guibg=NONE gui=NONE

" Diff lines
hi DiffChange  ctermbg = 232
hi DiffAdd     ctermbg = 17
hi DiffText    ctermbg = 234
hi DiffDelete  ctermbg = 52

" Datatype colors
"hi String cterm=NONE ctermbg=NONE ctermfg=2 gui=NONE guibg=NONE guifg=#65b042
hi String cterm=NONE ctermbg=NONE ctermfg=208 gui=NONE guibg=NONE guifg=#65b042
hi Number ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE

" JavaScript
hi javaScriptDot cterm=NONE ctermbg=NONE ctermfg=4 gui=NONE guibg=NONE guifg=#65b042
hi javaScriptComma cterm=NONE ctermbg=NONE ctermfg=1 gui=NONE guibg=NONE guifg=#65b042
hi javaScriptBraces cterm=NONE ctermbg=NONE ctermfg=207 gui=NONE guibg=NONE guifg=#65b042
hi javaScriptParens cterm=NONE ctermbg=NONE ctermfg=222 gui=NONE guibg=NONE guifg=#65b042
hi javaScriptGLOBALS cterm=NONE ctermbg=NONE ctermfg=197 gui=NONE guibg=NONE guifg=#65b042
hi javaScriptNumber cterm=NONE ctermbg=NONE ctermfg=6
"hi javaScriptFunction cterm=NONE ctermbg=NONE ctermfg=34
"hi javaScriptString cterm=NONE ctermbg=NONE ctermfg=198 gui=NONE guibg=NONE guifg=#65b042
"hi javaScriptIdentifier cterm=NONE ctermbg=NONE ctermfg=11
"hi javaScriptRailsFunction ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE

" SQL
hi sqlKeyword cterm=NONE ctermbg=NONE ctermfg=5 gui=NONE guibg=NONE guifg=#65b042

hi Tag ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f8 guibg=NONE gui=bold
hi Todo ctermfg=249 ctermbg=NONE cterm=inverse,bold guifg=#aeaeae guibg=NONE gui=inverse,bold,italic
hi Type ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi rubyFunction ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi rubyConstant ctermfg=103 ctermbg=NONE cterm=NONE guifg=#9b859d guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi rubyInclude ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=179 ctermbg=NONE cterm=NONE guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi rubyControl ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi rubyOperator ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi rubyException ctermfg=173 ctermbg=NONE cterm=NONE guifg=#e28964 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=103 ctermbg=NONE cterm=NONE guifg=#9b859d guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=249 ctermbg=NONE cterm=NONE guifg=#aeaeae guibg=NONE gui=italic
hi erubyRailsMethod ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi htmlTag ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlEndTag ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlTagName ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlArg ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE


hi yamlKey ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi yamlAnchor ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi yamlAlias ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b042 guibg=NONE gui=NONE
hi cssURL ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3e87e3 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=186 ctermbg=NONE cterm=NONE guifg=#dad085 guibg=NONE gui=NONE
hi cssColor ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi cssClassName ctermfg=111 ctermbg=NONE cterm=NONE guifg=#89bdff guibg=NONE gui=NONE
hi cssValueLength ctermfg=68 ctermbg=NONE cterm=NONE guifg=#3387cc guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=167 ctermbg=NONE cterm=NONE guifg=#cf6a4c guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
