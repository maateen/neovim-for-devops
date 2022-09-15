"----------Plugins----------"
" Specify a directory for plugins
call plug#begin()

" Make sure you use single quotes
Plug 'shaunsingh/solarized.nvim'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment smartly
Plug 'terrortylor/nvim-comment'

" On-demand loading
Plug 'airblade/vim-gitgutter', {'on':'GitGutterEnable'}
Plug 'junegunn/goyo.vim', {'on':'Goyo'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua', {'on':['NvimTreeOpen','NvimTreeToggle','NvimTreeFindFile','NvimTreeFocus']}
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'ekalinin/Dockerfile.vim', {'for':'dockerfile'}
Plug 'fatih/vim-go', {'for':'go'}
Plug 'plasticboy/vim-markdown', {'for':['markdown','md']}
Plug 'chr4/nginx.vim', {'for':'nginx'}
Plug 'hashivim/vim-terraform', {'for':['hcl','terraform','tf']}
Plug 'cespare/vim-toml', {'for':'toml'}
Plug 'hashivim/vim-vagrant', {'for':['vagrant','Vagrantfile']}
Plug 'stephpy/vim-yaml', {'for':['yaml', 'yml']}

call plug#end()

"----------Theme-----------"
colorscheme solarized

"----------Basic configs----------"
retab
syntax on
filetype on
filetype plugin indent on
set t_Co=256
set background=light
set number
set nobackup
set nocompatible
set cursorline
set encoding=UTF-8
set ruler
set showmatch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autowriteall
set autoindent
set visualbell
set smartindent
set fileformat=unix
set backspace=indent,eol,start
set complete=.,w,b,u
set updatetime=100
set hlsearch
set incsearch

"----------Status Line--------------"
set statusline=
set statusline+=\ %Y\ %F\ %M\ %R
set statusline+=%=
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

"----------Plugins Configs----------"
let g:goyo_width='100%'
let g:goyo_height='100%'
let g:vim_markdown_folding_disabled=1
let g:hcl_align=1
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"----------Shortcuts----------"
let mapleader = ','

" Toggle IDE mode in Neovim
nmap <C-i> :GitGutterEnable<cr>:NvimTreeFindFile<cr>

" Toggle GitGutter
nmap <C-g> :GitGutterEnable<cr>

" Toggle Fullscreen mode
nmap <C-f> :Goyo<cr>

" Toggle Terminal below current tab
nmap <C-d> :ToggleTerm<cr>

" make NvimTree easier
nmap <C-t> :NvimTreeToggle<cr>
nmap <C-n> :NvimTreeFindFile<cr>

" Source Lua Configs
lua <<EOF
require("toggleterm").setup({
    shade_terminals = false
})

require'nvim-web-devicons'.setup {
    default = true;
}

require('nvim_comment').setup({
    marker_padding = true,
    comment_empty = false,
    comment_empty_trim_whitespace = true,
    create_mappings = true,
    line_mapping = "gcc",
    operator_mapping = "gc",
    comment_chunk_text_object = "ic",
    hook = nil
})

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        hide_root_folder = true,
        side = "left",
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "d", action = "dir_down" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },    
})
EOF
