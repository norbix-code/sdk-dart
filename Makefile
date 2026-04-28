PYTHON ?= python3

.PHONY: gen lint test build

gen:
	$(PYTHON) tool/generate_resources.py

lint:
	dart analyze

test:
	dart test packages/norbix_core
	dart test packages/norbix_api
	dart test packages/norbix_hub

build:
	dart pub get
	dart analyze
	$(MAKE) test
