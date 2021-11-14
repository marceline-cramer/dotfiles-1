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
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
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
		--opt = true, 
		--cmd = {'Vista', 'Vista!', 'Vista!!'},
		--config = function()
		--	vim.g.vista_sidebar_position = 'vertical topleft'
		--end
	}

	-- Keybind Viewer: whick-key.nvim
	use {
		'folke/which-key.nvim',
		--config = function()
		--	require('which-key').setup {
		--		
		--	}
		--end
	}

	-- Git Indicators: gitsigns.nvim
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()  -- Is this even getting called now? Plugin suddenly stopped displaying anything.
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
		config = function()
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
	use {'gko/vim-coloresque'}

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
		config = 'vim.cmd[[let g:coc_global_extensions = ["coc-json", "coc-rust-analyzer", "coc-vimtex", "coc-java"]]]'
	}

	-- Writing Mode: goyo.vim
	use {'junegunn/goyo.vim', opt = true, cmd = 'Goyo'}


	
	--- LaTeX
	
	-- Better LaTeX Support: VimTeX
	use {
		'lervag/vimtex',
		opt = true,
		ft = {'tex'}  -- Packer won't lazy load this anymore.
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
		--config = function()  -- Doing things here does not work
		--	vim.g.rose_pine_variant = 'base'
		--	vim.g.rose_pine_disable_background = 1
		--	vim.cmd('colorscheme rose-pine')
		--end
	})


end)

