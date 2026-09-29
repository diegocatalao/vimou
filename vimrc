" my default favorite colorscheme from vim
set termguicolors
packadd! dracula                      " start packages load after vimrc, so load it now
try | colorscheme dracula | catch | colorscheme slate | endtry

" create vim directories if missing
for s:dir in [$HOME . '/.vim/swp', $HOME . '/.vim/undo']
  if !isdirectory(s:dir) | call mkdir(s:dir, 'p') | endif
endfor

" swap
set swapfile
set directory=$HOME/.vim/swp//        " // appends full path to avoid name collisions

" set ruler size of black gray in 80cc
set colorcolumn=100                   " by default the column must be 100 becuse i like it
highlight ColorColumn guibg=#44475a   " set the line ruler's color column

" visual behavior
set number                            " show absolute line numbers
set relativenumber                    " show relative line numbers (easier to count jumps)
set cursorline                        " highlight the current line
set scrolloff=8                       " keep 8 lines visible above/below cursor when scrolling
set wrap                              " wrap long lines visually
syntax on                             " enable syntax highlighting

" search
set hlsearch                          " highlight all search matches
set incsearch                         " jump to matches while typing the search
set ignorecase                        " case-insensitive search
set smartcase                         " override ignorecase when query has uppercase letters

" behavior
set hidden                            " allow switching buffers without saving
set undofile                          " persist undo history across sessions
set undodir=~/.vim/undo               " the undo folder inside the vim folder, gitkeep inside

" ux
set backspace=indent,eol,start        " allow backspace over indentation, line breaks, and
                                      " pre-insert text
set clipboard=unnamed                 " sync with system clipboard
set mouse=a                           " enable mouse in all modes
set ttymouse=sgr                      " tmux TERM makes vim pick 'xterm', which ignores drags
set wildmenu                          " show completion menu on the command line

" by default, the tabspace is 2 for every language
set tabstop=2                         " width of a tab character
set softtabstop=2                     " use backspace to remove tab not space
set shiftwidth=2                      " width used for >> indentation
set expandtab                         " insert spaces instead of tabs

" performance
set lazyredraw                        " skip redraws during macros
set updatetime=300                    " reduce delay for events like autocmd

" session configuration and autorestart
function! s:RestoreSession()
  if filereadable(expand('~/.vim/session.vim'))
    source ~/.vim/session.vim
  endif
endfunction

augroup vimrc
  autocmd!
  " strip trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " save session on exit
  autocmd VimLeave * mksession! ~/.vim/session.vim

  " skip restore when a file is passed as argument
  autocmd VimEnter * if argc() == 0 | call s:RestoreSession() | endif

  " column ruler is visual noise in file explorer
  autocmd FileType netrw setlocal colorcolumn=
augroup END
