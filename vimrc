"pathogen
execute pathogen#infect()

"quickly open/reload .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"navigation in insert mode to emacs style
imap <C-p> <esc><Up>
imap <C-n> <esc><Down>
imap <C-b> <esc><Left>
imap <C-f> <esc><Right>

"copy to clipboard
vmap <C-c> :'<,'>!pbcopy<CR>u

"window navigation
map <C-o> <C-w><C-w>

"tab navigation
map <C-t> :tabnew<CR>
imap <C-t> <esc>:tabnew<CR>
map <Leader>w :close<CR>
map <Leader>[ :tabprevious<CR>
map <Leader>] :tabnext<CR>

"map <esc> to <ctrl-l> in insert/visual  modes
imap <C-l> <Esc>
vmap <C-l> <Esc>

"save with ctrl-s
nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

"NERDTree
map <Leader>\ :NERDTreeToggle<CR>

"color schemes and syntax highlighting
map ts :SyntasticToggleMode<CR>
syntax enable 		    "enable syntax highlighting
colorscheme badwolf 	"set colorscheme to badwolf

"editor configuration
set tabstop=4       "set tab spacing to 2 spaces
set expandtab		"expands tabs into spaces instead
set shiftwidth=4
set softtabstop=4   "this edits in the number of tab spaces
set relativenumber  "show relative linenumbers around cursor
set number          "show actual line number under cursor
autocmd BufWritePre * :%s/\s\+$//e "removes trailing whitespace on save

"ui configuration
set number            "adds line numbers to your editor
set showcmd           "shows last command entered in bottom right
set cursorline        "highlights current line
filetype indent on    "load filetype specific indent files
filetype plugin on    "turn on filetype plugins
set wildmenu          "visual autocomplete for command menu
set showmatch         "shows matching {[( when cursor is above

"syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntasting_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <silent> <Leader>e :Errors<CR>

"GHC-MOD
map <Leader>gt :GhcModType<CR>
map <Leader>gc :GhcModTypeClear<CR>

au FileType haskell nnoremap <buffer> <F12> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F11> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F10> :HdevtoolsInfo<CR>

