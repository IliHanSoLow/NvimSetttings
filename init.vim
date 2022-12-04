call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'ThePrimeagen/vim-be-good'
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set expandtab
set tabstop=2
set shiftwidth=2

if exists('g:vscode')
    source C:\\Users\\Kind_\\AppData\\Local\\nvim\\vscode\\settings.vim
    Plug 'easymotion/vim-easymotion'
else
    set rnu
endif
