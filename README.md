# Vimfiles

This is my current [vimfiles](https://gaveen.me/2020/02/my-vim-story/). Plugins are managed with [`vim-plug`](https://github.com/junegunn/vim-plug). These should work with vim/gvim and neovim.

This is not intended as a distribution, as I may change it depending on the work I'm doing. Plus, I pretty much only use this under Linux. But, you are more than welcome to use my vim files to explore. I have tried to keep my `.vimrc` file well commended for your convenience.

&nbsp;  

## How to use
If you still want to use these vimfiles, this is how you can do so.

First, you'll need to clone this repository.&nbsp;  
`$ git clone https://github.com/gaveen/vimfiles.git`

Then, you could create symbolic links to the `.vim` directory and `.vimrc` file. Assuming the location where you cloned the repository is `~/Apps/vimfiles`, you can do something like:&nbsp;  
`$ ln -s ~/Apps/vimfiles/.vim ~/.vim`&nbsp;  
`$ ln -s ~/Apps/vimfiles/.vimrc ~/.vimrc`

Finally, launch vim and install the plugins. (_Note:_ `:PlugUpgrade` will update vim-plug itself)&nbsp;  
`:PlugUpdate` will install/update plugins

### Dependencies
- `git`: used by `vim-plug` to keep plugins up-to-date
- A relatively newer version of vim/gvim/neovim
- An internet connection (to install/update plugins)

### Optional dependencies
- **universal ctags**, used by `tagbar`. (_Package names:_ Fedora family: `ctags`, Debian family: `universal-ctags`)
- **gotags**, used by `tagbar` support for Go. (_Package:_ https://github.com/jstemmer/gotags)
- **wmctrl**, used to toggle full-screen in gvim. (_Package names:_: Fedora family: `wmctrl`, Debian family: `wmctrl`)

&nbsp;  

## Usage tips & tricks

Before we begin tricks, there are few key concepts you need to know if you are new to vim.

To summarize:
- Vim has multiple modes (e.g., `Normal Mode`, `Insert Mode`, `Visual Mode`)
- Vim `buffers` are different editing spaces, whereas vim `tab pages` are not
- You can define your own shortcuts
- Vim is extensible with plugins
- Editing with Vim is like programming your text

You can read the full details at: https://gaveen.me/2020/02/my-vim-story/

&nbsp;  

With those out of the way, here are some of the tricks you can do with this particular setup of vimfiles. Some of the following are enabled through plugins.

_Please note:_ **`<leader>` = `,`** in this vimfiles setup

Function Key | Action
------------ | ------
`F1` | Remapped as `Esc` key to avoid accidental F1 presses
`F2` | Toggle auto-indenting when pasting
`F3` | Toggle auto-completing matching pairs
`F4` | Toggle spell checking (default lang: en_US)
`F7` | Toggle focus-highlighting
`F8` | Toggle case-sensitivity in patterns
`F10` | Trigger showing a margin (with user input)
`F11` | Toggle fullscreen in gvim (if supported)
`F12` | Toggle light/dark background (if supported)

&nbsp;  

Buffer Shortcut | Action
--------------- | ------
`<leader>bl` | List open buffers
`<leader>bg` | Trigger jump to buffer (with user input)
`<leader>bv` | Go to previous buffer
`<leader>bn` | Go to next buffer
`<leader>bd` | Close buffer and jump to previous one

&nbsp;  

Clipboard Shortcut* | Action
------------------- | ------
`<leader>y` | Copy to clipboard
`<leader>x` | Cut to clipboard
`<leader>p` | Paste from clipboard
`*` | _Only on supported systems_

&nbsp;  

Motion Shortcut | Action
--------------- | ------
`<leader><leader>w` | Trigger jump to word motion
`<ctrl>p` | Fuzzy find pattern in files, buffers, etc.
`<tab>` | Jump to matching other of a pair (same as %)

&nbsp;  

Visual Cue Shortcut | Action
------------------- | ------
`<leader>/` | Clear the highlighting of last searched pattern
`<leader>l` | Toggle displaying non-printable characters
`<leader>v` | Select the text that was pasted immediately before
`<leader>?` | Compare the changes since the last save
`za` | Toggle code folding based on syntax

&nbsp;  

UI Element Shortcut | Action
------------------- | ------
`<leader>d` | Toggle directory tree pane
`<leader>t` | Toggle tagbar pane
`<leader>s` | Toggle temporary jotting area (content not saved)
`<leader>q` | Toggle displaying the quickfix window

&nbsp;  

Text Manipulation Shortcut | Action
-------------------------- | ------
`<leader>c<space>` | Toggle commenting the selected text
`<leader>j=` | Toggle soft-wrapping text (fit to screen)
`<leader>gq` | Hard-wrap lines in the current paragraph
`<leader>J` | Un-wrap the current paragraph (join lines)
`<leader>W` | Remove trailing whitespaces in current file
`z=` | Spelling suggestion for the word under cursor
`:w!!` | Save a file with 'sudo' privileges

&nbsp;  

Insert Mode Shortcut* | Action
--------------------- | ------
`<ctrl>n` | Auto-complete words repeating words
`<ctrl>x<ctrl>o` | Auto-complete code keywords
`*` | _Entered while in Insert Mode_

&nbsp;  

Here are some other useful things enabled for you.
- Automatic completion of matching pairs (e.g., `()`, `[]`, `{}`, `''`, `""`, etc.)
- Auto-editing of matching pairs (For examples, see: [tpope/vim-surround](https://github.com/tpope/vim-surround))
- Use _ and + keys to increase and decrease the range of text selection blocks
- Better text aligning support (For examples, see: [Vimcasts - Aligning text with Tabular.vim](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/))
- Show non printable characters such as: tab, trailing spaces
- List and indicate open/active buffers in the bottom status bar

&nbsp;  

## Finding more help
Since Vim is an advanced editor and plugins add even more features, it doesn't make sense for me to include all the support in the scope of this document.

Vim comes with extensive help documentation. To find out more about a given topic, you can access the vim help by typing :h {topic}. For example, to find about Vim's text folding features, type `:h folding`.

At least some of the plugins also come with documentation. Therefore, please try to refer the relevant documetation the same way. For example, to find more about motion shortcuts enabled by EasyMotion plugin, type `:h easymotion`.

Finally, additional live help can be requested from the #vim IRC channel on freenode.net. It is a helpful community and they can help you to answer specfic questions you may have.
