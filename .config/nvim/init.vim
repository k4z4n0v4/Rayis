" TODO:
"	# Make errors appear before warnings in loclist/quickfix

call plug#begin()
	Plug 'flazz/vim-colorschemes'
	Plug 'sheerun/vim-polyglot'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'w0rp/ale'
	Plug 'shougo/deoplete.nvim'
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'jiangmiao/auto-pairs'
	Plug 'lervag/vimtex'
	Plug 'Shougo/echodoc.vim'
	Plug 'tpope/vim-fugitive'
call plug#end()

set showmatch
set scrolloff=1
set sidescrolloff=5
set clipboard=unnamedplus
set noshowmode " Disable vim's own mod indicator
set nu
set encoding=utf-8
set cursorcolumn
set cursorline
let g:tex_flavor = "latex"
" PEP 8 stuff
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

let g:jellyx_italic = 1

colorscheme jellyx



"------------------------------------------------------------------- Polyglot

let g:polyglot_disabled = ['latex']


"------------------------------------------------------------------- Airline

" Make airline pointy
let g:airline_powerline_fonts = 1

let g:airline_theme = 'jellybeans'

let g:XkbSwitchLib = "/usr/lib/libxkbswitch.so"
"------------------------------------------------------------------- Indent-Guides
" Disable indent-guides for vim
let g:indent_guides_exclude_filetypes = ['vim']

" Enable indent-guides
let g:indent_guides_enable_on_vim_startup = 1

"------------------------------------------------------------------- Deoplete
" Enable Deoplete
let g:deoplete#enable_at_startup = 1

" Close autocomplete function preview window
autocmd CompleteDone * silent! pclose!

" Use vimtex with deoplete
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})

" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"


"------------------------------------------------------------------- ALE

" Lint on text change in both Insert and Normal modes
let g:ale_lint_on_text_changed = 1

" Delay to run lint on text change
let g:ale_lint_delay = 1

" Window with errors and height of 3
let g:ale_open_list = 1
let g:ale_list_window_size = 3

" Close window with errors when you exit vim
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

"------------------------------------------------------------------- Echodoc

let g:echodoc#enable_at_startup = 1

let g:echodoc#type = 'floating'


let g:vimtex_quickfix_method = "pplatex"
