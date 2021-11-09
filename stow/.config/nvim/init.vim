"   ___  ________   ___  _________    ___      ___ ___  _____ ______      
"  |\  \|\   ___  \|\  \|\___   ___\ |\  \    /  /|\  \|\   _ \  _   \    
"  \ \  \ \  \\ \  \ \  \|___ \  \_| \ \  \  /  / | \  \ \  \\\__\ \  \   
"   \ \  \ \  \\ \  \ \  \   \ \  \   \ \  \/  / / \ \  \ \  \\|__| \  \  
"    \ \  \ \  \\ \  \ \  \   \ \  \ __\ \    / /   \ \  \ \  \    \ \  \ 
"     \ \__\ \__\\ \__\ \__\   \ \__\\__\ \__/ /     \ \__\ \__\    \ \__\
"      \|__|\|__| \|__|\|__|    \|__\|__|\|__|/       \|__|\|__|     \|__|
"


" Use fish as Vim shell if current shell is fish
if &shell =~# 'fish$'
	set shell=zsh
endif

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1


set number	" Enable line numbers
set relativenumber
highlight LineNr ctermfg=250 ctermbg=235	" Line number background
set mouse=a
set hidden
set nocursorline
set ts=4
set sw=4
filetype plugin indent on
nnoremap <SPACE> <Nop>  " Unmap Space key to use as leader
let mapleader=" "
inoremap  <C-W>
inoremap <C-Del> <C-O>dw
inoremap <C-Z> <C-O>u
nnoremap <c-z> <nop>
inoremap <C-Y> <C-O><C-R>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
map <F1> <NOP>
map <M-F1> <NOP>
imap <F1> <NOP>
imap <M-F1> <NOP>

noremap <C-H> :bprev<CR>
noremap <C-L> :bnext<CR>


nnoremap <F8> :TagbarToggle<CR>



source ~/.config/nvim/plugins.vim


" Vim Theme
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
let base16colorspace=256  " Access colors present in 256 colorspace

syntax enable  " Using TreeSitter
"colorscheme dracula
"colorscheme base16-dracula

let g:dracula_colorterm = 0
colorscheme dracula_pro
set termguicolors

"let g:mode = 'focus'
"let g:mode = 'mirtilo'
"colorscheme amora

"hi Normal guibg=NONE ctermbg=NONE	" Force transparent background
"hi LineNr ctermbg=NONE guibg=NONE guifg=#5d5f7f
"hi Comment guifg=#8689a8

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula_pro'
"let g:airline_theme='amora'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_skip_empty_sections = 1


set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"call deoplete#custom#source('_', 'smart_case', v:true)

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1


"let NERDTreeShowHidden=1

let g:livepreview_previewer = 'zathura'

let g:vimtex_grammar_texidote = {
			\ 'jar': '/opt/textidote/textidote.jar',
			\ 'args': '',
			\}

set spelllang=en
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

nnoremap k gk
nnoremap j gj
nnoremap <Up> g<Up>
inoremap <Up> <C-O>g<Up>
nnoremap <Down> g<Down>
inoremap <Down> <C-O>g<Down>
nnoremap <Home> g<Home>
inoremap <Home> <C-O>g<Home>
nnoremap <End> g<End>
inoremap <End> <C-O>g<End>


" Using Lua functions for Telescope
nnoremap <leader>,   <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>.   <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>:   <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>/b  <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>/i  <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>
nnoremap <leader>/I  <cmd>lua require('telescope.builtin').tags()<cr>

"nnoremap <leader>bk  :bd<CR>
nnoremap <leader>bk  :BD<CR>
nnoremap <leader>b]  :bnext<CR>
nnoremap <leader>b[  :bprev<CR>
nnoremap <leader>bn  :enew<CR>

nnoremap <leader>f. <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

nnoremap <leader>/  <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>x  <cmd>lua require('telescope.builtin').commands()<cr>

nnoremap <leader>op  :Explore<CR>
nnoremap <leader>on  :Explore<CR>
nnoremap <leader>ot  :terminal<CR>

" Telescope Configuration
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
	mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
	  '--hidden',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

" TreeSitter Configuration
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = { "" },  -- list of language that will be disabled
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
    	additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true
	}
}
EOF

