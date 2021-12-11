let g:mapleader = " "

set hidden
set nowrap
set encoding=UTF-8
set fileencoding=UTF-8
set ruler
set cmdheight=2
set t_Co=256
set smarttab
set updatetime=300

" source
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/lsp-config.vim

luafile $HOME/.config/nvim/lua/cmp-config.lua
luafile $HOME/.config/nvim/lua/treesitter.lua

" fix terminal
autocmd TermOpen * startinsert

" relative numbers
set relativenumber

" theme settings
set termguicolors

syntax enable
colorscheme tokyonight

lua << END
require'lualine'.setup()
END

" fix tabbing
:set tabstop=4
:set shiftwidth=4
:set expandtab
let g:AutoPairsMultilineClose = 0

" IndentLine {{
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['dashboard']
" }}

" Commenting
autocmd FileType cpp setlocal commentstring=//\ %s

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Dashboard
let g:dashboard_custom_header=[
    \'',
    \'⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕',
    \'⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕',
    \'⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕',
    \'⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕',
    \'⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑',
    \'⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐',
    \'⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐',
    \'⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔',
    \'⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕',
    \'⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕',
    \'⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕',
    \'⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕',
    \'⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁',
    \'⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿',
    \'',
    \]
lua << EOF
vim.g.dashboard_custom_section = {
    b = {description = {' New File         SPC f n'}, command = 'enew'},
    a = {description = {'ﭯ History          SPC f h'}, command = 'History'},
    c = {description = {' Find File        SPC f f'}, command = 'Files'},
    d = {description = {' Change Color     SPC t c'}, command = 'Colors'},
    e = {description = {' CP Library       SPC f c'}, command = 'Files /mnt/c/Users/stephen/Documents/cp-library'}
}
EOF

" Presence
let g:presence_main_image = "file"

" Bar Bar
let bufferline = get(g:, 'bufferline', {})
set mouse+=a
let bufferline.icons = v:false

" Compile Commands
autocmd filetype cpp nnoremap <F8> :w <bar> !g++ -std=c++17 -DLOCAL %
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 -DLOCAL % <cr> :vnew <bar> :te "./a.out" <cr><cr>
autocmd filetype cpp nnoremap <F10> :vnew <bar> :te "./a.out" <cr>
autocmd filetype python nnoremap <F9> :w <bar> :te python3 %:t <cr>

" Custom Keybindings
nnoremap <C-Left> :BufferPrevious<CR>
nnoremap <C-Right> :BufferNext<CR>
nnoremap <leader>w :BufferClose<CR>
tnoremap <Esc> <C-\><C-n>
noremap <silent> <C-Up> :call smooth_scroll#up(&scroll, 10, 2) <cr>
noremap <silent> <C-Down> :call smooth_scroll#down(&scroll, 10, 2) <cr>
imap <C-q> <Esc>
vmap <C-Q> <Esc>
nnoremap <C-T> :NERDTree<CR>

" Clipboard
" set clipboard=unnamed

noremap y "+y
noremap p "+p
noremap <leader>d "+d

" Faster Commands
nnoremap <leader>ff :Files<CR>
nnoremap <leader>tc :Colors<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fn :enew<CR>
nnoremap <leader>fc :Files /mnt/c/Users/stephen/Documents/cp-library<CR>
