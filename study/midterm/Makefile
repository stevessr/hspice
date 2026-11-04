PYTHON ?= python3
TYPST ?= typst
NPM ?= npm

.PHONY: all sync pdf check site dev clean
all: sync pdf
sync:
	$(PYTHON) scripts/sync_typst.py
pdf:
	mkdir -p build
	$(TYPST) compile main.typ build/midterm-review.pdf
check:
	$(PYTHON) scripts/validate.py
	$(PYTHON) scripts/sync_typst.py
	$(PYTHON) scripts/validate.py --generated
site:
	$(NPM) install --no-audit --no-fund
	$(NPM) run docs:build
dev:
	$(NPM) run docs:dev
clean:
	rm -rf build .vitepress/dist .vitepress/cache
