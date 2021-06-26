"SHOULD INSTALL the_silver_searcher

"set the default fzf preview key
let g:coc_fzf_preview_toggle_key = "?"
" needed for colors preview
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.95 } }
"just to ... with fzf
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"set default clipboard
let g:clipboard = {
      \   'name': 'gpaste',
      \   'copy': {
      \      '+': 'tmux load-buffer -',
      \      '*': 'tmux load-buffer -',
      \    },
      \   'paste': {
      \      '+': 'tmux save-buffer -',
      \      '*': 'tmux save-buffer -',
      \   },
      \   'cache_enabled': 1,
      \ }

"config for coc snippets: SHOULD INSTALL PYTHON NVIM
" Use <C-l> for trigger snippet expand.
imap <C-z> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-x> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-x> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
"MAKE TAB TO AUTO COMPLETE SNIPPET LIKE VSCODE
inoremap <silent><expr> <A-x>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<A-x>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"let g:coc_snippet_next = '<tab>'

"replace highlighted text with prompted input hotkey
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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
    Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

	let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json']

	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'

    Plug 'preservim/nerdcommenter'

    Plug 'daeyun/vim-matlab' 

    Plug 'octol/vim-cpp-enhanced-highlight'

    " cpp linting
    " FOR IT TO RUN INSTALL: pip install cpplint
    Plug 'vim-syntastic/syntastic'
    " cpp sintax highligh

    " Activate one of these
    "Plug 'prabirshrestha/vim-lsp' " vim-lsp
    "Plug 'autozimu/LanguageClient-neovim' " LanguageClient-neovim
    "Plug 'neoclide/coc.nvim' " coc.nvim
    "Plug 'neovim/nvim-lsp' " nvim-lsp
    "Plug 'jackguo380/vim-lsp-cxx-highlight'

    " some latex plugs
    Plug 'lervag/vimtex'

    "linter for almost any language
    Plug 'dense-analysis/ale'

    "git branch display
    Plug 'itchyny/vim-gitbranch'
    Plug 'airblade/vim-gitgutter'
    "for airblade we have to do something more to install it --->
    "                  mkdir -p ~/.config/nvim/pack/airblade/start
    "                  cd ~/.config/nvim/pack/airblade/start
    "                  git clone https://github.com/airblade/vim-gitgutter.git
    "                  nvim -u NONE -c "helptags vim-gitgutter/doc" -c q
    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ end ~~~
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    
    " plugins for c language
    Plug 'deoplete-plugins/deoplete-clang'

    "easy-align commands for aligning properly everything
    Plug 'junegunn/vim-easy-align'

    "adds commands for fancy comments
    Plug 'cometsong/CommentFrame.vim'

call plug#end()

"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

"colorsheme for cpp 
"let g:lsp_cxx_hl_ft_whitelist = ['c', 'cpp', 'h']
"let g:lsp_cxx_hl_use_nvim_text_props = 1 
"let g:lsp_cxx_hl_light_bg = 1 
"highlight LspCxxHlSymClassMethod ctermfg=Magenta guifg=Magenta
"highlight LspCxxHlSymStructMethod  ctermfg=Red guifg=Red
"highlight LspCxxHlSymVariableStatic ctermfg=Blue guifg=Blue

"linter for cpp
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" c++ syntax highlighting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 10
let g:syntastic_auto_jump = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" hotkey to open Errors terminal
nmap <A-r> :Errors <CR>

" linters for c languague
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}
" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" add plugin to ignore node files
let g:ackprg = 'ag --nogroup --nocolor --column'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set cursorline
"if defined the below command will make the background transparent
let g:dracula_colorterm = 0
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
tnoremap <A-a> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+t
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <A-t> :call OpenTerminal()<CR>
" custom commands to compile and execute code in c, c++ and python
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
"autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!i686-w64-mingw32-gcc '.shellescape('%:p')'-o '.shellescape('%:p:r.exe')'-std=c90 && wineconsole '.shellescape('%:p:r.exe') <CR>
autocmd filetype c nnoremap <F5> :w <bar> term gcc %:p -o %:p:r -lm && %:p:r <CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!i686-w64-mingw32-g++ -static '.shellescape('%:p')' -o '.shellescape('%:p:r.exe')' && wineconsole '.shellescape('%:p:r.exe') <CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"JUST RUN THE COMPILED CODE
autocmd filetype cpp nnoremap <F3> :w <bar> exec '!./'.shellescape('%:r')<CR>
"COMPILE CPP CODE FOR GTK LIBRARY
autocmd filetype cpp nnoremap <F2> :w <bar> exec '!g++ -o'.shellescape('%:r')' $(pkg-config --cflags --libs gtkmm-4.0) '.shellescape('%').' && ./'.shellescape('%:r')<CR>
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
nmap <A-b> :resize 100 <CR>
nmap <A-v> :res +1 <CR>
nmap <A-c> :res -1 <CR>

"bind to auto compile .tex (latex) files
nmap <A-p> :VimtexCompile <CR>

"bind to auto complete close of brackets
inoremap { {<CR>}<Esc>ko

"bind to switch fold on git changes on current file
nmap <A-n> :GitGutterFold <CR>

"bind to display current brach
nmap <C-k> :echo gitbranch#name() <CR>

"bind to show all commits and navigate between them
nmap <A-m> :GV <CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" command to open a new terminal in the current directoy
map <F8> :exec '!konsole'.shellescape('%:p')' && disown' <CR>
map <F9> :exec '!gnome-terminal '.shellescape('%:p')' && disown' <CR>
"TODO: arreglar este comando
"map <F10> :exec '!xfce4-terminal --default-working-directory='.shellescape('%:p')' && disown' <CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FANCY COMMENTS ~~~~~
" USAGE OF FANCY COMMENTS
"
" Key     Command Name                Result
"     ---     --------------------------  ----------------------------------------
"     fcs     CommentFrameSlashes         border: //****************************//
"     fcS     CommentFrameSlashStar       border: /******************************/
"     fch     CommentFrameHashDash        border: #------------------------------#
"     fcH     CommentFrameHashEqual       border: #==============================#
"     fcq     CommentFrameQuoteDash       border: "------------------------------"
"     fcQ     CommentFrameQuoteTilde      border: "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" 
"     frh     CommentRightHash            line: #~~~~~~~~~~~~~~~~~~~~~ title ~~~~~
"     frs     CommentRightSlashes         line: //~~~~~~~~~~~~~~~~~~~~ title ~~~~~
"     frS     CommentRightSlashStar       line: /*~~~~~~~~~~~~~~~~~~ title ~~~~~*/
"     frq     CommentRightQuote           line: "~~~~~~~~~~~~~~~~~~~~~ title ~~~~~

" TODO: add snippets DOWN HERE
