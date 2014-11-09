"Enable pathogen
execute pathogen#infect()

"Don't let Vim go into strict Vi compatibility mode
set nocompatible

"Set the map leader
let mapleader=","

"Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

"Backspace over expanded tabs
set softtabstop=4

"Backspace settings
set backspace=2

"Show line numbers
set nu

"File encoding
set encoding=utf-8

"Toggle line numbers
map <silent> <leader>nm :set nu! nu?<cr>

"Status line
set laststatus=2

"Show filename in title
autocmd BufEnter * let &titlestring = expand("%:p")
set title

"Highlight current line
set cursorline

"Show the cursor position all the time
set ruler

"Quit faster
map <silent> <F2> :q!<cr>
imap <silent> <F2> <Esc>:q!<cr>
nnoremap <leader>q :q!<cr>

"Toggle wrapscan (when searching, don't go to top after reaching bottom)
map <silent> <leader>ws :set wrapscan! wrapscan?<cr>

"Tell Syntastic which Python checkers to use
let g:syntastic_python_checkers = ['pylint', 'pep8', 'pep257']

"Aggregate the Syntastic checker results
let g:syntastic_aggregate_errors = 1

"Run Syntastic on file open (in addition to file saves)
let g:syntastic_check_on_open = 1

"Disable some pylint warnings/errors
let g:syntastic_python_pylint_args = '--disable=anomalous-backslash-in-string'

"Use passive mode for Java files
let g:syntastic_mode_map = {
\   'mode': 'active',
\   'active_filetypes': [],
\   'passive_filetypes': ['java']
\}

"Rope
map <leader>r :RopeRename<cr>
map <F3> :RopeGotoDefinition<cr>
map <leader>g :RopeFindOccurrences<cr>
map <leader>ru :RopeUndo<cr>
map <leader>rr :RopeRedo<cr>
map <leader>d :RopeShowDoc<cr>

"Turn on syntax highlighting
syntax on

"Detect filetype
filetype on

"Break nicely
set lbr

"Filename completion
set wildmenu
set wildmode=full
set wildignore+=*.o,*.obj,.svn,*.pyc

"Briefly highlight a paren once it's balanced
set showmatch

"Show matching HTML tags
set matchpairs+=<:>

"ctrl-jklm changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
imap <C-W> <C-O><C-W>

"Case-insensitive search unless your string contains uppercase letters
set ignorecase
set smartcase

"Quickly switch buffers
map <leader>1 :1b<cr>
map <leader>2 :2b<cr>
map <leader>3 :3b<cr>
map <leader>4 :4b<cr>
map <leader>5 :5b<cr>
map <leader>6 :6b<cr>
map <leader>7 :7b<cr>

"ctrl-p settings
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"Always keep the cursor 3 lines from the bottom/top of the page.
set scrolloff=3

"Colourscheme
colorscheme xoria256

"Set background to dark.
set background=dark

"set colorcolumn=80
hi ColorColumn ctermbg=238

"Mutt settings
au BufRead ~/.mutt/temp/mutt* setlocal tw=72
au BufRead ~/.mutt/temp/mutt* setlocal fo+=aw
au BufRead ~/.mutt/temp/mutt* setlocal spell spelllang=en_ca
au BufRead ~/.mutt/temp/mutt* setlocal colorcolumn=72

"Git blame
map <leader>gb :Gblame<cr>

"Taglist
nnoremap <silent> <leader>t :TlistToggle<cr>
let Tlist_GainFocus_On_ToggleOpen = 1

"Use [[, ]], [], and ][ even when { or } don't appear in the first column
:map [[ ?{<cr>w99[{
:map ][ /}<cr>b99]}
:map ]] j0[[%/{<cr>
:map [] k$][%?}<cr>

"Ack
map <leader>a :Ack!

"Highlight trailing whitespace
map <silent> <leader>hs /\s\+$<cr>

"Remove all trailing whitespace
map <silent> <leader>rs :%s/\s\+$//e<cr>

"Close a buffer
map <silent> <leader>bd :bd<cr>
