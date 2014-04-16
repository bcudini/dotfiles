DOTFILES := ~/dotfiles

dotDir = \
	if [ ! -h ~/.$(1)/ ]; then                                     \
		if [ -d ~/.$(1)/ ]; then                               \
			rsync -av ~/.$(1)/ $(DOTFILES)/dot.$(1)/;      \
			rm -r ~/.$(1)/;                                \
		fi;                                                    \
		ln -s $(DOTFILES)/dot.$(1)/ ~/.$(1);                   \
	fi;


install: vim bash python screen input w3m

%:
	[ -e ~/.$@rc ] || ln -P $(DOTFILES)/$@rc ~/.$@rc
	[ -e ~/.$@rc -a ~/.$@rc -ef $(DOTFILES)/$@rc ] || mv ~/.$@rc $(DOTFILES)/$@rc
	[ -e ~/.$@rc ] || ln -P $(DOTFILES)/$@rc ~/.$@rc

w3m:
	$(call dotDir,$@)

diff:
	git difftool


