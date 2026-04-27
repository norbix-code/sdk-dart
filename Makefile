PYTHON ?= python3

.PHONY: lint test build

lint:
	dart analyze

test:
	dart test

build:
	dart pub get
	dart analyze
	dart test
