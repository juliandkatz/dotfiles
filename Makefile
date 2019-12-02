stow:
	./stow-all.sh

check:
	./check-exists.sh

setup: stow check

.PHONY: \
	stow
