if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible                      " don't be strictly old vi-like
set modelines=0                       " don't use modelines
set viminfo='20,\"50                  " use a viminfo file,...
set history=50                        " and limit history
set ruler                             " show the cursor position
set title                             " show title
set incsearch                         " find while pattern being entered
set ignorecase                        " case insensitive patterns,...
set smartcase                         " when only lowercase is used
set wildmenu                          " use command-line completion menu,...
set wildmode=longest:full             " with wildmode
set bs=indent,eol,start               " allow backspacing over everything
set autoindent                        " enable auto-indentation
set tabstop=2                         " no. of spaces for tab in file
set shiftwidth=2                      " no. of spaces for step in autoindent
set softtabstop=2                     " no. of spaces for tab when editing
set expandtab                         " expand tabs into spaces
set smarttab                          " smart tabulation and backspace
set mouse=a                           " enable mouse in all modes
set list                              " show non-print characters,...
set listchars=trail:⋅,nbsp:⋅,tab:▷⋅   " for tabs and trailing spaces
set number                            " show line number for current line,...
set relativenumber                    " and relative line numbers for others
set cursorline                        " highlight the line with the cursor
set pastetoggle=<F2>                  " F2 toggles indenting when pasting
set autoread                          " reload file if changed outside Vim
set autowrite                         " save file on some commands
set scrolloff=1                       " minimal no. of lines around cursor
set t_Co=256                          " assume environment can use 256 colors
set visualbell                        " flash screen instead of beeping
set laststatus=2                      " always show the status line
set display+=lastline                 " show as much as possible of last line
"set cm=blowfish                       " encryption method in :X, vim -x
"set textwidth=80                      " maximum number of characters per line
"set colorcolumn=81                    " display a margin line

"set guifont=Inconsolata\ Medium\ 10   " set font in gvim
set guioptions-=T                     " no toolbar in gvim
set guioptions-=m                     " no menubar in gvim
set guioptions-=r                     " no right scrollbar in gvim
set guioptions-=L                     " no left scrollbar when v.split in gvim

" Settings for Vundle
filetype off                          " disable filetype use. Enabled later
set rtp+=~/.vim/bundle/plugin-vundle  " Vundle runtime path
call vundle#begin()                   " start Vundle definitions

" Plugins to use
Plugin 'gmarik/Vundle.vim',                 {'name': 'plugin-vundle'}
Plugin 'mileszs/ack.vim',                   {'name': 'plugin-ack'}
Plugin 'jiangmiao/auto-pairs',              {'name': 'plugin-auto_pairs'}
Plugin 'jlanzarotta/bufexplorer',           {'name': 'plugin-bufexplorer'}
Plugin 'buftabs',                           {'name': 'plugin-buftabs'}
Plugin 'godlygeek/csapprox',                {'name': 'plugin-csapprox'}
Plugin 'kien/ctrlp.vim',                    {'name': 'plugin-ctrlp'}
Plugin 'honza/dockerfile.vim',              {'name': 'plugin-docker'}
Plugin 'Lokaltog/vim-easymotion',           {'name': 'plugin-easymotion'}
Plugin 'terryma/vim-expand-region',         {'name': 'plugin-expand_region'}
Plugin 'tpope/vim-fugitive',                {'name': 'plugin-fugitive'}
Plugin 'gregsexton/gitv',                   {'name': 'plugin-gitv'}
Plugin 'fatih/vim-go',                      {'name': 'plugin-go'}
Plugin 'guicolorscheme.vim',                {'name': 'plugin-guicolorscheme'}
Plugin 'matchit.zip',                       {'name': 'plugin-matchit'}
Plugin 'scrooloose/nerdcommenter',          {'name': 'plugin-nerdcommenter'}
Plugin 'scrooloose/nerdtree',               {'name': 'plugin-nerdtree'}
Plugin 'vim-pandoc/vim-pandoc',             {'name': 'plugin-pandoc'}
Plugin 'vim-pandoc/vim-pandoc-syntax',      {'name': 'plugin-pandoc_syntax'}
Plugin 'rodjek/vim-puppet',                 {'name': 'plugin-puppet'}
Plugin 'scratch.vim',                       {'name': 'plugin-scratch'}
Plugin 'tpope/vim-surround',                {'name': 'plugin-surround'}
Plugin 'godlygeek/tabular',                 {'name': 'plugin-tabular'}
Plugin 'majutsushi/tagbar',                 {'name': 'plugin-tagbar'}

" Colorschemes to use (in addition to ones in .vim/colors)
Plugin 'chriskempson/base16-vim',           {'name': 'color-base16'}
Plugin 'nanotech/jellybeans.vim',           {'name': 'color-jellybeans'}
Plugin 'tomasr/molokai',                    {'name': 'color-molokai'}
Plugin 'jpo/vim-railscasts-theme',          {'name': 'color-railscasts'}
Plugin 'altercation/vim-colors-solarized',  {'name': 'color-solarized'}

call vundle#end()                     " end Vundle definitions
filetype plugin indent on             " enable filetype use

setlocal ofu=syntaxcomplete#Complete  " enable syntax based word completion
setlocal foldmethod=syntax            " folding uses syntax for folding
setlocal nofoldenable                 " don't start with folded lines

" Set the leader key
let mapleader = ","

" Map F1 key to Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map F4 key to toggle spell checking
noremap <F4> :setlocal spell! spelllang=en_us<CR>

" Map F7/F8 to go to previous/next buffer
noremap <F7> :bprev<CR>
noremap <F8> :bnext<CR>
" Map F9 for a prompt to input the buffer number. Then hit <CR> (Enter) to jump.
noremap <F9> :b 
" Map F10 for a promt to input where to show a margin. Then hit <CR> to show.
noremap <F10> :set colorcolumn=81

" Map Tab key to % (for working with matching pairs) in normal & visual modes.
nnoremap <tab> %
vnoremap <tab> %

" Uncomment following section to stop using arrow keys (use hjkl instead).
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"vnoremap <up> <nop>
"vnoremap <down> <nop>
"vnoremap <left> <nop>
"vnoremap <right> <nop>

" Use F11 key as a shortut to toggle full screen mode in gvim.
" Requires wmctrl and a compatible WM. When ready, uncomment following section.
"function! ToggleFullScreen()
"  call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
"  redraw
"endfunction
"nnoremap <F11> :call ToggleFullScreen()<CR>

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

" Clear the search result highlighting
nnoremap <leader><space> :noh<CR>

" Toggle displaying non-printable characters
nnoremap <leader>l :set list!<CR>

" Strip all trailing whitespace characters in curent file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Hardwrap current paragraph by the value set for 'textwidth'
nnoremap <leader>Q gwip

" Map w!! to write file with sudo, when forgot to open with sudo.
cmap w!! w !sudo tee % >/dev/null

" When the terminal supports colors, turn on...
if &t_Co > 2 || has("gui_running")
  syntax enable                       " syntax highlighting
  set hlsearch                        " highlighting last searched pattern
endif

" No blinking cursor. See http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" View changes after the last save
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
nnoremap <leader>? :DiffSaved<CR>

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

" Custom filetypes settings: Go, Python, Shell, C, C++, Java, JSON, Vagrant
  augroup code_langs
    autocmd!
    autocmd FileType go set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
    autocmd FileType python,sh,c,cpp,h,java set tabstop=4 shiftwidth=4 softtabstop=4
    autocmd BufRead,BufNewFile *.json setfiletype javascript
    autocmd BufRead,BufNewFile Vagrantfile setfiletype ruby
  augroup END
endif

" Plugin: Ack - uncomment suitable line if configuration is necessary
"let g:ackprg="ack -H --nocolor --nogroup"         " if ack --version < 1.92
"let g:ackprg="ack-grep -H --nocolor --nogroup"    " for Debian/Ubuntu

" Plugin: Auto Pairs - key to toggle auto-complete
let g:AutoPairsShortcutToggle = '<F3>'

" Plugin: buftabs - configuration
let g:buftabs_only_basename=1
let g:buftabs_separator = ":"
let g:buftabs_marker_start = "[#"
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = " *"

" Plugin: CSApprox - configuration to enable CSApprox explicitly
"let s:use_CSApprox = 1
" If the colorscheme does not look ok, try after uncommenting the above line
" If that makes it worse, revert back to commented state

" Plugin: Go - disable auto-downloading go binaries
let g:go_disable_autoinstall = 1
" Advanced features of vim-go depends on external binaries. To have
" them automatically downloaded, comment the above and restart vim.
" Plugin: Go - keys to run vim-go integrated tools
if has("autocmd")
  augroup plugin_go
    autocmd!
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gf <Plug>(go-def-split)
    autocmd FileType go nmap <leader>gd <Plug>(go-doc)
    autocmd FileType go nmap <leader>gi <Plug>(go-info)
    autocmd FileType go nmap <leader>gr <Plug>(go-run)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
  augroup END
endif

" Plugin: LaTeX - configuration (plugin not bundled here)
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Plugin: NERDTree - use colors, cursorline and return/enter key
let NERDTreeHijackNetrw = 0
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" Plugin: NERDTree - keys to toggle NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>

" Plugin: Pandoc - no folding by default
let g:pandoc_no_folding = 1

" Plugin: Scratch - define invoke function
function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction
" Plugin: Scratch - keys to toggle Scratch buffer
nnoremap <leader>s :call ToggleScratch()<CR>

" Plugin: Tagbar - give focus the Tagbar when it's opened
let g:tagbar_autofocus = 1
" Plugin: Tagbar - keys to toggle Tagbar
nnoremap <leader>t :TagbarToggle<CR>

" Set colorschemes
if version >= 700 && &term != 'cygwin' && !has('gui_running')
  if &t_Co == 256 || &t_Co == 88
    if !has('gui') && !exists("s:use_CSApprox")
      let g:CSApprox_loaded = 1
      let s:use_GUIColorScheme = 1
    endif
  else
    colorscheme default
  endif
endif

" When a colorscheme has only a GUI version, try to apply it in non-GUI Vim
if exists('s:use_GUIColorScheme')
  runtime! bundle/plugin-guicolorscheme/plugin/guicolorscheme.vim
  GuiColorScheme nucolors
else
  colorscheme nucolors
  noremap <F5> <Esc>:colorscheme nucolors<CR>
  noremap <F6> <Esc>:colorscheme solarized<CR>
endif
