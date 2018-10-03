
" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'takac/vim-hardtime'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'w0rp/ale' " Asynchonous linting engine
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " go support
Plug 'myusuf3/numbers.vim' " intelligently toggling line numbers
Plug 'ntpeters/vim-better-whitespace' " show and strip white space
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered asynchronous completion framework
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'prabirshrestha/async.vim' | Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-obsession' " continuously updated session filecontinuously updated session filess
Plug 'python-mode/python-mode', { 'branch': 'develop' } " python ide
Plug 'mbbill/undotree' "the ultimate undo history visualizer
Plug 'andrewstuart/vim-kubernetes' " integration with kubernetes
" Plug '907th/vim-auto-save' " autosave to disk
Plug 'farmergreg/vim-lastplace' " Intelligently reopen files at your last edit position in Vim
Plug 'chr4/nginx.vim' " nginx syntax highlight
Plug 'SirVer/ultisnips' " ultimate snippet solution for Vim
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'Yggdroot/indentLine'


call plug#end()

