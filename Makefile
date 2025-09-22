DOCKER=$(or $(shell which docker), $(error "Missing dependency - no docker in PATH"))
UID_GID := $(shell id -u):$(shell id -g)
PYTHON_IMAGE=python:3

clean:
	rm -rf dist build *.egg-info

build: clean
	$(DOCKER) run --user $(UID_GID) --rm -v $(shell pwd):/mnt -e HOME=/tmp/ -w /mnt $(PYTHON_IMAGE) /bin/bash -c \
		"python -m pip install build --user && python -m build --sdist --wheel --outdir dist/"
