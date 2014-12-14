BATS_DIR := /tmp/bats

build: test

test: bats
	@$(BATS_DIR)/bin/bats tests/

bats:
	@[ -d $(BATS_DIR) ] || git clone https://github.com/sstephenson/bats.git $(BATS_DIR)

clean:
	@rm -rf $(BATS_DIR)
