""""""""""""NATIVES""""""""""""""
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set splitright


""""""""""""PLUGINS""""""""""""""
call plug#begin('/usr/share/nvim/plugged')
"Syntaxis
Plug 'sheerun/vim-polyglot'

"Status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

"Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

"Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

"Autocomple
Plug 'neoclide/coc.nvim', {'branch':'release'}
											
"IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
"Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

"Git
"Plug 'tpope/vim-fugitive'
call plug#end()

"theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
highlight Normal ctermbg=NONE


""""""""""""MAPS""""""""""""""
let mapleader=" "

"NATIVES
:imap ii <Esc> 
"map Down Up
imap <C-j> <Down>
imap <C-k> <Up>
";
nnoremap <Leader>; $a;<Esc>
"buffers
map <Leader>ob :Buffers<cr>
"save and quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>wq :wq<CR>
"split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><
"execute
nnoremap <Leader>x :!node %<cr>
"Terminal
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " clo
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

"live server
function! LiveServer()
  execute "term live-server"
  execute "bp"
endfunction
nnoremap <Leader>ls :call LiveServer()<CR>

"PLUGINS
nmap <Leader>s <Plug>(easymotion-s2)
nnoremap <Leader>nt :NERDTreeFind<CR>
"fzf
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>ag :Ag<CR>
"git
"nnoremap <Leader>G :G<cr>
"nnoremap <Leader>gp :Gpush<cr>
"nnoremap <Leader>gl :Gpull<cr>
"coc
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"tab coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Enter coc
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
