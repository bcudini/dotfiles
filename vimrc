set nocompatible
set confirm

set linebreak

" highlight ugly trailing whitespaces
highlight TrailWhitespace ctermbg=red guibg=red
match TrailWhitespace  /\v\s+(%#)@<!$/
match TrailWhitespace  /\v\s+(%#)@<!$/

let mapleader=" "

nnoremap <silent> <Leader><Space> :nohlsearch<Bar>:echo<CR>
"set pastetoggle=<Leader>p


set completeopt=longest

set splitright
set splitbelow

" Coloration syntaxique
syn enable
set background=dark

" Affiche les commandes au fur et à mesure qu'on les tape
set showcmd

" Surligne les recherches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Affiche les possibilités de complétion dans la barre de statut
set wildmenu

fun! <SID>SetStatusLine()
	let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
	let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding}]"
	let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
	execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
set laststatus=2
hi StatusLine ctermfg=blue
hi StatusLine ctermbg=white
call <SID>SetStatusLine()

" Don't save backups of *.gpg files
set backupskip+=*.gpg

" donner des droits d'exécution si le fichier commence par #!
function! ModeChange()
	if getline(1) =~ "^#!"
		silent !chmod a+x <afile>
	endif
endfunction

au BufWritePost * call ModeChange()

" Toujours laisser des lignes visibles (ici 3) au dessus/en dessous
" du curseur quand on atteint le début ou la fin de l'écran :
set scrolloff=3

" shebang automatique lors de l'ouverture nouveau
" d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/sh\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\"|1put=\"# -*- coding: UTF8 -*-\<nl>\<nl>\"|$
autocmd BufNewFile *.c 0put=\"#include <stdio.h>\"|1put=\"#include <stdlib.h>\<nl>\"|3put=\"int main(int argc, char* argv[]) {\<nl>	\<nl>}\"|$

set modeline
set modelines=5
set completeopt=longest
set wildmode=longest,list,full


" I'm assuming I'm the only vim user with a 256-colors terminal
if ($TERM == "xterm-256color")
	set t_Co=256
	" remap intelligent des flèches
	noremap <Up> <C-Y>
	noremap <Down> <C-E>

	" pour sortir du mode insert facilement
	inoremap kj <Esc>
endif


runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

