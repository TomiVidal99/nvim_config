filetype plugin indent on " On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=4
set softtabstop=4
" when indenting with '>', use 2 spaces width
set shiftwidth=4
call plug#begin("~/.vim/plugged")
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'dracula/vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json']
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
    Plug 'preservim/nerdcommenter'
    Plug 'daeyun/vim-matlab'

    " some latex plugs
    Plug 'lervag/vimtex'

    " old vim plugs
    " Plug 'lervag/vimtex'
    " Plug 'Konfekt/FastFold'
    " Plug 'matze/vim-tex-fold'
    " color scheme
    "Plugin 'flazz/vim-colorschemes'
call plug#end()

" add plugin to ignore node files
let g:ackprg = 'ag --nogroup --nocolor --column'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
"colorscheme 0x7A69_dark
"colorscheme anderson
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <A-t> :call OpenTerminal()<CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-x': 'vsplit'
  \}
" map esc to alt-left and enter to right alt
nmap ff <Return>
imap <A-a> <Esc>
function! ParseJSON()
	%!python -m json.tool
endfunction
nmap <A-q> :call ParseJSON()<CR> 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

set relativenumber
let mapleader = " " " map leader to Space
let mapleader = "," " map leader to comma

nmap <C-s> :w <CR>

" bind Ctrl+k moves to next tab
" bind Ctrl+j moves to previous tab
" bind Ctrl+n creates a new tab
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" bind ESC to right alt
map <C-m> :/ <CR>
map <A-a> :noh<CR>

" " LATEX config
" let g:tex_flavor  = 'latex'
" let g:tex_conceal = ''
" let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1
" let g:vimtex_compiler_progname = 'nvr'
" 
" " NCM2
" augroup NCM2
"   autocmd!
"   " some other settings...
"   " uncomment this block if you use vimtex for LaTex
"   autocmd Filetype tex call ncm2#register_source({
"             \ 'name': 'vimtex',
"             \ 'priority': 8,
"             \ 'scope': ['tex'],
"             \ 'mark': 'tex',
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm2,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
" augroup END

" AUTO MAPPING FOR MATLAB LIBRARY DISABLED
let g:matlab_auto_mappings = 0 "automatic mappings disabled

" maps for resizing 
nmap <A-b> :resize 1 <CR>
nmap <A-v> :res +1 <CR>
nmap <A-c> :res -1 <CR>

"bind to auto compile .tex (latex) files
nmap <A-p> :VimtexCompile <CR>
