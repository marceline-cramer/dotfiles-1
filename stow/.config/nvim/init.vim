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
"highlight LineNr ctermfg=250 ctermbg=235	" Line number background
set mouse=a
set hidden
set nocursorline
set ts=4
set sw=4
set cmdheight=2
set timeoutlen=200
set updatetime=300
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

" Set both for smart case-insensitivity
set ignorecase
set smartcase


"source ~/.config/nvim/plugins.vim
lua require('plugins')

" Vim Theme
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors

"syntax enable  " Comment out when using Treesitter


"colorscheme dracula
"colorscheme base16-dracula
"colorscheme dracula_pro
"let g:dracula_colorterm = 0


let g:seoul256_background = 234  " Make seoul256 background less bright

"let g:mode = 'focus'
"let g:mode = 'mirtilo'
"colorscheme amora


"colorscheme catppuccin


hi Normal guibg=NONE ctermbg=NONE	" Force transparent background
hi LineNr ctermbg=NONE guibg=NONE


let g:vista_sidebar_position = 'vertical topleft'  " Must be set here instead of plugins.lua



let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'  " xelatex, pdflatex, or lualatex
let g:vimtex_grammar_texidote = {
			\ 'jar': '/opt/textidote/textidote.jar',
			\ 'args': '',
			\}


let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_options_latexmk = '--shell-escape --unique'
let g:vimtex_compiler_method = 'latexmk'



" Don't garble manpages
autocmd FileType man % !col -b


""" Coc Configurations

set shortmess+=c  " Don't pass messages to \|ins-completion-menu\|.

set signcolumn=yes  " Show sign column next to number column

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Show documentation when hovering cursor
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>


""" Coc-Snippets Configuration

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'




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

inoremap <M-C-S-Down> <C-O>:m+1<cr>
inoremap <M-C-S-Up> <C-O>:m-2<cr>


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
	["<leader>ot"] = { "<cmd>terminal<cr>", "Open Terminal Buffer" },
	--["<leader>om"] = { "<cmd>lua require('telescope.builtin').tags()<cr>", "Tags Search" },
	["<leader>om"] = { "<cmd>Vista!!<cr>", "Tags Search" },

	["<leader>h"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
	["<leader>."] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
	["<leader>,"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find Buffers" },
	["<leader>x"] = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Execute Command" },
	["<leader>/"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Search Open Buffer" },
})
EOF
