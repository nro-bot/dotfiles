"START_ -------------------------------
"o
" Set up Vundle and packages
" (ALE linting, autofix; completor for autocomplete; adding more themes)
" -------------------------------

filetype off                  " required

" ---- Vundle ----
"  set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'                  "for latex; shortcuts: https://github.com/lervag/vimtex


" -- Colors
"Plugin 'nikvdp/ejs-syntax'              "javascript syntax highlighting
"Plugin 'sentientmachine/Pretty-Vim-Python' "better syntax highlighting (e.g. molokai)
Plugin 'rafi/awesome-vim-colorschemes'


" -- Python coloring
Plugin 'xolox/vim-easytags' "Better 'goto-definition'
Plugin 'xolox/vim-misc' "Required for easytags
Plugin 'vim-python/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'  "better pip8 indenting (for long arguments)


" -- Improve vim
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin '907th/vim-auto-save'
Plugin 'camelcasemotion' "w e navigate underscores better
"Plugin 'skywind3000/asyncrun.vim'  "run python file
"Plugin 'trotter/autojump.vim'


" -- Vim visual aids
Plugin 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plugin 'markonm/traces.vim' "Range, pattern and substitute preview for Vim


" -- Typo helpers
"Plugin 'vim-syntastic/syntastic' "PEP8 checks
Plugin 'w0rp/ale' "requires pip install black, pip install pylint, flake8
Plugin 'maralla/completor.vim'   "autocomplete - make sure to run 'pip install jedi'
" MUST tell completor local python library, e.g. in the virtualenv, for context
" of python installed library functions to appear




" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" -------------------------------
"  END Vundle
" -------------------------------


" Put your non-Plugin stuff after this line
" -------------------------------
" Allow moving between splits easier
" NOTE: doesn't work, not sure why
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-H> <C-W>h<C-W>
map <C-L> <C-W>l<C-W>


" -------------------------------
nmap , :
" attempt to make paragraph move not require shift; works on *.md but not *.py
"nmap [ {
"nmap ] }
nmap - {
nmap = }

command WQ wq
command Wq wq
command W w
command Q qa

" -------  Completor
let g:completor_python_binary = '~/v3/bin/python'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" -------------------------------
" Set preferences for python
syntax on
filetype indent plugin on


set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent


set wrap
set textwidth=80
set colorcolumn=80 " display line at textwidth


" -------------------------------
" Colorscheme
"colorscheme desert
"colorscheme molokai
colorscheme gruvbox
"colorscheme OceanicNext
"colorscheme happy_hacking
set background=dark

let &t_Co = 256 " terminal colors -- fix colorscheme issues


let mapleader=","
set nu
set mouse=a " allow middleclick paste

imap jk <Esc>

"nnoremap ,o :!pdflatex %<CR>
nnoremap ,t :tabedit
nnoremap ,s :tabedit ~/.vimrc<CR> " vim settings
nnoremap ,v :vsplit
nnoremap ,l :lclose " close location window (where ALE displays errors)
nnoremap ,o :colorscheme
nnoremap ,m :mksession! ~/session.vim
nnoremap ,r :source ~/session.vim

map <Leader>n :NERDTreeToggle<CR>

"set iskeyword-=_ " DONT DO THIS messes with syntax highlighting; use camelcaseplugin
highlight Comment cterm=bold
" -------------------------------


" -------------------------------
" Fold settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2


" -------------------------------
" Statusline
" -------------------------------
hi StatusLine ctermbg=red ctermfg=black
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline+=%{g:Catium()}
set laststatus=2 "put statusline two lines up


let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
hi StatusLine ctermbg=blue ctermfg=black

" -------------------------------
" let the tab at the top reflect the current file being edited
let &titlestring = @%
set title

" -------------------------------
set nohlsearch
hi Search guibg=LightBlue
" making it possible to see cursor when highlighting matching parenthesis
"hi MatchParen cterm=bold ctermbg=none ctermfg=none
" NOTE show whitespace with :set list


" -------------------------------
" LATEX automatically create equation environment. Used in inesrt mode
autocmd FileType tex    map!;b <ESC>bywi\begin{<ESC>ea}<CR>\end{}<ESC>PO
autocmd FileType tex    map!;m \begin{align}<Return>\end{align}<ESC>O
autocmd FileType tex    map!;a \begin{answer}<Return>\end{answer}<ESC>O


" \ll in normal mode to get
" \lv
" vim --servername vim test.tex
" ci} {asdf}
" cit <h2></h2>
" dac \boldface\mu ->  \mu (command)
" cse  change surrounding environment

" -------------------------------
let g:auto_save = 0
let g:auto_save_events = []
"InsertLeave", "TextChanged", "TextChangedI", "CursorHold"]
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
" AutoSave is disabled by default, run :AutoSaveToggle to enable/disable it.
set updatetime=750

" -------------------------------
" Execute python file with vim keyboard shortcut
" Bind F5 to save file if modified and execute python script in a buffer.
"nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
"vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
"nnoremap ,p :w<CR>:!clear;python %<CR>
nnoremap ,p :call <SID>compile_and_run()<CR>
" nnoremap ,e :!python %<cr>
" botright vertical pedit.



let g:asyncrun_open = 5 "open qf iwindow at 5 line height
augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    "autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
    "autocmd User AsnycRunPre vertical right
    "autocmd User AsyncRunStart vertical botright
    "autocmd User AsyncRunStop wincmd H
    "autocmd User AsyncRunStop wincmd R
    "autocmd User AsyncRunStop wincmd R
    "
    "
    "function! OpenErrors(job_id, data, event)
"    " Store the original window number
    "let l:winnr = winnr()

    "" Open a window to show the current list of errors

    "" If focus changed, jump to the last window
    "if l:winnr !=# winnr()
        "wincmd p
    "endif
"endfunction
    silent! autocmd User AsyncRunPre copen
    "autocmd User AsyncRunPre exec "resize 200"
    autocmd User AsyncRunStop call RestorePreviewWindowHeight()
    "autocmd User AsyncRunStop exec "resize 200"
    autocmd User AsyncRunStop wincmd L
    autocmd User AsyncRunStop wincmd w
    ":echo filter(getwininfo(), 'v:val.quickfix && !v:val.loclist')
augroup END
augroup vimrc
    "autocmd QuickFixCmdPost * botright copen 8
augroup END

function! RestorePreviewWindowHeight()
    " https://stackoverflow.com/questions/13707052/quickfix-preview-window-resizing
  silent! wincmd P "jump to preview, but don't show error
  if &previewwindow
    exec "resize" &previewheight
    wincmd p "jump back
  endif
  wincmd =
endfunction


function! s:compile_and_run()
	set splitright
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
    "http://liuchengxu.org/posts/use-vim-as-a-python-ide/
endfunction


"au FileType qf wincmd L
"au FileType qf :resize 200
"au FileType qf wincmd R


" -------------------------------
" From vim -u DEFAULTS
" (https://github.com/vim/vim/blob/master/runtime/defaults.vim)

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

" -------------------------------
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" -------------------------------
" ALE Settings
" -------------------------------

" fixers: black
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': []
            \}
"'autopep8'],

":help ale-python-flake8
":help ale-integration-options
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0

let g:ale_linters = {'python': ['flake8']} ", 'pep8']}
"let g:ale_linters_ignore = ['pylint']
"
"let g:ale_python_flake8_options="--ignore=E501,F401,W601,E226,W0611,E265,E402,W504,E241"
let g:ale_python_flake8_options="--ignore=E501,F401,W601,E226,W0611,E265,E402,W504,E241 --select=F,C"
"let g:ale_python_flake8_option s= '--ignore=E,W,F403,F405 --select=F,C'
"let g:ale_python_flake8_options='--ignore=W,F' "F403,F405'
"let g:ale_type_map = {'flake8': {'ES': 'WS', 'E': 'W'}}

let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1 " list in the quickfix window, all the errors

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
"let g:ale_echo_cursor = 0 " https://github.com/w0rp/ale/issues/1470
" solve by "updateing vim from PPA

"let g:autopep8_ignore="E501,W293"

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

"'add_blank_lines_for_python_control_statements' - Add blank lines before control statements.
"'autopep8' - Fix PEP8 issues with autopep8.
"'black' - Fix PEP8 issues with black.
"'isort' - Sort Python imports with isort.
"'yapf' - Fix Python files with yapf.
"'remove_trailing_lines' - Remove all blank lines at the end of a file.
"'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.

" -- Highlighting
"let g:python_highlight_all = 1 " python-syntax module specific
let g:python_highlight_space_errors = 0 " don't highlight whitespace

" Set this in your vimrc file to disabling highlighting (0)
highlight ALEWarningSign ctermbg=DarkMagenta
highlight ALEErrorSign ctermbg=Blue
let g:ale_set_highlights = 1 " Gutter highlights

" -------------------------------
" END ALE settings
" Close location window when :q file
" -------------------------------
"  Removed
"
"
" ----- EasyTags

" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1
" Only update on save
let g:easytags_events = ['BufWritePost']
:let g:easytags_resolve_links = 1 " symbolic links
let g:easytags_suppress_report = 1 "was interfering with moving in file after write


"" ----
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e


"syn region FCall matchgroup=FName start='[[:alpha:]_]\i*\s*(' end=')' contains=FCall,FCallKeyword
"syn match FCallKeyword /\i*\ze\s*=[^=]/ contained
"hi FCallKeyword ctermfg=yellow
"hi FName ctermfg=blue
