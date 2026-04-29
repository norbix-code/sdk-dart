PYTHON ?= python3

.PHONY: gen lint test build

gen:
	$(PYTHON) tool/generate_resources.py

lint:
	dart analyze

test:
	dart test

build:
	dart pub get
	dart analyze
	$(MAKE) test
