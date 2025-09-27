syn keyword tsImportExport import export from
hi  link    tsImportExport Keyword

hi  link  typescriptVariable Keyword

" Clear the incorrect highlighting in import lines
syntax clear typescriptAliasKeyword

" Highlight 'type' inside imports properly
syntax keyword typescriptTypeImport type

" Match `type Something` (e.g., `type FlexProps`)
syntax match typescriptTypeOnlyImport /\<type\s/ contained

" Highlight the import block { type FlexProps }
syntax region typescriptImportBlock start=+{+ end=+}+ contains=typescriptTypeOnlyImport,typescriptComment,typescriptLineComment

" Highlight the whole import line
"syntax region typescriptImportLine start=+^import+ end=+;$\|from\s\+['"].\{-}['"]+ contains=typescriptImportBlock

" Link to appropriate highlight groups
highlight def link typescriptTypeImport Type
highlight def link typescriptTypeOnlyImport Type
"highlight def link typescriptImportBlock Identifier
"highlight def link typescriptImportLine Statement