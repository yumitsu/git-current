
INSTALL_DIR ?= $(HOME)
INSTALL_BIN_DIR ?= $(INSTALL_DIR)
TARGET_BIN_FILE = $(INSTALL_BIN_DIR)/gitcwb
TARGET_ALIAS_FILE = $(INSTALL_DIR)/.git-current
BUILD_DIR = $(PWD)/build
SCRIPT_SRC_FILE = $(PWD)/git-cwb.sh
ALIAS_SRC_FILE = $(PWD)/git-current
ALIAS_BUILT_FILE = $(PWD)/.git-current
GITCONFIG_INCLUDE_CMD = git config --global --add include.path '$(TARGET_ALIAS_FILE)'
GITCONFIG_UNINSTALL_CMD = git config --global --unset include.path '$(INSTALL_DIR)'

all: clean alias install

clean:
	rm -f $(ALIAS_BUILT_FILE)

alias:
	cat $(ALIAS_SRC_FILE) | sed -e 's^gitcwb^git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null^' > $(ALIAS_BUILT_FILE)	

install: clean alias
	cp -r $(ALIAS_BUILT_FILE) $(TARGET_ALIAS_FILE)
	$(GITCONFIG_INCLUDE_CMD)

uninstall:
	rm -f $(TARGET_ALIAS_FILE)
	$(GITCONFIG_UNINSTALL_CMD)
