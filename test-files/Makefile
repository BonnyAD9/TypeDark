TARGET=pipe_overflow
BUILD_TYPE?=Release
PARALLEL?=-j $(shell nproc)
SOURCES=$(shell find src/ -name '*.c')
HEADERS=$(shell find src/ -name '*.h')
FILES=$(SOURCES) $(HEADERS)

.PHONY: build
build:
	if [ ! -f target/$(BUILD_TYPE)/Makefile ]; then \
		mkdir -p target/$(BUILD_TYPE); \
		cd target/$(BUILD_TYPE) \
			&& cmake ../.. -DCMAKE_BUILD_TYPE=$(BUILD_TYPE); \
	fi
	cd target/$(BUILD_TYPE) && $(MAKE) $(PARALLEL)

.PHONY: debug
debug:
	$(MAKE) BUILD_TYPE=Debug

.PHONY: release
release:
	$(MAKE) BUILD_TYPE=Release

.PHONY: fmt
fmt:
	clang-format -i $(FILES)

.PHONY: cppcheck
cppcheck:
	cppcheck --check-level=exhaustive $(FILES)

.PHONY: tidy
tidy: debug
	run-clang-tidy $(PARALLEL) -use-color -quiet -p target/Debug \
		-header-filter=src/ 'src/.*\.c' 'src/.*\.h'

.PHONY: check
check: fmt cppcheck tidy

.PHONY: clean
	-rm -rf target
