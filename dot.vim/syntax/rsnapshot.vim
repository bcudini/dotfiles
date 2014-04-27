" Vim syntax file
" Language:	highlighting for rsnapshot config files
" Maintainer:	Bruno Cudini <bruno+vim@cudini.fr>
" Last Change:	2012 Dec 21

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

" no spaces in this file
syn match	rsnapshotSpaces		"^[^#]\+ [^#]\+$"
"syn match	rsnapshotSpaces		"  "

syn keyword	rsnapshotTodo	contained TODO FIXME XXX
syn keyword	rsnapshotFile	cmd_rsync cmd_ssh cmd_cp cmd_rm cmd_logger cmd_du cmd_rsnapshot_diff cmd_preexec cmd_postexec
syn keyword	rsnapshotFile	logfile lockfile include_file exclude_file nextgroup=rsnapshotFilePath skipwhite
syn keyword	rsnapshotDirectory	snapshot_root include_conf linux_lvm_vgpath linux_lvm_mountpath nextgroup=rsnapshotFilePath skipwhite
syn keyword	rsnapshotRetain		interval retain nextgroup=rsnapshotInterval skipwhite
syn keyword	rsnapshotInterval	hourly daily weekly monthly nextgroup=rsnapshotNumber skipwhite

"syn keyword	rsnapshotIntegers	config_version link_dest sync_first verbose loglevel stop_on_stale_lockfile one_fs use_lazy_deletes nextgroup=rsnapshotNumber skipwhite
syn keyword	rsnapshotIntegers	config_version link_dest sync_first verbose loglevel stop_on_stale_lockfile one_fs use_lazy_deletes nextgroup=rsnapshotNumber nextgroup=rsnapshotDirPath

" Avoid matching "text#text", used in /etc/disktab and /etc/gettytab
syn match	rsnapshotComment	"^#.*" contains=rsnapshotTodo
syn match	rsnapshotComment	"\s#.*"ms=s+1 contains=rsnapshotTodo

syn match	rsnapshotFilePath	"/[^ ]*[^/]$"
syn match	rsnapshotDirPath	"/[^ ]*/$"

syn match	rsnapshotNumber		"\d\+"

syn region	rsnapshotString	start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syn region	rsnapshotString	start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link rsnapshotComment	Comment
hi def link rsnapshotSpaces	ErrorMsg

" Defining the interval to retain
hi def link rsnapshotRetain	Statement
hi def link rsnapshotInterval	Type

hi def link rsnapshotFile	Statement
hi def link rsnapshotIntegers	Statement
hi def link rsnapshotTodo	Todo
hi def link rsnapshotNumber	Number
hi def link rsnapshotFilePath	String
hi def link rsnapshotString	String

let b:current_syntax = "rsnapshot"

" vim: ts=8 sw=2
