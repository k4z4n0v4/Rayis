" TODO:
"	# Make errors appear before warnings in loclist/quickfix
"	# Make echodoc preview close automatically


call plug#begin()
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-fugitive'
	Plug 'preservim/nerdtree'
    Plug 'lervag/vimtex'
	Plug 'edkolev/promptline.vim'
	Plug 'preservim/nerdcommenter'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'arcticicestudio/nord-vim'
	Plug 'Shougo/echodoc.vim'
	Plug 'ryanoasis/vim-devicons'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neovimhaskell/haskell-vim'
    Plug 'honza/vim-snippets'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'saltstack/salt-vim'
    Plug 'mechatroner/rainbow_csv'
call plug#end()

set termguicolors
set updatetime=300
set modifiable
set showmatch
set scrolloff=1
set sidescrolloff=3
set clipboard=unnamedplus
set noshowmode " Disable vim's own mod indicator
set number relativenumber
set encoding=utf-8
filetype plugin indent on
set mouse=a

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


" Lifetime undo, WOOOOOOOOOOOOOOOOoo
"
set undodir=/home/suren/.cache/nvim/undofiles
set undofile


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" This will look in the current directory for tags and work up the tree towards root until one is found
set tags=./tags;/

" PEP 8 stuff
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

autocmd FileType python map <buffer> <F5> :w<CR> :exec '!python' shellescape(@%, 1)<CR>



" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red


" Set colorscheme 
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
colorscheme nord

" set :grep to ripgrep (used for replacing in multiple files) 
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

"------------------------------------------------------------------- Airline

" Make airline pointy
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'

"------------------------------------------------------------------- Indent-Guides

" Enable indent-guides
let g:indent_guides_enable_on_vim_startup = 0

"------------------------------------------------------------------- COC.vim


	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<down>"
	  nnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>"
	  inoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<down>"
	  inoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<up>"
	  vnoremap <silent><nowait><expr> <down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<down>"
	  vnoremap <silent><nowait><expr> <up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<up>"
	endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)


" Trigger CodeLens 
xmap <leader>ec  <Plug>(coc-codelens-action)
nmap <leader>ec  <Plug>(coc-codelens-action)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ea  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Search workspace symbols.
nmap  <leader>s  :<C-u>CocList -I symbols<cr>

" Use tab and S-Tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_sources_disable_map = { 'cs': ['cs-2','cs-3', 'cs-4'] }
""------------------------------------------------------------------- Deoplete
"" Enable Deoplete
"let g:deoplete#enable_at_startup = 1

"" Close autocomplete function preview window
"autocmd CompleteDone * silent! pclose!

"" Use vimtex with deoplete
"call deoplete#custom#var('omni', 'input_patterns', {
"        \ 'tex': g:vimtex#re#deoplete
"        \})

"" Deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<tab>"
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"


""------------------------------------------------------------------- ALE

"" Lint on text change in both Insert and Normal modes
"let g:ale_lint_on_text_changed = 1

"" Delay to run lint on text change
"let g:ale_lint_delay = 1

"" Window with errors and height of 3
"let g:ale_open_list = 1
"let g:ale_list_window_size = 3

"" Close window with errors when you exit vim
"augroup CloseLoclistWindowGroup
"  autocmd!
"  autocmd QuitPre * if empty(&buftype) | lclose | endif
"augroup END

"------------------------------------------------------------------- Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
highlight link EchoDocFloat Pmenu

"-------------------------------------------------------------------  Vimtex
let g:vimtex_quickfix_method = "pplatex"
let g:tex_flavor = "latex"

"------------------------------------------------------------------- NerdTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"nnoremap <Leader>f :NERDTreeToggle <Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMapCustomOpen = "<space>"

"------------------------------------------------------------------- vim-notes
let g:notes_directories = ['~/Documents/Notes']

"------------------------------------------------------------------- NERD-commenter

let g:NERDDefaultAlign = 'left'



"------------------------------------------------------------------- fzf.vim
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>


"------------------------------------------------------------------- TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    ensure_installed = "maintained",
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = true },
}
EOF


"------------------------------------------------------------------- colorizer
lua require'colorizer'.setup()
