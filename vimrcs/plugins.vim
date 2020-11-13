let s:vim_runtime = expand('<sfile>:p:h')."/.."
call plug#begin(s:vim_runtime.'/bundles/')

" program language
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-git coc-lists coc-pairs coc-yank coc-highlight coc-snippets coc-json coc-html coc-tsserver coc-css coc-python coc-vetur coc-eslint'}


" markdown
Plug 'plasticboy/vim-markdown'

" Search Plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git Plugins
Plug 'tpope/vim-rhubarb'

" Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'kshenoy/vim-signature'

" Quick Move and Select
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'kana/vim-textobj-function'
Plug 'godlygeek/tabular'

" Program utilities
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'yggdroot/indentline', { 'for': 'python' }
Plug 'psf/black', { 'for': 'python' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'shougo/vimshell.vim'
Plug 'tpope/vim-unimpaired'
Plug 'dbgx/lldb.nvim'

call plug#end()
