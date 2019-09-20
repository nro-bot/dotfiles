" -------------------------------

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sentientmachine/Pretty-Vim-Python' "better syntax highlighting (e.g. molokai)
Plugin 'scrooloose/nerdcommenter'
Plugin 'lervag/vimtex'                  "for latex; shortcuts: https://github.com/lervag/vimtex
Plugin 'Vimjas/vim-python-pep8-indent'  "better pip8 indenting (for long arguments)
Plugin '907th/vim-auto-save'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nikvdp/ejs-syntax'              "javascript syntax highlighting
Plugin 'rafi/awesome-vim-colorschemes'

"Plugin 'vim-syntastic/syntastic' "PEP8 checks
Plugin 'maralla/completor.vim'   "autocomplete - make sure to run 'pip install jedi'
"Plugin 'nvie/vim-flake8'
Plugin 'w0rp/ale' "requires pip install black, pylint, flake8, autopep8
Plugin 'kshenoy/vim-signature' "Plugin to toggle, display and navigate marks
Plugin 'markonm/traces.vim' "Range, pattern and substitute preview for Vim
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'

" MUST tell completor local python library, e.g. in the virtualenv, for context
" of python installed library functions to appear
let g:completor_python_binary = '/home/rui/v3/lib/python3.6'
let g:completor_python_binary = '/home/rui/v3/bin/python'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'lervag/vimtex'

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

nmap , :
command WQ wq
command Wq wq
command W w
command Q qa


syntax on
filetype indent plugin on

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

"colorscheme desert
"colorscheme OceanicNext
colorscheme PaperColor
"colorscheme minimalist
highlight Comment cterm=bold
"highlight Comment cterm=bold

let mapleader=","
set nu
set mouse=a

nnoremap ,o :!pdflatex %<CR>
nnoremap ,t :tabedit
nnoremap ,v :vsplit

set wrap
set textwidth=80
set colorcolumn=80 " display line at textwidth


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"


" make a statusline
hi StatusLine ctermbg=red ctermfg=black
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2 "put statusline two lines up

" let the tab at the top reflect the current file being edited
let &titlestring = @%
set title

imap jk <Esc>


"set list
" making it possible to see cursor when highlighting matching
"hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
hi MatchParen cterm=bold ctermbg=none ctermfg=none

" NOTE show whitespace with :set list

" create abbreviations for math. when you type the space, vim will expand


" automatically create latex equation environment. Used in insert mode
autocmd FileType tex    setlocal spell spelllang=en_us
autocmd FileType tex    map!;b <ESC>bywi\begin{<ESC>ea}<CR>\end{}<ESC>PO
autocmd FileType tex    map!;m \begin{align}<Return>a &= b\\<Return>\end{align}<ESC>
autocmd FileType tex    map!;i \begin{figure}[!t]<Return>\centering<Return>\includegraphics[width=0.4\linewidth]{images/fig.png}<Return>\caption{}<Return>\label{}<Return>\end{figure}<ESC>O
"autocmd FileType tex    map!;a \begin{answer}<Return>\end{answer}<ESC>O
"
"autocmd FileType tex    map!;a \begin{align}<Return>\end{align}<ESC>O
autocmd FileType tex    map!;x \begin{bmatrix}<Return>\end{bmatrix}<ESC>O

"%\begin{figure}[!t]
"%\centering
"%\includegraphics[width=2.5in]{myfigure}
"% where an .eps filename suffix will be assumed under latex, 
"% and a .pdf suffix will be assumed for pdflatex; or what has been declared
"% via \DeclareGraphicsExtensions.
"%\caption{Simulation results for the network.}
"%\label{fig_sim}
"%\end{figure}


let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHold"]
" AutoSave is disabled by default, run :AutoSaveToggle to enable/disable it.
set updatetime=750
" \ll in normal mode to get
" \lv
" vim --servername vim test.tex
" ci} {asdf}
" cit <h2></h2>
" dac \boldface\mu ->  \mu (command)
" cse  change surrounding environment
" csc change surrounding command

" Bind F5 to save file if modified and execute python script in a buffer.
"nnoremap <silent> <F5> :call SaveAndExecutePython()<CR>
"vnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
"nnoremap ,p :w<CR>:!clear;python %<CR>
nnoremap ,p :call <SID>compile_and_run()<CR>
nnoremap ,e :!python %<cr>
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
"augroup END

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


"function! s:create_latex_ToC()
    "let @a=''
    "g/\\\(part\|chapter\|section\|subsection\|subsubsection\|paragraph\|subparagraph\)\>/y A
    "wincmd n
    "put a
    "%s/section//g
    "%s/sub/*/g
    "wincmd H "change from horizontal split, to vertical split
    "wincmd R
    "wincmd W
"endfunction

"nnoremap ,t :call <SID>create_latex_ToC()<CR>




map <Leader>n :NERDTreeToggle<CR>

set iskeyword-=_


" ------------------------------- From vim -u DEFAULTS
" (https://github.com/vim/vim/blob/master/runtime/defaults.vim)
"
" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Recommended settings for new syntastic users
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" fixers: black
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8']
            \ }
", 'black'],
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" add 24 colorsupport for themes
" "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)

let &t_Co=256

set background=dark

let g:polyglot_disabled = ['latex']
