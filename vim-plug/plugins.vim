call plug#begin('~/.config/nvim/autoload/plugged')

    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " startuptime
    Plug 'tweekmonster/startuptime.vim'

    " icons
    Plug 'ryanoasis/vim-devicons'

    " Theme
    Plug 'ayu-theme/ayu-vim'
    " Plug 'tribela/vim-transparent'
    Plug 'jacoborus/tender.vim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'folke/tokyonight.nvim'
    Plug 'catppuccin/nvim'
    Plug 'rebelot/kanagawa.nvim'

    " IndentLine
    Plug 'Yggdroot/indentLine'

    " Status line
    " Plug 'vim-airline/vim-airline'
    Plug 'nvim-lualine/lualine.nvim'

    " Smooth Scrolling
    Plug 'terryma/vim-smooth-scroll' 

    " Commenting
    Plug 'tpope/vim-commentary'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'onsails/lspkind-nvim'

    Plug 'ray-x/lsp_signature.nvim'

    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-vsnip'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Discord RPC
    " Plug 'andweeb/presence.nvim'

    " Git Stuff
    Plug 'mhinz/vim-signify'

    " Floating Terminal
    Plug 'voldikss/vim-floaterm'

call plug#end()
