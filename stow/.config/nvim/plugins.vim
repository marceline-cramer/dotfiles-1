" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Lualine
"Plug 'nvim-lualine/lualine.nvim'

" Barbar (tabs, top bar)
"Plug 'romgrk/barbar.nvim'

" NvimTree
"Plug 'kyazdani42/nvim-tree.lua'

" Vinegar File Browser
"Plug 'tpope/vim-vinegar'

" Tagbar
"Plug 'preservim/tagbar'

" Keybind Display
"Plug 'folke/which-key.nvim'

" Vim DevIcons
"Plug 'kyazdani42/nvim-web-devicons' " Snazzier fork

" Git indicators in ruler
"Plug 'nvim-lua/plenary.nvim'
"Plug 'lewis6991/gitsigns.nvim'

" Bufkill
"Plug 'qpkorr/vim-bufkill'

" TreeSitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" Dracula Theme
"Plug 'dracula/vim',{'as':'dracula'}

" Dracula Pro Theme
packadd! dracula_pro

" Base16 Themes
"Plug 'chriskempson/base16-vim'

" vCoolor Color Picker
"Plug 'KabbAmine/vCoolor.vim'

" Color Viewer
""Plug 'gko/vim-coloresque'

" Smooth Scrolling
"Plug 'karb94/neoscroll.nvim'

" Amora Theme
"Plug 'owozsh/amora'

" TOML Syntax
"Plug 'cespare/vim-toml'

" Rust Syntax
"Plug 'rust-lang/rust.vim'

" RON Syntax
"Plug 'ron-rs/ron.vim'

" GLSL Syntax
"Plug 'tikhomirov/vim-glsl'

" Coc Autocompletion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LaTeX Support
"Plug 'lervag/vimtex'

" Live LaTeX Previewing
"Plug 'xuhdev/vim-latex-live-preview'

" Goyo Writing
"Plug 'junegunn/goyo.vim'

" Seoul256 Color Scheme (low contrast, Goyo)
"Plug 'junegunn/seoul256.vim'

" Rose Pine Color Scheme
"Plug 'rose-pine/neovim'

" Initialize plugin system
call plug#end()
