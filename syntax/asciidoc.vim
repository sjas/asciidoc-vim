" Vim syntax file
" Language: Asciidoc text document
" Maintainer: sjas
"             BASE LAYOUT BY:
"             Dag Wieers <dag@wieers.com> (merged wih Stuart Rackham's
"             upstream asciidoc.vim script).
"             COLORS STOLEN FROM:
"             Steve Losh, who made the unbelievably great badwolf color scheme
" URL: http://www.methods.co.nz/asciidoc/
" License: GPL (http://www.gnu.org)
" Remarks: Vim 6 or greater
" Limitations: See 'Appendix E: Vim Syntax Highlighter' in the AsciiDoc 'User
"               Guide'.
" Last Change: $Date: 2012/08/12 20:01:52 $
" $Revision$

if exists("b:current_syntax")
  finish
endif

syn clear
"syn sync fromstart
syn sync linebreaks=1

" Run :help syn-priority to review syntax matching priority.
syn keyword asciidocToDo TODO FIXME CHECK TEST XXX ZZZ DEPRECATED contained
syn match asciidocBackslash /\\/
syn region asciidocIdMarker start=/^\$Id:\s/ end=/\s\$$/
syn match asciidocCallout /\\\@<!<\d\{1,2}>/
syn match asciidocListBlockDelimiter /^--$/
syn match asciidocLineBreak /[ \t]+$/
syn match asciidocRuler /^'\{3,}$/
syn match asciidocPagebreak /^<\{3,}$/
syn match asciidocEntityRef /\\\@<!&[#a-zA-Z]\S\{-};/
" FIXME: The tricky part is not triggering on indented list items that are also
" preceeded by blank line, handles only bulleted items (see 'Limitations' above
" for workarounds).
"syn region asciidocLiteralParagraph start="^\n[ \t]\+\(\([^-*. \t] \)\|\(\S\S\)\)" end="\(^+\?\s*$\)\@="
syn region asciidocLiteralParagraph start=/^\s\+\S\+/ end=/\(^+\?\s*$\)\@=/
syn match asciidocURL /\\\@<!\<\(http\|https\|ftp\|file\|irc\):\/\/[^| \t]*\(\w\|\/\)/
syn match asciidocEmail /[\\.:]\@<!\(\<\|<\)\w\(\w\|[.-]\)*@\(\w\|[.-]\)*\w>\?[0-9A-Za-z_]\@!/
syn match asciidocAttributeRef /\\\@<!{\w\(\w\|-\)*\([=!@#$%?:].*\)\?}/


" As a damage control measure quoted patterns always terminate at a blank
" line (see 'Limitations' above).
syn match asciidocQuotedSubscript /\\\@<!\~\S\_.\{-}\(\~\|\n\s*\n\)/
syn match asciidocQuotedSuperscript /\\\@<!\^\S\_.\{-}\(\^\|\n\s*\n\)/

syn match asciidocQuotedMonospaced /\(^\|[| \t([.,=\-\]]\)\@<=+\([ )\n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(+\([| \t)[\],.?!;:=\-]\|$\)\@=\)/
syn match asciidocQuotedMonospaced /\(^\|[| \t([.,=\-\]]\)\@<=`\([ )\n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(`\([| \t)[\],.?!;:=\-]\|$\)\@=\)/
syn match asciidocQuotedUnconstrainedMonospaced /[\\+]\@<!++\S\_.\{-}\(++\|\n\s*\n\)/

syn match asciidocQuotedEmphasized /\(^\|[| \t([.,=\-\]]\)\@<=_\([ )\n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(_\([| \t)[\],.?!;:=\-]\|$\)\@=\)/
syn match asciidocQuotedEmphasized /\(^\|[| \t([.,=\-\]]\)\@<='\([ )\n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\('\([| \t)[\],.?!;:=\-]\|$\)\@=\)/
syn match asciidocQuotedUnconstrainedEmphasized /\\\@<!__\S\_.\{-}\(__\|\n\s*\n\)/

syn match asciidocQuotedBold /\(^\|[| \t([.,=\-\]]\)\@<=\*\([ )\n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(\*\([| \t)[\],.?!;:=\-]\|$\)\@=\)/
syn match asciidocQuotedUnconstrainedBold /\\\@<!\*\*\S\_.\{-}\(\*\*\|\n\s*\n\)/

" Don't allow ` in single quoted (a kludge to stop confusion with `monospaced`).
syn match asciidocQuotedSingleQuoted /\(^\|[| \t([.,=\-]\)\@<=`\([ )\n\t]\)\@!\([^`]\|\n\(\s*\n\)\@!\)\{-}[^` \t]\('\([| \t)[\],.?!;:=\-]\|$\)\@=\)/

syn match asciidocQuotedDoubleQuoted /\(^\|[| \t([.,=\-]\)\@<=``\([ )\n\t]\)\@!\(.\|\n\(\s*\n\)\@!\)\{-}\S\(''\([| \t)[\],.?!;:=\-]\|$\)\@=\)/

syn match asciidocDoubleDollarPassthrough /\\\@<!\(^\|[^0-9a-zA-Z$]\)\@<=\$\$..\{-}\(\$\$\([^0-9a-zA-Z$]\|$\)\@=\|^$\)/
syn match asciidocTriplePlusPassthrough /\\\@<!\(^\|[^0-9a-zA-Z$]\)\@<=+++..\{-}\(+++\([^0-9a-zA-Z$]\|$\)\@=\|^$\)/

syn region asciidocTable_OLD start=/^\([`.']\d*[-~_]*\)\+[-~_]\+\d*$/ end=/^$/
syn match asciidocBlockTitle /^\.[^. \t].*[^-~_]$/ contains=asciidocQuoted.*,asciidocAttributeRef
syn match asciidocTitleUnderline /[-=~^+]\{2,}$/ transparent contained contains=NONE
syn match asciidocOneLineTitle /^=\{1,5}\s\+\S.*$/ contains=asciidocQuoted.*,asciidocMacroAttributes,asciidocAttributeRef,asciidocEntityRef,asciidocEmail,asciidocURL,asciidocBackslash
syn match asciidocTwoLineTitle /^[^. +/].*[^.]\n[-=~^+]\{2,}$/ contains=asciidocQuoted.*,asciidocMacroAttributes,asciidocAttributeRef,asciidocEntityRef,asciidocEmail,asciidocURL,asciidocBackslash,asciidocTitleUnderline

syn match asciidocAttributeList /^\[[^[ \t].*\]$/
syn match asciidocQuoteBlockDelimiter /^_\{4,}$/
syn match asciidocExampleBlockDelimiter /^=\{4,}$/
syn match asciidocSidebarDelimiter /^*\{4,}$/

syn match asciidocAdmonitionNote /^\(NOTE\|TIP\):\(\s\+.*\)\@=/
syn match asciidocAdmonitionNote /^\[\(NOTE\|TIP\)\]\s*$/
syn match asciidocAdmonitionWarn /^\(CAUTION\|IMPORTANT\|WARNING\):\(\s\+.*\)\@=/
syn match asciidocAdmonitionWarn /^\[\(CAUTION\|IMPORTANT\|WARNING\)\]\s*$/

" See http://vimdoc.sourceforge.net/htmldoc/usr_44.html for excluding region
" contents from highlighting.
syn match asciidocTablePrefix /\(\S\@<!\(\([0-9.]\+\)\([*+]\)\)\?\([<\^>.]\{,3}\)\?\([a-z]\)\?\)\?|/ containedin=asciidocTableBlock contained
syn region asciidocTableBlock matchgroup=asciidocTableDelimiter start=/^|=\{3,}$/ end=/^|=\{3,}$/ keepend contains=ALL
syn match asciidocTablePrefix /\(\S\@<!\(\([0-9.]\+\)\([*+]\)\)\?\([<\^>.]\{,3}\)\?\([a-z]\)\?\)\?!/ containedin=asciidocTableBlock contained
syn region asciidocTableBlock2 matchgroup=asciidocTableDelimiter2 start=/^!=\{3,}$/ end=/^!=\{3,}$/ keepend contains=ALL

syn match asciidocListContinuation /^+$/
syn region asciidocLiteralBlock start=/^\.\{4,}$/ end=/^\.\{4,}$/ contains=asciidocCallout keepend
syn region asciidocListingBlock start=/^-\{4,}$/ end=/^-\{4,}$/ contains=asciidocCallout keepend
syn region asciidocCommentBlock start="^/\{4,}$" end="^/\{4,}$" contains=asciidocToDo
syn region asciidocPassthroughBlock start="^+\{4,}$" end="^+\{4,}$"

" Allowing leading \w characters in the filter delimiter is to accomodate
" the pre version 8.2.7 syntax and may be removed in future releases.
syn region asciidocFilterBlock start=/^\w*\~\{4,}$/ end=/^\w*\~\{4,}$/

syn region asciidocMacroAttributes matchgroup=asciidocRefMacro start=/\\\@<!<<"\{-}\w\(\w\|-\)*"\?,\?/ end=/\(>>\)\|^$/ contains=asciidocQuoted.* keepend
syn region asciidocMacroAttributes matchgroup=asciidocAnchorMacro start=/\\\@<!\[\{2}\(\w\|-\)\+,\?/ end=/\]\{2}/ keepend
syn region asciidocMacroAttributes matchgroup=asciidocAnchorMacro start=/\\\@<!\[\{3}\(\w\|-\)\+/ end=/\]\{3}/ keepend
syn region asciidocMacroAttributes matchgroup=asciidocMacro start=/[\\0-9a-zA-Z]\@<!\w\(\w\|-\)*:\S\{-}\[/ skip=/\\\]/ end=/\]\|^$/ contains=asciidocQuoted.* keepend
syn region asciidocMacroAttributes matchgroup=asciidocIndexTerm start=/\\\@<!(\{2,3}/ end=/)\{2,3}/ contains=asciidocQuoted.* keepend
syn region asciidocMacroAttributes matchgroup=asciidocAttributeMacro start=/\({\(\w\|-\)\+}\)\@<=\[/ skip=/\\\]/ end=/\]/ keepend

syn match asciidocCommentLine "^//\([^/].*\|\)$" contains=asciidocToDo

syn region asciidocAttributeEntry start=/^:\a/ end=/:\(\s\|$\)/ oneline

" Lists.
syn match asciidocListBullet /^\s*\zs\(-\|\*\{1,5}\)\ze\s/
syn match asciidocListNumber /^\s*\zs\(\(\d\+\.\)\|\.\{1,5}\|\(\a\.\)\|\([ivxIVX]\+)\)\)\ze\s\+/
syn region asciidocListLabel start=/^\s*/ end=/\(:\{2,4}\|;;\)$/ oneline contains=asciidocQuoted.*,asciidocMacroAttributes,asciidocAttributeRef,asciidocEntityRef,asciidocEmail,asciidocURL,asciidocBackslash keepend
" DEPRECATED: Horizontal label.
syn region asciidocHLabel start=/^\s*/ end=/\(::\|;;\)\(\s\+\|\\$\)/ oneline contains=asciidocQuoted.*,asciidocMacroAttributes keepend
" Starts with any of the above.
syn region asciidocList start=/^\s*\(-\|\*\{1,5}\)\s/ start=/^\s*\(\(\d\+\.\)\|\.\{1,5}\|\(\a\.\)\|\([ivxIVX]\+)\)\)\s\+/ start=/.\+\(:\{2,4}\|;;\)$/ end=/\(^[=*]\{4,}$\)\@=/ end=/\(^+\?\s*$\)\@=/ contains=asciidocList.\+,asciidocQuoted.*,asciidocMacroAttributes,asciidocAttributeRef,asciidocEntityRef,asciidocEmail,asciidocURL,asciidocBackslash,asciidocCommentLine,asciidocAttributeList

"====================== OLD STUFF ============================

"Sections
syn region asciidocSect0 start=/^=\s\+\S/ end=/$/ oneline contains=asciidocQuoted.*,asciidocAttributeRef
syn region asciidocSect1 start=/^==\s\+\S/ end=/$/ oneline contains=asciidocQuoted.*,asciidocAttributeRef
syn region asciidocSect2 start=/^===\s\+\S/ end=/$/ oneline contains=asciidocQuoted.*,asciidocAttributeRef
syn region asciidocSect3 start=/^====\s\+\S/ end=/$/ oneline contains=asciidocQuoted.*,asciidocAttributeRef
syn region asciidocSect4 start=/^=====\s\+\S/ end=/$/ oneline contains=asciidocQuoted.*,asciidocAttributeRef

"FIXME: It is impossible to distinguish underlined titles from block delimiters
"       because we cannot calculate length in VIM syntax
syn match asciidocSect2Old /^[^. +/[].*[^.:]\n\~\~\+$/ contains=asciidocQuoted.*,asciidocAttributeRef
syn match asciidocSect3Old /^[^. +/[].*[^.:]\n^^\+$/ contains=asciidocQuoted.*,asciidocAttributeRef
syn match asciidocSect4Old /^[^. +/[].*[^.:]\n++\+$/ contains=asciidocQuoted.*,asciidocAttributeRef

"Others
syn match asciidocReplacements "[\s^]\(\(C\)\|\(TM\)\|\(R\)\|--\|\.\.\.\)[\s$]"
syn match asciidocRevisionInfo "\$\w\+\(:\s.\+\s\)\?\$"
syn match asciidocBiblio "^\s*+\s\+"
syn match asciidocSource "^\s\s*\$\s\+.\+$"
"syn match asciidocSpecialChar "{amp}\w+;"
syn region asciidocQuestion start="\S" end="??\s*$" oneline
syn region asciidocGlossary start="\S" end=":-\s*$" oneline
"syn match asciidocFootnote "footnote:\[.*\]"
"syn match asciidocLink "link:.*\[.*\]"
"syn match asciidocURI "\(callto\|file\|ftp\|gopher\|http\|https\|mailto\|news\|xref\):.*\[\]"
"syn match asciidocURITitle "\(callto\|file\|ftp\|gopher\|http\|https\|mailto\|news\|xref\):.*\[.*\]"
"syn match asciidocInclude "include::.*\[.*\]"
"syn match asciidocInclude "include1::.*\[.*\]"
"syn match asciidocInclude "image:.*\[.*\]"
"syn match asciidocInclude "image::.*\[.*\]"
"syn match asciidocInclude "footnote:\[.*\]"
"syn match asciidocInclude "indexterm:\[.*\]"
"syn match asciidocInclude "ifdef::.*\[\]"
"syn match asciidocInclude "ifndef::.*\[\]"
"syn match asciidocInclude "endif::.*\[\]"
"syn match asciidocInclude "eval::\[\]"
"syn match asciidocInclude "sys::\[\]"
"syn match asciidocInclude "sys2::\[\]"


" Palette {{{

let s:bwc = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
let s:bwc.plain = ['f8f6f2', 15]

" Pure and simple.
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]

" All of the Gravel colors are based on a brown from Clouds Midnight.
let s:bwc.brightgravel   = ['d9cec3', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = ['fade3e', 221]

" A beautiful tan from Tomorrow Night.
let s:bwc.dirtyblonde = ['f4cf86', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:bwc.taffy = ['ff2c4b', 196]

" Another chewy accent, but use sparingly!
let s:bwc.saltwatertaffy = ['8cffba', 121]

" The star of the show comes straight from Made of Code.
let s:bwc.tardis = ['0a9dff', 39]

" This one's from Mustang, not Florida!
let s:bwc.orange = ['ffa724', 214]

" A limier green from Getafe.
let s:bwc.lime = ['aeee00', 154]

" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = ['ff9eb8', 211]

" Another play on the brown from Clouds Midnight.  I love that color.
let s:bwc.toffee = ['b88853', 137]

" Also based on that Clouds Midnight brown.
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

execute histring
endfunction
" }}}
"Styles
call s:HL('asciidocAdmonitionNote'                , 'saltwatertaffy' , 'deepergravel' , 'bold')
call s:HL('asciidocAdmonitionWarn'                , 'lime'           , 'taffy'        , 'bold')
call s:HL('asciidocBackslash'                     , 'darkroast')
call s:HL('asciidocBiblio'                        , 'tardis'         , ''             , 'bold')
call s:HL('asciidocFootnote'                      , 'lime'           , ''             , 'underline')
call s:HL('asciidocGlossary'                      , 'saltwatertaffy' , ''             , 'underline')
call s:HL('asciidocHLabel'                        , 'saltwatertaffy' , ''             , 'bold')
call s:HL('asciidocInclude'                       , 'darkroast'      , ''             , 'underline')
call s:HL('asciidocQuestion'                      , 'saltwatertaffy' , ''             , 'underline')

call s:HL('asciidocQuotedBold'                    , 'lime'           , ''             , 'bold')
call s:HL('asciidocQuotedUnconstrainedBold'       , 'lime'           , ''             , 'bold')
call s:HL('asciidocQuotedSingleQuoted'            , 'dalespale'      , ''             , '')
call s:HL('asciidocQuotedDoubleQuoted'            , 'dalespale'      , ''             , '')
call s:HL('asciidocQuotedEmphasized'              , 'saltwatertaffy' , ''             , '')
call s:HL('asciidocQuotedUnconstrainedEmphasized' , 'saltwatertaffy' , ''             , '')
call s:HL('asciidocQuotedMonospaced'              , 'toffee'         , ''             , 'bold')
call s:HL('asciidocQuotedUnconstrainedMonospaced' , 'toffee'         , ''             , 'bold')
call s:HL('asciidocQuotedSubscript'               , 'dalespale'      , ''             , 'bold')
call s:HL('asciidocQuotedSuperscript'             , 'dalespale'      , ''             , 'bold')

call s:HL('asciidocReference'                     , 'darkroast'      , ''             , '')
call s:HL('asciidocReplacements'                  , 'tardis'         , ''             , 'bold')
call s:HL('asciidocRevisionInfo'                  , 'tardis'         , ''             , 'bold')
call s:HL('asciidocSource'                        , 'dirtyblonde'    , ''             , 'bold')
call s:HL('asciidocToDo'                          , 'taffy'          , 'lime'         , 'bold')

"Attributes
call s:HL('asciidocAttributeEntry'                , 'orange'         , ''             , 'bold')
call s:HL('asciidocAttributeList'                 , 'orange'         , ''             , 'bold')
call s:HL('asciidocAttributeRef'                  , 'orange'         , ''             , 'bold')
"link asciidocAttributeMacro Macro

"Lists
call s:HL('asciidocListBlockDelimiter'            , 'coffee'         , ''             , 'bold')
call s:HL('asciidocListBullet'                    , 'coffee'         , ''             , 'bold')
call s:HL('asciidocListContinuation'              , 'coffee'         , ''             , 'bold')
call s:HL('asciidocListNumber'                    , 'coffee'         , ''             , 'bold')
call s:HL('asciidocListLabel'                     , 'coffee'         , ''             , 'bold')

"Sections
call s:HL('asciidocOneLineTitle'                  , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocTwoLineTitle'                  , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect0'                         , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect1'                         , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect2'                         , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect3'                         , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect4'                         , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect0Old'                      , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect1Old'                      , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect2Old'                      , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect3Old'                      , 'snow'           , 'taffy'        , 'bold')
call s:HL('asciidocSect4Old'                      , 'snow'           , 'taffy'        , 'bold')

"Links
call s:HL('asciidocEmail'                         , 'taffy'          , ''             , 'underline')
call s:HL('asciidocLink'                          , 'taffy'          , ''             , 'underline')
call s:HL('asciidocURL'                           , 'taffy'          , ''             , 'underline')

"Blocks
call s:HL('asciidocBlockTitle'                    , 'lime'           , ''             , '')
call s:HL('asciidocLiteralParagraph'              , 'toffee'         , ''             , 'bold')
call s:HL('asciidocLiteralBlock'                  , 'toffee'         , ''             , 'bold')
call s:HL('asciidocFilterBlock'                   , 'toffee'         , ''             , 'bold')
call s:HL('asciidocListingBlock'                  , 'toffee'         , ''             , 'bold')
call s:HL('asciidocExampleBlockDelimiter'         , 'toffee'         , ''             , 'bold')
call s:HL('asciidocQuoteBlockDelimiter'           , 'toffee'         , ''             , 'bold')
call s:HL('asciidocSidebarDelimiter'              , 'toffee'         , ''             , 'bold')
call s:HL('asciidocDoubleDollarPassthrough'       , 'coal'           , 'coffee'       , 'bold')
call s:HL('asciidocTripplePlusPassthrough'        , 'coal'           , 'coffee'       , 'bold')

"Tables
"link asciidocTableBlock2 NONE
"link asciidocTableBlock NONE
call s:HL('asciidocTableDelimiter2'               , 'darkroast'      , ''             , 'bold')
call s:HL('asciidocTableDelimiter'                , 'darkroast'      , ''             , 'bold')
call s:HL('asciidocTable_OLD'                     , 'darkroast'      , ''             , 'bold')
call s:HL('asciidocTablePrefix2'                  , 'darkroast'      , ''             , 'bold')
call s:HL('asciidocTablePrefix'                   , 'darkroast'      , ''             , 'bold')

"Comments
call s:HL('asciidocCommentLine'                   , 'gravel'         , 'darkgravel'  , '')
call s:HL('asciidocCommentBlock'                  , 'deepgravel'     , 'darkgravel'  , 'bold')

"Macros
call s:HL('asciidocAnchorMacro'                   , 'taffy'          , ''             , 'bold')
"link asciidocIndexTerm Macro
call s:HL('asciidocMacro'                         , 'taffy'          , ''             , 'underline')
call s:HL('asciidocMacroAttributes'               , 'dirtyblonde'    , ''             , 'bold')
call s:HL('asciidocRefMacro'                      , 'taffy'          , ''             , 'bold')

"Other
"link asciidocCallout Label
"link asciidocEntityRef Special
"link asciidocIdMarker Special
"link asciidocLineBreak Special
"link asciidocPagebreak Type
"link asciidocPassthroughBlock Identifier
"link asciidocRuler Type

let b:current_syntax = "asciidoc"

"Show tab and trailing characters
"all turned off, this is better handled globally
"set listchars=tab:»·,trail:·
"sjas changed to nolist
"set nolist

"
set textwidth=78 formatoptions=tcqn autoindent
set formatoptions=tcqn

if version >= 700
    "Prevent simple numbers at the start of lines to be confused with list items:
    set formatlistpat=^\\s*\\d\\+\\.\\s\\+
endif

set comments=s1:/*,ex:*/,://,b:#,:%,fb:-,fb:*,fb:.,fb:+,fb:>

"Typing "" inserts a pair of quotes (``'') and places the cursor between
"them. Works in both insert and command mode (switching to insert mode):
imap "" ``''<ESC>hi
map "" i""

nnoremap Q gq}

"eof
