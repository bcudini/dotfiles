DOTFILES := ~/dotfiles


install: screenrc inputrc diff

%:
	[ -e ~/.$@rc ] || ln -P $(DOTFILES)/$@rc ~/.$@rc
	[ -e ~/.$@rc -a ~/.$@rc -ef $(DOTFILES)/$@rc ] || mv ~/.$@rc $(DOTFILES)/$@rc
	[ -e ~/.$@rc ] || ln -P $(DOTFILES)/$@rc ~/.$@rc

diff:
	git difftool


