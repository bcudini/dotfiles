DOTFILES := ~/dotfiles


install: vim bash python screen input w3m

%:
	[ -e ~/.$@rc ] || ln -P $(DOTFILES)/$@rc ~/.$@rc
	[ -e ~/.$@rc -a ~/.$@rc -ef $(DOTFILES)/$@rc ] || mv ~/.$@rc $(DOTFILES)/$@rc
	[ -e ~/.$@rc ] || ln -P $(DOTFILES)/$@rc ~/.$@rc

w3m:
	[ -d ~/.w3m/ ] && ( rsync -a --progress ~/.w3m/ $(DOTFILES)/dot.w3m/ && rm -r ~/.w3m ) || true
	[ -L ~/.w3m/ ] || ln -s $(DOTFILES)/dot.w3m/ ~/.w3m

diff:
	git difftool


