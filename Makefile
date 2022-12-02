.PHONY: fmt
fmt:
	@terraform fmt -recursive

.PHONY: lint
lint:
	@terraform fmt -recursive -check && \
	terraform validate
