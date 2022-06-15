set encoding=utf8
" Allow unsaved hidden buffers
set hidden
" Line numbers
set number
set relativenumber
" Show the cursorline
set cursorline
" Tab related
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" <leader>
let mapleader=","

call plug#begin('~/.nvim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" " Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Commenting
Plug 'tpope/vim-commentary'

" A replacement of TagBar
Plug 'liuchengxu/vista.vim'

" NERDTree
Plug 'preservim/nerdtree'

" Nvim Tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Jumping
Plug 'justinmk/vim-sneak'

" Which key
Plug 'folke/which-key.nvim'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""
" Gruvbox
""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

""""""""""""""""""""""""""""""""""""""""""
" CoC configurations
""""""""""""""""""""""""""""""""""""""""""
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-pyright', 'coc-clangd']

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


""""""""""""""""""""""""""""""""""""""""""
" Nvim Tree
""""""""""""""""""""""""""""""""""""""""""
lua require 'nvim-tree'.setup {}
nnoremap <F7> :NvimTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""
" Buffer management
""""""""""""""""""""""""""""""""""""""""""
" https://www.reddit.com/r/neovim/comments/ac1i8w/whats_your_buffermanagement_setup/
nnoremap <leader>b :ls<cr>:b<space>

""""""""""""""""""""""""""""""""""""""""""
" sneak.vim
""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1

""""""""""""""""""""""""""""""""""""""""""
" which key
""""""""""""""""""""""""""""""""""""""""""
lua require 'which-key'.setup {}

""""""""""""""""""""""""""""""""""""""""""
" Vista
""""""""""""""""""""""""""""""""""""""""""
let g:vista_default_executive = 'coc'
nnoremap <F8> :Vista!!<CR>
