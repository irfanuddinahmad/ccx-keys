.DEFAULT_GOAL := test

.PHONY: html_coverage quality requirements test upgrade

html_coverage:
	coverage html && open htmlcov/index.html

quality:
	uv sync --group quality
	uv run pycodestyle --config=.pep8 src/ccx_keys
	uv run pylint --rcfile=pylintrc src/ccx_keys

requirements: ## install development environment requirements
	uv sync --group dev

test:
	uv run tox

upgrade: ## update the uv.lock to use the latest releases satisfying our constraints
	uv run --with edx-lint edx_lint write_uv_constraints pyproject.toml
	uv lock --upgrade
