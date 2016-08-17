set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
if has('win32')
   Plugin 'findstr.vim'
elseif has('unix')
   Plugin 'grep.vim'
endif

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
syntax on			" Turn on syntax highlightin
filetype on   " Turn on file type after plugins install

colorscheme molokai  		" Set Colour
set backspace=2 		" Make backspace the same as most other apps
set wildignore+=*.bak,*.pj,*\\node_modules\\*   " Ignore these files and directories from searches. (Specific to windows)
set ic				" Ignores the case when searching
set number			" Shows line numbers
set hlsearch      " Highlights all words when searching
set incsearch     " Move to the search word as you're typing it
set noswapfile       " Keep all files in memory
set guifont=Consolas:h11  " Setting font for Andrew
set wrap        " Lines are wrapped
set clipboard=unnamed " Auto use clip board when copying and pasting

" Indenting and tabbing
set expandtab			" Expands tabs to spaces
set tabstop=2			" Width of tab set to 2
set shiftwidth=2		" Indents will have a width of 2
set softtabstop=2		" Sets the number of columns for a tab
set autoindent      " Automatically indent
set smartindent     " Indent 'Smartly'
set smarttab        " Insert tabs in front of a line according to shiftwidth

" Sets the path variable which is used in the :find command
set path=.\**

"Auto Commands
"Highlights the word the cursor is currently on and all others that match
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"Ctrl P Settings
let g:ctrlp_custom_ignore = '\v[\/]\.(bak|pj)$'		
let g:ctrlp_working_path_mode = 0		" Makes search occur in PWD
let g:ctrlp_max_files = 20000       " Sets max files to search\
nmap ;b :CtrlPBuffer<CR>
nmap ;m :CtrlPMRUFiles<CR>

"Syntastic settings
"Default settings to use as a new user. Tailor as needed
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:sstic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']        " Checks to use for javascipt
let g:syntastic_quiet_messages = {"level": "warnings"}  " Ignore warnings
"Mapping of various commands   
" Searching, change it to use ctrl + f for all file searching on strings
if has('win32')
   nmap <c-f> :Rfindpattern /I<CR>
elseif has('unix')
   nmap <c-f> :Rgrep -i<CR>
endif
"Commands for switching between split windows
nmap <silent> <A-k> :wincmd k<CR>     
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Moving via sub words
nmap <silent> <b> :call search("[A-Z]\\\|\\\>", "b")<CR>
nmap <silent> <w> :call search("[A-Z]\\\|\\\>", "")<CR>

"  Remove READONLY file attribute from current file {{{
"  w! - Saves file
"  !start - Start separate thread for command
"  cmd /c - Run command and exit when done
"  attrib -R % - Change current file (%) attributes to remove readonly (-R)
"------------------------------------------------------------------------------"
if has('win32')
   nmap <leader>rro :w!<CR> :!start cmd /c attrib -R %<CR>
endif
nnoremap x "_x

" General Settings
" Set current working directory to always be the directory of the current file you're in
set autochdir

"  CTAGS {{{
"  Run the command below to create the tags file
"     cd C:\<code>
"     ctags -R -h hpp --extra=+q
"------------------------------------------------------------------------------"
" Set tags file
"set tags=.\tags
set complete=.,w,b,u,t,k
set completeopt=longest,menuone  "Complete up to longest set of characters, show menu even if only one option

