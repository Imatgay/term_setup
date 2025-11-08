syntax on

execute pathogen#infect()
filetype plugin indent on
let python_pep8_indent_hang_closing = 1

set encoding=utf-8

" Set shift width to 4 spaces.
set shiftwidth=4

set laststatus=2
set ttyfast

"Show what mode you are currently editing in
set showmode

"Shows partial commands in the last line of the screen
set showcmd
"
" from vimrc. See https://github.com/amix/vimrc/tree/master

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2


" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme everforest
catch
endtry

set background=dark

set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set number
set relativenumber

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


"""""""""""""""""
""""""""""""
highlight! link StatusLine Normal
highlight! link StatusLineNC Normal

highlight Normal ctermbg=Black guibg=#000000

" 3. Imposta il COLORE DEI NUMERI (foreground) su un grigio/marrone chiaro e tenue.
"    'DarkGray' è un colore cterm standard. Il codice esadecimale #6B8E23 (Olive Drab) è un verde-marrone tenue.
highlight LineNr ctermfg=DarkGray guifg=#A9A9A9 " A9A9A9 è un DarkGray

" 4. Imposta il colore del numero sulla riga corrente (CursorLineNr).
"    Per coerenza, lo impostiamo su un bianco o un colore leggermente più visibile.
highlight CursorLineNr ctermfg=White guifg=#F5F5F5
