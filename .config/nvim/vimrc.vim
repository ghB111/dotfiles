" see NEW
" for new stuff
"
"
"
"
"
set encoding=UTF-8
set nocompatible
set redrawtime=10000
" source ~/.vimplugins/closepairs.vim

let mapleader = " "

" vim-plug

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" NEW

Plug 'preservim/nerdtree'
Plug 'wellle/context.vim'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-obsession'
Plug 'Yggdroot/indentLine'

Plug 'vim-autoformat/vim-autoformat'

Plug 'folke/neodev.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'



Plug 'justinmk/vim-sneak'
Plug 'rhysd/vim-clang-format'
Plug 'Shougo/vimproc.vim'
Plug 'stevearc/oil.nvim'


Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin

Plug 'junegunn/vim-plug'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'

Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'RRethy/vim-illuminate'
" Plug 'terryma/vim-smooth-scroll'

Plug 'easymotion/vim-easymotion'

Plug 'morhetz/gruvbox'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'Valloric/YouCompleteMe', {'commit':'d98f896', 'do': './install.py' }
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'

""Plug 'bagrat/vim-buffet'
""Plug 'ryanoasis/vim-devicons'

call plug#end()
" let g:colorizer_auto_color = 1
let g:rainbow_active = 1

let g:python3_host_prog="/Users/rbrek/projects/depot_tools/python3"

let g:EasyMotion_smartcase = 1

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
" function! s:incsearch_config(...) abort
"   return incsearch#util#deepextend(deepcopy({
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {
"   \     "\<CR>": '<Over>(easymotion)'
"   \   },
"   \   'is_expr': 0
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 6)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 6)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 10)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 10)<CR>


nnoremap <F5> :UndotreeToggle<cr>


" default updatetime 4000ms is not good for async update
set updatetime=100
" let g:indentLine_setColors = 0
" let g:indentLine_color_term = 123

" NEW
" go back
nmap <C-h> <C-o>
" go forward
nmap <C-l> <C-i>

"noremap <Tab> :bn<CR>
"noremap <S-Tab> :bp<CR>
"noremap <Leader><Tab> :Bw<CR>
"noremap <Leader><S-Tab> :Bw!<CR>
"noremap <C-t> :tabnew split<CR>
let g:buffet_powerline_separators = 1
let g:buffet_show_index = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt
nmap <leader>0 10gt

nnoremap <C-p> :GFiles<cr>

nnoremap <C-p> :call fzf#run({'sink': 'e', 'source': 'arc ls-files'})<cr>
nnoremap <leader>d :SignifyHunkDiff<cr>

nnoremap <leader>C :let @+ = expand("%")<cr>
nnoremap <leader>F :let @+ = expand("%:t")<cr>


let g:signify_vcs_list = ['git']
noremap <leader>o :ClangdSwitchSourceHeader<cr>
xnoremap <leader>f :AutoFormat<cr>
noremap <leader>h :History<cr>

" TODO add env for common part with private
source yandex.vim

" nnoremap <leader>Q :e %:h<cr>
nnoremap <leader>t :NERDTree<cr>


nnoremap <leader>p :Files<cr>
nnoremap <leader>P :Files<cr>

command W w

set background=dark
set nu
set rnu
set numberwidth=1
set hlsearch
set incsearch

set smartcase
set undodir=~/.vim/undodir
set undofile
set nowrap
set colorcolumn=120

highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin indent on
set autoindent

" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces/1878983
set tabstop=2
set shiftwidth=2
set expandtab

" let python_highlight_all = 1

" colorscheme torte "check out morning
colorscheme gruvbox
" highlight Comment        ctermfg=7                                                guifg=#808080
" hi Search ctermbg=Red ctermfg=0

hi EasyMotionTarget term=bold cterm=bold ctermbg=none ctermfg=1
hi EasyMotionTarget2First ctermbg=none ctermfg=127
hi EasyMotionTarget2Second ctermbg=none ctermfg=128
" hi EasyMotionTarget2First ctermbg=Red ctermfg=0
" hi EasyMotionTarget2Second ctermbg=Red ctermfg=0
" hi EasyMotionShade ctermbg=Red ctermfg=0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'


" cool colorschemes: (do by ":colorscheme ...", default was ron, to see all, do ls -l /usr/share/vim/vim*/colors/)
" pablo, morning, slate, murphy, 

" set spell

" https://vi.stackexchange.com/questions/10296/navigation-in-insert-mode
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


" Keymaps to disable highliting or enable highlighting
execute "set <M-h>=\eh"
nnoremap <M-h> :noh<ENTER>

" https://vim.fandom.com/wiki/Alternative_tab_navigation

