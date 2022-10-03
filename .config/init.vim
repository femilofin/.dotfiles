source ~/.config/nvim/plugins.vim

" Section General {{{

" auto reload config
augroup myvimrchooks
    au!
    autocmd bufwritepost init.vim source ~/.config/nvim/init.vim
augroup END

set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=150

" Persist undo
set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir
" }}}

" Section User Interface {{{

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Q should quit vim too
command! Q q

" remove whitespace
nmap <C-q> :StripWhitespace<cr>
syntax on
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

set encoding=utf8

" enable 24 bit color support if supported
" if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
" endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  let g:onedark_terminal_italics=1
  let g:onedark_hide_endofbuffer=1
  source ~/.vimrc_background
else
  let g:onedark_termcolors=16
  let g:onedark_terminal_italics=1
  let g:onedark_hide_endofbuffer=1

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
set autowrite               " go build doesn't require the file saved first
set updatetime=100          " update status line faster

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink
set shiftwidth=2            " Indent by 2 spaces when using >>, <<, == etc.
" set list
" set listchars=tab:>-        " expose tab

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

" keep visual mode on during indentation
vnoremap < <gv
vnoremap > >gv

" Enable folding with the spacebar
nnoremap <space> za

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
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
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
let g:hardtime_default_on = 0
let g:hardtime_allow_different_key = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]

" nerdtree options
""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>f :NERDTreeToggle<CR>
map <silent> <leader>d :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
let g:webdevicons_conceal_nerdtree_brackets = 1
" let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }

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

" Suggestions from https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nmap <Leader>bf :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>s :BLines<CR>
nmap <Leader>l :Lines<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>m :Maps<CR>
nmap <Leader>x :Filetypes<CR>

" close quickfix window
nmap [] :cclose<CR>
nmap ][ :pclose<CR>
nmap ][] :lclose<CR>

" ale
""""""""""""""""""""""""""""""""""""""""
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_linters_explicit = 1
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\   'Dockerfile': ['hadolint'],
\   'cloudformation': ['cfn-python-lint'],
\   'terraform': ['terraform'],
\   'sh': ['shfmt'],
\   'python': ['autopep8', 'reorder-python-imports'],
\   'go': ['golint'],
\   'json': ['jsonlint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cloudformation': ['cfn-python-lint'],
\   'sh': ['shfmt'],
\   'python': ['autopep8', 'reorder-python-imports'],
\   'go': ['gofmt'],
\   'json': ['prettier'],
\}
let g:ale_fix_on_save = 1

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
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*' "terraform
call deoplete#initialize()
" }}}

"" vim-lsp
"""""""""""""""""""""""""""""""""""""""""
"if executable('docker-langserver')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'docker-langserver',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
"        \ 'whitelist': ['dockerfile'],
"        \ })

" vim-shfmt
let g:shfmt_fmt_on_save = 1

" vim commentary
autocmd FileType tf setlocal commentstring=#\ %s
"endif
"

" python mode
let g:pymode_python = 'python3'
let g:pymode_warnings = 1
let g:pymode_lint_on_fly = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'

" undotree
nmap <Leader>u :UndotreeToggle<cr>

" vim-go
let $GOPATH = "/Users/Oluwafemi/go"
let g:go_bin_path = $GOPATH."/bin"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"


let g:mkdp_browser = 'google chrome'

" Jenkinsfile VIM syntax highlighting
" au BufNewFile,BufRead Jenkinsfile setf groovy

nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0
