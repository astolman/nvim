call plug#begin('~/.vim/plugged')
"Add editing functionality
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-exchange'
Plug 'unblevable/quick-scope'
"Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'honza/vim-snippets'
Plug 'gennaro-tedesco/nvim-peekup'
"IDE type stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'dag/vim-fish'
"Plug 'luk400/vim-jukit'
"Plug 'wmvanvliet/jupyter-vim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar'
"Plug 'rhysd/vim-clang-format'
"File browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Cosmetics
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set hidden
set hlsearch
set mouse=a
set showcmd
set nu
let mapleader = ' '

augroup FileTypeSpecificAutocommands
	autocmd FileType cpp setlocal shiftwidth=2 expandtab
	autocmd FileType python setlocal shiftwidth=4 expandtab
augroup END


"saving and quitting
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
vnoremap <MiddleMouse> y

"reverse ; and :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"sneak
let g:sneak#s_next = 1
"navigating buffers
nnoremap <silent> <left> :bp<CR>
nnoremap <silent> <right> :bn<CR>

"open FZF
nnoremap <leader>f :FZF<CR>

"open Tagbar
nnoremap <leader>t :TagbarToggle<CR>

"fugitive
nnoremap <leader>g :Git 

"vim-airline settings
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "term"

"quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=500

"python syntax highlighting from the plugin
let g:python_highlight_all = 1
syntax on

"""""""Startify settings"""""""
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

"c++ formatting
"autocmd FileType c,cpp ClangFormatAutoEnable

""""""COC settings""""""
highlight CocErrorFloat ctermfg=Black guifg=#000000
set cmdheight=2
set updatetime=200
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" semantic highlighting
let g:coc_default_semantic_highlight_groups = 1
let g:lsp_cxx_hl_use_text_props = 1

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ctrl M to show documentation in preview window.
nnoremap <silent> <leader>m :call CocActionAsync('doHover')<CR>
"Use ctrl H to highlight current symbol
nnoremap <silent> <leader>h :call CocActionAsync('highlight')<CR>

nmap <leader>cn <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"coc-explorer for the filebrowser
nnoremap <leader>o :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

imap <C-j> <Plug>(coc-snippets-expand-jump)

"jukit options for jupyter
"let g:jukit_shell_cmd = "/home/andrew/katana-enterprise/build/python_env.sh ipython"

let g:lsp_cxx_hl_log_file = '/tmp/vim-lsp-cxx-hl.log'
let g:lsp_cxx_hl_verbose_log = 1

"coc extensions
let g:coc_global_extensions = [
			\'coc-snippets',
			\'coc-highlight',
			\'coc-explorer',
			\'coc-pyright',
			\'coc-json',
			\'coc-clangd',
			\]
