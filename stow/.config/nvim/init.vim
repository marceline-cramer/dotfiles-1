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
set timeoutlen=200
filetype plugin indent on
"nnoremap <SPACE> <Nop>  " Unmap Space key to use as leader
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
"colorscheme dracula_pro
set termguicolors

let g:seoul256_background = 234


let g:rose_pine_variant = 'base'
let g:rose_pine_disable_background = 1
colorscheme rose-pine


"let g:mode = 'focus'
"let g:mode = 'mirtilo'
"colorscheme amora

"hi Normal guibg=NONE ctermbg=NONE	" Force transparent background
"hi LineNr ctermbg=NONE guibg=NONE guifg=#5d5f7f
"hi Comment guifg=#8689a8

" Airline config
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline_theme='dracula_pro'
"let g:airline_theme='amora'
"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline_skip_empty_sections = 1


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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

lua << EOF
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = cubic,        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
})
EOF

" Which-Key Chording
lua << EOF
local wk = require("which-key")
wk.register({
	["<leader>b"]  = { name = "buffer" },
	["<leader>bk"] = { "<cmd>BufferClose<cr>", "Close Open Buffer" },
	["<leader>bw"] = { "<cmd>BD<cr>", "BufKill Close Open Buffer" },
	["<leader>bn"] = { "<cmd>enew<cr>", "Open New Buffer" },
	["<leader>b["]       = { "<cmd>bprev<cr>", "Open New Buffer" },
	["<leader>b<Left>"]  = { "<cmd>bprev<cr>", "Open New Buffer" },
	["<leader>b]"]       = { "<cmd>bnext<cr>", "Open New Buffer" },
	["<leader>b<Right>"] = { "<cmd>bnext<cr>", "Open New Buffer" },

	["<leader>w"]  = { name = "window/pane" },
	["<leader>wk"] = { "<cmd>wincmd k<cr>", "Focus Up" },
	["<leader>wj"] = { "<cmd>wincmd j<cr>", "Focus Down" },
	["<leader>wh"] = { "<cmd>wincmd h<cr>", "Focus Left" },
	["<leader>wl"] = { "<cmd>wincmd l<cr>", "Focus Right" },
	["<leader>w<Up>"]    = { "<cmd>wincmd k<cr>", "Focus Up" },
	["<leader>w<Down>"]  = { "<cmd>wincmd j<cr>", "Focus Down" },
	["<leader>w<Left>"]  = { "<cmd>wincmd h<cr>", "Focus Left" },
	["<leader>w<Right>"] = { "<cmd>wincmd l<cr>", "Focus Right" },

	["<leader>f"]  = { name = "file" },
	["<leader>ff"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
	["<leader>fr"] = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Recent Files" },
	["<leader>fg"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep Through Files" },

	["<leader>o"]  =  { name = "open" },
	["<leader>op"] = { "<cmd>NvimTreeToggle<cr>", "Toggle File Tree" },
	["<leader>op"] = { "<cmd>terminal<cr>", "Open Terminal Buffer" },
	["<leader>om"] = { "<cmd>lua require('telescope.builtin').tags()<cr>", "Tags Search" },

	["<leader>h"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
	["<leader>."] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
	["<leader>,"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find Buffers" },
	["<leader>x"] = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Execute Command" },
	["<leader>/"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Search Open Buffer" },
})
EOF


" Lualine Configuration
lua << EOF
require'lualine'.setup {
	options = {
		fmt = string.lower,
		theme = 'rose-pine',
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '│', right = '│'},
		section_separators = { left = ' ', right = ' '},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
				lualine_b = {'branch', 'diff', {'diagnostics', 
												sources={'coc', 'nvim_lsp'}}},
				lualine_c = {'filename'},
				lualine_x = {'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress'},
				lualine_z = {'location'}
    },
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
	--	lualine_a = {'buffers'},
	--	lualine_b = {},
	--	lualine_c = {},
	--	lualine_x = {},
	--	lualine_y = {},
	--	lualine_z = {'tabs'},
	},
	extensions = {},
}
EOF

" Gitsigns Configuration
lua << EOF
require('gitsigns').setup()
EOF

" Which-Key Configuration
lua << EOF
	require("which-key").setup {
		
	}
EOF

" File Tree Configuration
lua << EOF
require'nvim-tree'.setup {
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {},
	auto_close          = false,
	open_on_tab         = false,
	hijack_cursor       = false,
	update_cwd          = false,
	update_to_buf_dir   = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	update_focused_file = {
		enable      = false,
		update_cwd  = false,
		ignore_list = {}
	},
	system_open = {
	cmd  = nil,
	args = {}
	},
	filters = {
		dotfiles = false,
		custom = {}
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {}
		}
	}
}
EOF

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

