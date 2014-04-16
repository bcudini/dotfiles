DOTFILES := ~/dotfiles

dotDir = \
	if [ ! -h ~/.$(1)/ ]; then                                     \
		if [ -d ~/.$(1)/ ]; then                               \
			rsync -av ~/.$(1)/ $(DOTFILES)/dot.$(1)/;      \
			mv ~/.$(1)/ $(DOTFILES)/backup/;               \
		fi;                                                    \
		ln -s $(DOTFILES)/dot.$(1)/ ~/.$(1);                   \
	fi;

dotRC =                                                                \
	if ! [ ~/.$(1)rc -ef $(DOTFILES)/$(1)rc ]; then                \
		[ -e ~/.$(1)rc ] && mv ~/.$(1)rc $(DOTFILES)/$(1)rc;   \
		ln -s $(DOTFILES)/$(1)rc ~/.$(1)rc;                    \
	fi;

install: vim bash python screen input w3m mutt

%:
	$(call dotFiles,$@)


w3m:
	$(call dotDir,$@)

diff:
	git difftool


