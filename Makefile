.PHONY: sha256

GITHUB_REPO := funkygao/federate

sha256:
	@echo "Fetching latest release information..."
	$(eval RELEASE := $(shell curl -sI https://github.com/funkygao/federate/releases/latest | grep -i 'location:' | sed -n 's/.*\/tag\/v\(.*\)/\1/p' | tr -d '\r'))
	@echo "Latest release: $(RELEASE)"
	@if [ -z "$(RELEASE)" ]; then echo "Error: Unable to determine latest release version"; exit 1; fi
	@curl -sL https://github.com/funkygao/federate/archive/refs/tags/v$(RELEASE).tar.gz | shasum -a 256
