if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

" Basic settings
set nocompatible                      " behave like vim, not old vi
set modelines=0                       " don't use modelines
set viminfo='20,\"50                  " use a viminfo file,...
set history=50                        " and limit history
set ruler                             " show the cursor position
set title                             " show title on the window
set autoread                          " reload file if changed outside vim
"set autowrite                         " save file on some commands
set scrolloff=1                       " minimal no. of lines around cursor
set t_Co=256                          " assume environment can use 256 colors
set laststatus=2                      " always show the status line
set display+=lastline                 " show as much as possible of last line
set completeopt-=preview              " disable preview for auto-completion
set noshowmode                        " don't indicate mode (shown elsewhere)
"set colorcolumn=81                    " display a margin line

" How Tab behaves
set tabstop=4                         " number of spaces used as tab for file
set softtabstop=4                     " number of spaces used as tab for editing
set shiftwidth=4                      " number of spaces used to autoindent
set expandtab                         " expand tabs into spaces
set smarttab                          " smart tabulation and backspace
set bs=indent,eol,start               " allow backspacing over everything

" How Search behaves
"set ignorecase                        " assume patterns are case insensitive,...
set smartcase                         " ...when lowercase-only is used
set incsearch                         " start searching as you type

" How non-printable things are shown
set list                              " show non-print characters,...
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅   " for tabs and trailing spaces
set number                            " show line number for current line,...
set relativenumber                    " and relative line numbers for others
set cursorline                        " highlight the line with the cursor
set wildmenu                          " use command-line completion menu,...
set wildmode=longest:full             " with wildmode
set autoindent                        " enable auto-indentation
set pastetoggle=<F2>                  " F2 toggles indenting when pasting

" How IO behave
set ttyfast                           " assume the terminal is fast
set mouse=a                           " enable mouse in all modes

" Settings that can can affect content
"set textwidth=80                      " set max number of characters per line

" Tweak how Gvim looks
"set guifont=Fira\ Code\ weight=450\ 12 " set font in gvim
set guioptions-=T                     " no toolbar in gvim
set guioptions-=m                     " no menubar in gvim
set guioptions-=r                     " no right scrollbar in gvim
set guioptions-=L                     " no left scrollbar when v.split in gvim

" Set the <leader> key
let mapleader = ","

" How syntax-based text completion and folding behave
setlocal ofu=syntaxcomplete#Complete  " enable syntax based word completion
setlocal foldmethod=syntax            " folding uses syntax for folding
setlocal nofoldenable                 " don't start with folded lines

" Manage plugins with vim-plug
call plug#begin('~/.vim/bundle')

" To: Augment Vim behavior
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'

" To: Augment UI elements
Plug 'vim-scripts/buftabs'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim',        {'on': 'Limelight'}
Plug 'scrooloose/nerdtree',           {'on': 'NERDTreeToggle'}
Plug 'mtth/scratch.vim',              {'on': 'Scratch'}
Plug 'majutsushi/tagbar',             {'on': 'TagbarToggle'}

" To: Add utility
Plug 'ctrlpvim/ctrlp.vim',            {'on': 'CtrlP'}
Plug 'tpope/vim-fugitive'
Plug 'yegappan/grep',                 {'on': ['Grep', 'Rg']}
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular',             {'on': 'Tabularize'}

" To: Augment filetype handling and syntax highlighting
Plug 'ekalinin/Dockerfile.vim',       {'for': 'Dockerfile'}
Plug 'fatih/vim-go',                  {'for': 'go'}
Plug 'vim-pandoc/vim-pandoc-syntax',  {'for': 'pandoc'}
                                      \ | Plug 'vim-pandoc/vim-pandoc'
Plug 'rodjek/vim-puppet',             {'for': 'puppet'}
Plug 'rust-lang/rust.vim',            {'for': 'rust'}
Plug 'cespare/vim-toml',              {'for': 'toml'}

" To: Add colorschemes (in addition to ones in .vim/colors)
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'nielsmadan/harlequin'
Plug 'w0ng/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'nanotech/jellybeans.vim'
Plug 'Wutzara/vim-materialtheme'
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jpo/vim-railscasts-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'

" End vim-plug definitions
call plug#end()

" Use of filetype to enable plugin and indentation
filetype plugin indent on

" No blinking cursor. See http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" When the terminal supports colors, turn on...
if &t_Co > 2 || has("gui_running")
  syntax on                           " syntax highlighting
  set hlsearch                        " highlighting last searched pattern
endif

" Autocommands and groups (if supported)
if has("autocmd")
  augroup general
    autocmd!
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
    " Switch to working directory of the open file
    autocmd BufEnter * lcd %:p:h
  augroup END

" Custom filetypes settings: HTML, JavaScript, Ruby, Go, JSON, Vagrant
  augroup code_langs
    autocmd!
    autocmd FileType html
            \ set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType javascript
            \ set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType ruby
            \ set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    autocmd FileType go
            \ set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
    autocmd BufRead,BufNewFile *.json setfiletype javascript
    autocmd BufRead,BufNewFile Vagrantfile setfiletype ruby
  augroup END
endif

" Function: View changes after the last save
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
  exe "normal! ]c"
endfunction
com! DiffSaved call s:DiffWithSaved()

" Function: Toggle Quickfix window
let g:quickfix_open = 0
function! QuickfixToggle()
  if g:quickfix_open
    cclose
    let g:quickfix_open = 0
    execute g:quickfix_return . "wincmd w"
  else
    let g:quickfix_return = winnr()
    copen
    let g:quickfix_open = 1
  endif
endfunction

" Function: Toggle full screen mode in gvim (when supported by wmctrl)
function! ToggleFullScreen()
  call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
  redraw
endfunction

" Uncomment following section to disable arrow keys (use hjkl instead).
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

" Map F1 key to Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map F4 key to toggle spell checking
noremap <F4> :setlocal spell! spelllang=en_us<CR>

" Map F5 key to change font in gvim
"noremap <F5> :set guifont=Fira\ Code\ weight=450\ 12<CR>

" Map F6 key to change font in gvim
"noremap <F6> :set guifont=Courier\ 10\ Pitch\ 12<CR>

" Map F7 to toggle focus-highlighting
noremap <F7> :Limelight!!<CR>

" Map F8 to toggle pattern scase-sensitivity (when uppercase are not used)
noremap <F8> :set ignorecase<CR>

" Map F10 for a promt to input where to show a margin. Then hit <CR> to show.
noremap <F10> :set colorcolumn=81

" Map key to function: Toggle full screen mode in gvim
" Requires wmctrl and a compatible WM. When ready, uncomment following line.
nnoremap <F11> :call ToggleFullScreen()<CR>

" Map F12 to toggle between dark/light background
noremap <F12> :let &background = ( &background == "dark"? "light" : "dark"  )<CR>

" Map Tab key to % (for working with matching pairs) in normal & visual modes.
nnoremap <tab> %
vnoremap <tab> %

" Make Y behave similar to C and D (from cursor to end of line)
nnoremap Y y$

" Map <leader>y, x and p as shortcuts for copy, cut and paste (respectively)
" to/from system (X) clipboard when supported (Eg: gvim).
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>x "+x
vnoremap <leader>x "+x
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Select the text that was just pasted
nnoremap <leader>v `[v`]

" List buffers
nnoremap <leader>bl :ls<CR>
" Jump to given buffer number (after entering number hitting 'Enter')
nnoremap <leader>bg :b 
" Go to previous buffer
nnoremap <leader>bv :bp<CR>
" Go to next buffer
nnoremap <leader>bn :bn<CR>
" Delete (close) the current buffer and jump to the previous buffer
nnoremap <leader>bd :bp <BAR> bd #<CR>

" Clear the search result highlighting
nnoremap <leader>/ :noh<CR>

" Map key to function: View changes after the last save
nnoremap <leader>? :DiffSaved<CR>

" Map key to function: Toggle Quickfix window.
" When in doubt, try the shortcut twice.
nnoremap <leader>q :call QuickfixToggle()<CR>

" Toggle displaying non-printable characters
nnoremap <leader>l :set list!<CR>

" Toggle soft-wrap (fit text into window)
nnoremap <leader>j= :set wrap! wrap?<CR>

" Remove all trailing whitespace characters in curent file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Hardwrap current paragraph at value set for 'textwidth'
" Visual mode equivalent: gq
nnoremap <leader>gq gwap

" Un-wrap current paragraph (Visual mode equivalent is: J)
nnoremap <leader>J vipJ

" Map w!! to write file with sudo, when forgot to open with sudo.
cmap w!! w !sudo tee % >/dev/null

" Plugin: Auto Pairs - key to toggle auto-complete
let g:AutoPairsShortcutToggle = '<F3>'

" Plugin: buftabs - configuration
let g:buftabs_only_basename=1
let g:buftabs_separator = ":"
let g:buftabs_marker_start = "[#"
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = " *"
"let g:buftabs_in_statusline=1
"let g:buftabs_active_highlight_group="Visual"

" Plugin: CtrlP - keys to invoke CtrlP search
nnoremap <c-p> :CtrlP<CR>

" Plugin: EasyMotion - enable smartcase
let g:EasyMotion_smartcase = 1

" Plugin: Go - keys to run vim-go integrated tools
if has("autocmd")
  augroup plugin_go
    autocmd!
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gd <Plug>(go-def-split)
    autocmd FileType go nmap <leader>gh <Plug>(go-doc)
    autocmd FileType go nmap <leader>gi <Plug>(go-info)
    autocmd FileType go nmap <leader>gr <Plug>(go-run)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
  augroup END
endif

" Plugin: Lightline - configuration
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" Plugin: NERDTree - use colors, cursorline and return/enter key
let NERDTreeHijackNetrw = 0
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" Plugin: NERDTree - keys to toggle NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>

" Plugin: Pandoc - no folding by default
let g:pandoc_no_folding = 1

" Plugin: Scratch - keys to open temporary Scratch buffer
nnoremap <leader>s :Scratch<CR>

" Plugin: Tagbar - give focus the Tagbar when it's opened
" Requires universal-ctags and ~/.ctags.d/*.ctags files for: Terraform, YAML
" Requires gotags for: Go
let g:tagbar_autofocus = 1
" Plugin: Tagbar - keys to toggle Tagbar
nnoremap <leader>t :TagbarToggle<CR>
" Additional details available at https://github.com/majutsushi/tagbar/wiki
"" Plugin: Tagbar - Support for Go (Depends on: gotags)
"let g:tagbar_type_go = {
	"\ 'ctagstype' : 'go',
	"\ 'kinds'     : [
		"\ 'p:package',
		"\ 'i:imports:1',
		"\ 'c:constants',
		"\ 'v:variables',
		"\ 't:types',
		"\ 'n:interfaces',
		"\ 'w:fields',
		"\ 'e:embedded',
		"\ 'm:methods',
		"\ 'r:constructor',
		"\ 'f:functions'
	"\ ],
	"\ 'sro' : '.',
	"\ 'kind2scope' : {
		"\ 't' : 'ctype',
		"\ 'n' : 'ntype'
	"\ },
	"\ 'scope2kind' : {
		"\ 'ctype' : 't',
		"\ 'ntype' : 'n'
	"\ },
	"\ 'ctagsbin'  : 'gotags',
	"\ 'ctagsargs' : '-sort -silent'
"\ }
" Plugin: Tagbar - Support for JSON
"let g:tagbar_type_json = {
    "\ 'ctagstype' : 'json',
    "\ 'kinds' : [
      "\ 'o:objects',
      "\ 'a:arrays',
      "\ 'n:numbers',
      "\ 's:strings',
      "\ 'b:booleans',
      "\ 'z:nulls'
    "\ ],
  "\ 'sro' : '.',
    "\ 'scope2kind': {
    "\ 'object': 'o',
      "\ 'array': 'a',
      "\ 'number': 'n',
      "\ 'string': 's',
      "\ 'boolean': 'b',
      "\ 'null': 'z'
    "\ },
    "\ 'kind2scope': {
    "\ 'o': 'object',
      "\ 'a': 'array',
      "\ 'n': 'number',
      "\ 's': 'string',
      "\ 'b': 'boolean',
      "\ 'z': 'null'
    "\ },
    "\ 'sort' : 0
    "\ }
"" Plugin: Tagbar - Support for Markdown
"let g:tagbar_type_markdown = {
  "\ 'ctagstype'	: 'markdown',
  "\ 'kinds'		: [
    "\ 'c:chapter:0:1',
    "\ 's:section:0:1',
    "\ 'S:subsection:0:1',
    "\ 't:subsubsection:0:1',
    "\ 'T:l4subsection:0:1',
    "\ 'u:l5subsection:0:1',
  "\ ],
  "\ 'sro'			: '""',
  "\ 'kind2scope'	: {
    "\ 'c' : 'chapter',
    "\ 's' : 'section',
    "\ 'S' : 'subsection',
    "\ 't' : 'subsubsection',
    "\ 'T' : 'l4subsection',
  "\ },
  "\ 'scope2kind'	: {
    "\ 'chapter' : 'c',
    "\ 'section' : 's',
    "\ 'subsection' : 'S',
    "\ 'subsubsection' : 't',
    "\ 'l4subsection' : 'T',
  "\ },
"\ }
"" Plugin: Tagbar - Support for Rust
"let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
"let g:tagbar_type_rust = {
  "\ 'ctagsbin' : '/path/to/your/universal/ctags',
  "\ 'ctagstype' : 'rust',
  "\ 'kinds' : [
      "\ 'n:modules',
      "\ 's:structures:1',
      "\ 'i:interfaces',
      "\ 'c:implementations',
      "\ 'f:functions:1',
      "\ 'g:enumerations:1',
      "\ 't:type aliases:1:0',
      "\ 'C:constants:1:0',
      "\ 'M:macros:1',
      "\ 'm:fields:1:0',
      "\ 'e:enum variants:1:0',
      "\ 'P:methods:1',
  "\ ],
  "\ 'sro': '::',
  "\ 'kind2scope' : {
      "\ 'n': 'module',
      "\ 's': 'struct',
      "\ 'i': 'interface',
      "\ 'c': 'implementation',
      "\ 'f': 'function',
      "\ 'g': 'enum',
      "\ 't': 'typedef',
      "\ 'v': 'variable',
      "\ 'M': 'macro',
      "\ 'm': 'field',
      "\ 'e': 'enumerator',
      "\ 'P': 'method',
  "\ },
"\ }
"" Plugin: Tagbar - Support for Terraform (Depends on: custom ctags config)
"let g:tagbar_type_tf = {
  "\ 'ctagstype': 'tf',
  "\ 'kinds': [
    "\ 'r:Resource',
    "\ 'R:Resource',
    "\ 'd:Data',
    "\ 'D:Data',
    "\ 'v:Variable',
    "\ 'V:Variable',
    "\ 'p:Provider',
    "\ 'P:Provider',
    "\ 'm:Module',
    "\ 'M:Module',
    "\ 'o:Output',
    "\ 'O:Output',
    "\ 'f:TFVar',
    "\ 'F:TFVar'
  "\ ]
"\ }
"" Plugin: Tagbar - Support for YAML (Depends on: custom ctags config)
"let g:tagbar_type_yaml = {
    "\ 'ctagstype' : 'yaml',
    "\ 'kinds' : [
        "\ 'a:anchors',
        "\ 's:section',
        "\ 'e:entry'
    "\ ],
  "\ 'sro' : '.',
    "\ 'scope2kind': {
      "\ 'section': 's',
      "\ 'entry': 'e'
    "\ },
    "\ 'kind2scope': {
      "\ 's': 'section',
      "\ 'e': 'entry'
    "\ },
    "\ 'sort' : 0
    "\ }

" Set colorschemes
set termguicolors
set background=dark
colorscheme one

" Set background to none for tranparency in terminal 
"hi Normal guibg=NONE ctermbg=NONE
