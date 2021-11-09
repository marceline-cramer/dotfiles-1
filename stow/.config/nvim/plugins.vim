" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')


" Deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vinegar File Browser
Plug 'tpope/vim-vinegar'

" Tagbar
Plug 'preservim/tagbar'

" Vim DevIcons
Plug 'ryanoasis/vim-devicons'

" Bufkill
Plug 'qpkorr/vim-bufkill'

" Syntastic Syntax Checking
"Plug 'vim-syntastic/syntastic'

" YouCompleteMe Code Completion
"Plug 'ycm-core/YouCompleteMe'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" CtrlP Fuzzy Finder
"Plug 'ctrlpvim/ctrlp.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Dracula Theme
Plug 'dracula/vim',{'as':'dracula'}

" Dracula Pro Theme
packadd! dracula_pro

" Base16 Themes
Plug 'chriskempson/base16-vim'

" vCoolor Color Picker
Plug 'KabbAmine/vCoolor.vim'

" Color Viewer
"Plug 'ap/vim-css-color'
Plug 'gko/vim-coloresque'

" Smooth Scrolling
Plug 'psliwka/vim-smoothie'

" Amora Theme
Plug 'owozsh/amora'

" TOML Syntax
Plug 'cespare/vim-toml'

" Rust Syntax
Plug 'rust-lang/rust.vim'

" RON Syntax
Plug 'ron-rs/ron.vim'

" GLSL Syntax
Plug 'tikhomirov/vim-glsl'

" Coc Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LaTeX Support
Plug 'lervag/vimtex'

" Live LaTeX Previewing
Plug 'xuhdev/vim-latex-live-preview'

" Goyo Writing
Plug 'junegunn/goyo.vim'

" Seoul256 Color Scheme (low contrast)
Plug 'junegunn/seoul256.vim'

" Initialize plugin system
call plug#end()
