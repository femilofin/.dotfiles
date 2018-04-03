source ~/.config/nvim/plugins.vim

" Section General {{{

" auto reload config
augroup myvimrchooks
    au!
    autocmd bufwritepost init.vim source ~/.config/nvim/init.vim
augroup END

set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

" }}}

" Section User Interface {{{

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" remove whitespace
nmap <C-q> :StripWhitespace<cr>
syntax on
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
" if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
" endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
	let g:onedark_termcolors=16
	let g:onedark_terminal_italics=1

	colorscheme onedark
endif

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

" make backspace behave in a sane manner
set backspace=indent,eol,start

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldlevelstart=99
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
	set mouse=a
endif

" clear highlight after search
nnoremap <esc> :noh<return><esc>

" }}}

" Section Mappings {{{

" set a map leader for more key combos
let mapleader = ';'

" edit ~/.config/nvim/init.vim
map <leader>ev :e! ~/.config/nvim/init.vim<cr>

" easy navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" shortcut to save
nmap <leader>; :w<cr>

" }}}

" Section Plugins {{{

" airline options
"""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if tabs are being used (more than 1 tab open)
let g:airline#extensions#tabline#show_buffers = 0 " do not show open buffers in tabline
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#whitespace#enabled = 0

" hardtime options
""""""""""""""""""""""""""""""""""""""""
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]

" nerdtree options
""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>f :NERDTreeToggle<CR>
map <silent> <leader>F :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1

" FZF
""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

" ale
""""""""""""""""""""""""""""""""""""""""
let g:ale_change_sign_column_color = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" vim fugitive
""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" deoplete
""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" }}}
