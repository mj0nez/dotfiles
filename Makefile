
facts-%:
	ansible $* -m ansible.builtin.setup
.PHONY: facts-%


dev-local:
	uv sync
	uv run pre-commit install
.PHONY: dev-local


format:
	uv run pre-commit run --all-files
.PHOY: format
