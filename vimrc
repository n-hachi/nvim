if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir . "," . &runtimepath


" Required:
let s:rc_dir = fnamemodify(expand('<sfile>'),':h') . '/rc'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml_file      = s:rc_dir . '/dein.toml'
  let s:toml_lazy_file = s:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml_file,     {'lazy': 0})
  call dein#load_toml(s:toml_lazy_file,{'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

function! s:source_rc(path, ...)
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = s:rc_dir . a:path
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif
endfunction


call s:source_rc('/options.rc.vim')

