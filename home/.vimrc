set nocompatible              " be iMproved, required
syntax on
set hlsearch
set visualbell
set cmdheight=2
let NERDTreeShowLineNumbers=1
set number
set rnu
set shiftwidth=4
set textwidth=0
set softtabstop=4
set tabstop=4
set expandtab
filetype plugin indent on
filetype off                  " required
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
set pastetoggle=<F2>
set list
set listchars=tab:>-

map <Leader>t :NERDTreeToggleVCS<cr>
autocmd FileType go map <Leader>v :GoVet<cr>
autocmd FileType go map <F5> :GoDebugStart<cr>
autocmd FileType go map <F4> :GoTest<cr>
autocmd FileType go map <Leader>s :GoAlternate<cr>
map <F7> gg=G<C-o><C-o>
noremap <silent> <c-_> :let @/ = ""<CR>

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_metalinter_autosave = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
Plugin 'digitaltoad/vim-pug'
Plugin 'mattn/emmet-vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline_theme='dark'
set laststatus=2
"set statusline=%f
"set term=builtin_ansi
set noshowmode
colo slate
set expandtab
vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>
