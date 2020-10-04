SRCS = readme.adoc

# install gems if not found
ifeq ($(shell find . -name vendor | wc -l), 0)
$(info installing gems...)
$(shell bundler install > /dev/null)
endif

# include goals
TOOLS_DIR = $(shell bundler info asciidoctor-tools | grep "Path" | sed -e 's/Path://')
include $(TOOLS_DIR)/Makefile.inc
