-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- vim: set noet ts=2 sw=2:
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Status Line: Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require'lualine'.setup {
				options = {
					fmt = string.lower,
					theme = 'rose-pine',
					icons_enabled = true,
					--theme = 'auto',
					component_separators = { left = '│', right = '│'},
					section_separators = { left = ' ', right = ' '},
					disabled_filetypes = {},
					always_divide_middle = true,
				},
				sections = {lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end}},
										lualine_b = {'branch', 'diff', {'diagnostic',
																										sources={'coc', 'nvim_diagnostic'}}},
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
		end
	}

	-- Tab Bar: Barbar
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
	
	-- File Tree: nvim-tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()  -- Nothing configured in here actually works.
			require'nvim-tree'.setup {
				disable_netrw				= true,
				hijack_netrw				= true,
				open_on_setup				= false,
				ignore_ft_on_setup	= {},
				auto_close					= false,
				open_on_tab					= false,
				hijack_cursor				= false,
				update_cwd					= false,
				update_to_buf_dir		= {
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
					enable			= false,
					update_cwd	= false,
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
					side = 'right',
					auto_resize = false,
					mappings = {
						custom_only = false,
						list = {}
					}
				}
			}

		end
	}

	-- File Browser: vinegar.vim
	use {'tpope/vim-vinegar'}

	-- Symbol Pane: vista.vim
	use {
		'liuchengxu/vista.vim', 
		opt = true, 
		cmd = {'Vista', 'Vista!', 'Vista!!'},
		--config = function()
		--	vim.g.vista_sidebar_position = 'vertical topleft'
		--end
	}

	-- Keybind Viewer: whick-key.nvim
	use {
		'folke/which-key.nvim',
		config = function()
			require('which-key').setup {
				
			}
		end
	}

	-- Git Indicators: gitsigns.nvim
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup {
			  signs = {
			    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
			    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
			    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
			    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
			    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
			  },
			  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
			  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
			  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
			  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
			  keymaps = {
			    -- Default keymap options
			    noremap = true,
			
			    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
			    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
			
			    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
			    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
			    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
			    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
			    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
			    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
			    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
			    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
			
			    -- Text objects
			    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
			    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
			  },
			  watch_gitdir = {
			    interval = 1000,
			    follow_files = true
			  },
			  attach_to_untracked = true,
			  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			  current_line_blame_opts = {
			    virt_text = true,
			    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			    delay = 1000,
			  },
			  current_line_blame_formatter_opts = {
			    relative_time = false
			  },
			  sign_priority = 6,
			  update_debounce = 100,
			  status_formatter = nil, -- Use default
			  max_file_length = 40000,
			  preview_config = {
			    -- Options passed to nvim_open_win
			    border = 'single',
			    style = 'minimal',
			    relative = 'cursor',
			    row = 0,
			    col = 1
			  },
			  yadm = {
			    enable = false
			  },
			}
		end
	}

	-- Better Buffer Closing: vim-bufkill
	use 'qpkorr/vim-bufkill'

	-- Treesitter Integration: nvim-treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
			highlight = {
				enable = true,
				custom_captures = {
					-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
					["foo.bar"] = "Identifier",
				},
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
	end
	}
	
	-- Fuzzy Finder: telescope.nvim
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()  -- Nothing here is actually applied.
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
					entry_prefix = "	",
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
					generic_sorter =	require'telescope.sorters'.get_generic_fuzzy_sorter,
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
		end
	}
	
	-- Color Previews: vim-coloreque
	--use {'gko/vim-coloresque'}  -- Handled by coc-highlight now

	-- Smooth Scrolling: neoscroll.nvim
	use {
		'karb94/neoscroll.nvim',
		config = function()  -- Aaaaaand yet another plugin that no longer works. Is it my fault? Packer's fault? Neoscroll's fault? The world may never know.
			require('neoscroll').setup{
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
										'<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
				hide_cursor = true,					 -- Hide cursor while scrolling
				stop_eof = true,						 -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false,	 -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = cubic,				-- Default easing function
				pre_hook = nil,							 -- Function to run before the scrolling animation starts
				post_hook = nil,							-- Function to run after the scrolling animation ends
			}
		end
	}

	-- Autocompletion: coc-neovim
	use {
		'neoclide/coc.nvim',
		branch = 'release',
		run = ':CocUpdateSync',
		config = function()
			vim.cmd('let g:coc_global_extensions = ["coc-snippets", "coc-json", "coc-rust-analyzer", "coc-vimtex", "coc-java", "coc-lua", "coc-highlight", "coc-prettier"]')
		end
	}

	-- Writing Mode: goyo.vim
	use {'junegunn/goyo.vim', opt = true, cmd = 'Goyo'}


	
	--- LaTeX
	
	-- Better LaTeX Support: VimTeX
	use {
		'lervag/vimtex',
		opt = true,
		ft = {'tex'}
	}
	
	-- Live LaTeX Previews: vim-latex-live-preview
	use {
		'xuhdev/vim-latex-live-preview',
		opt = true,
		cmd = {'LLPStartPreview'},
		ft = {'tex'}  -- Or this.
	}



	--- Language Support
	
	-- TOML
	use {'cespare/vim-toml', opt = true}

	-- Rust
	use {'rust-lang/rust.vim', opt = true}

	-- RON
	use {'ron-rs/ron.vim', opt = true}

	-- GLSL
	use {'tikhomirov/vim-glsl', opt = true}



	--- Themes
	
	-- Base16 Theme Repository
	use {'chriskempson/base16-vim', opt = true}
	
	-- Amora
	use {'owozsh/amora', opt = true}

	-- Dracula Pro
	vim.cmd[[packadd dracula_pro]]

	-- Seoul256
	use {'junegunn/seoul256.vim', opt = true}

	-- Rosé Pine
	use ({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.g.rose_pine_variant = 'base'
			vim.g.rose_pine_disable_background = 1
			vim.cmd('colorscheme rose-pine')
		end
	})

	use ({
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			transparent_background = true
			term_colors = false
			styles = {
				comments = "italic",
				functions = "NONE",
				keywords = "NONE",
				strings = "NONE",
				variables = "NONE",
			}
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = "italic",
						hints = "italic",
						warnings = "italic",
						information = "italic",
					},
					underlines = {
						errors = "underline",
						hints = "underline",
						warnings = "underline",
						information = "underline",
					},
				},
				lsp_trouble = false,
				cmp = true,
				lsp_saga = false,
				gitgutter = false,
				gitsigns = true,
				telescope = true,
				nvimtree = {
					enabled = true,
					show_root = false,
				},
				which_key = false,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				dashboard = true,
				neogit = false,
				vim_sneak = false,
				fern = false,
				barbar = false,
				bufferline = true,
				markdown = true,
				lightspeed = false,
				ts_rainbow = false,
				hop = false,
				notify = true,
				telekasten = true,
			}
		end
	})

end)

