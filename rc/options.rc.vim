" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

"" Default indent settings.
"" If want to change according to filetype, edit dein_filetyle.toml.
" Smart tab setting.
set smarttab
" Exchange tab to space.
set expandtab
" Autoindent width
set shiftwidth=4
" Round indent by shiftwidth.
set shiftround

" Enable smart indent
set autoindent smartindent
 
" Show candidate
set nowildmenu
set wildmode=list:longest,full

" Show line number
set number

" Clipboard
set clipboard+=unnamedplus

" Not change window size when split or delete other window.
set noequalalways

" Delete tailing blanks.
autocmd BufWritePre * :%s/\s\+$//ge
