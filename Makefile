PYTHON ?= python3

.PHONY: sync-types sync-types-update generate lint test build

sync-types:
	$(PYTHON) scripts/sync_types.py

sync-types-update:
	$(PYTHON) scripts/sync_types.py --update-only

generate:
	$(PYTHON) scripts/generate_endpoints.py

lint:
	dart analyze

test:
	dart test

build:
	dart pub get
	dart analyze
	dart test
