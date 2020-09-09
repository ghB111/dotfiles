set nocompatible
scriptencoding utf-8

source ~/.vimplugins/closepairs.vim

" vim-plug


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'

call plug#end()
" let g:colorizer_auto_color = 1


set background=dark
set nu
set rnu
set numberwidth=1
set hlsearch
set incsearch

filetype plugin indent on
set autoindent

" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces/1878983
set tabstop=4
set shiftwidth=4
set expandtab

" let python_highlight_all = 1

colorscheme torte "check out morning
highlight Comment        ctermfg=7                                                guifg=#808080


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

" https://stackoverflow.com/questions/597687/changing-variable-names-in-vim#:~:text=Press%20%3As%2F%20%2D%20start%20of,even%20better%20%2D%20map%20a%20key.&text=Put%20this%20to%20your%20.

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
