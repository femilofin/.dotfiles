execute pathogen#infect()
syntax on
filetype plugin indent on

set backspace=indent,eol,start
set showmode "Show current mode down the bottom

" Close NERDTree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>

" NERDTree Start if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Fix whitespace errors
map <C-q> :FixWhitespace<CR>

" Indent on startup
let g:indent_guides_enable_on_vim_startup = 1

" Add time to airline statusline
let g:airline_section_c = '%{strftime("%c")}'

" Show line number
map <C-1> :set number<CR>

" Hide line number
map <C-0> :set nonumber<CR>

" Indent by 2 spaces when using >>, <<, == etc.
set shiftwidth=2

" Allow saving of files as sudo when I forget to start vim using sudo
cmap w!! :w !sudo tee > /dev/null %

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make python pretty
let python_highlight_all=1
syntax on

" UTF8 support
set encoding=utf-8

" Use system clipboard
set clipboard=unnamed

" Compile golang code
map <leader>b :GoBuild<CR>

" Execute current file
map <C-M> :GoRun<CR>

" Map numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Change number color
highlight LineNr ctermfg=grey

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500
