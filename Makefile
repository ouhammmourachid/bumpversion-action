
# variables
POETRY_RUN		:= poetry run
PRE_COMMIT_CMD		:= $(POETRY_RUN) pre-commit

.PHONY: install
install:
	poetry install

.PHONY: update
update:
	poetry update

.PHONY: install-pre-commit
install-pre-commit:
	$(PRE_COMMIT_CMD) uninstall && $(PRE_COMMIT_CMD) install

.PHONY: lint
lint:
	$(PRE_COMMIT_CMD) run --all-files



.PHONY: bumpversion
bumpversion:
	$(eval name=$(filter-out $@,$(MAKECMDGOALS)))
	$(POETRY_RUN) bumpver update --$(name)
%:
	@:

.PHONY: help
help:
	@echo "run 'make <target>' where <target> is one of the following:"
	@echo ""
	@echo "  install           		install dependencies"
	@echo "  update            		update dependencies"
	@echo ""
	@echo "  install-pre-commit 		install pre-commit hooks"
	@echo "  lint              		run linters"
	@echo "  help              		show this help message"
	@echo ""