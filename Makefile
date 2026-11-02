SHELL := /bin/bash
.PHONY: check smoke
check: smoke

smoke:
	bash -n install.sh scripts/bootstrap.sh scripts/workstation/* tests/*.sh
	bash tests/smoke.sh
