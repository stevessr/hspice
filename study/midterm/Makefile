PYTHON ?= python3
TYPST ?= typst

.PHONY: all sync pdf check clean
all: sync pdf
sync:
	$(PYTHON) scripts/sync_typst.py
pdf:
	mkdir -p build
	$(TYPST) compile main.typ build/midterm-review.pdf
check:
	$(PYTHON) scripts/sync_typst.py
	git diff --exit-code -- typst/
clean:
	rm -rf build
