
lint:
	pre-commit run --all-files
	ansible-lint
.PHONY: lint

facts-%:
	ansible $* -m ansible.builtin.setup
.PHONY: facts-%
