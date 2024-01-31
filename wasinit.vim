call plug#begin('.config/nvim/plugged')

Plug 'numToStr/Comment.nvim'
Plug 'easymotion/vim-easymotion'
call plug#end()

syntax enable
filetype plugin indent on

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

set clipboard+=unnamedplus

" let g:clipboard = {
"   \   'name': 'win32yank-wsl',
"   \   'copy': {
"   \      '+': 'win32yank.exe -i --crlf',
"   \      '*': 'win32yank.exe -i --crlf',
"   \    },
"   \   'paste': {
"   \      '+': 'win32yank.exe -o --lf',
"   \      '*': 'win32yank.exe -o --lf',
"   \   },
"   \   'cache_enabled': 0,
"   \ }

set expandtab
set tabstop=2
set shiftwidth=2

lua << EOF
require('Comment').setup()
EOF

if exists('g:vscode')
  source ~/.config/nvim/vscode/settings.vim
else

  autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
  set nu rnu

endif
