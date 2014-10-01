
INSTALL_DIR ?= $(HOME)/.git-current
INSTALL_BIN_DIR ?= $(INSTALL_DIR)
TARGET_BIN_FILE = $(INSTALL_BIN_DIR)/gitcwb
TARGET_ALIAS_FILE = $(INSTALL_DIR)/.aliases
BUILD_DIR = $(PWD)/build
SCRIPT_SRC_FILE = $(PWD)/git-cwb.sh
SCRIPT_BUILT_FILE = $(PWD)/gitcwb
ALIAS_SRC_FILE = $(PWD)/git-current
ALIAS_BUILT_FILE = $(PWD)/gitconfig
GITCONFIG_INCLUDE_CMD = git config --global --add include.path '$(TARGET_ALIAS_FILE)'
GITCONFIG_UNINSTALL_CMD = git config --global --unset include.path '$(INSTALL_DIR)'

all: prepare clean sh chmod alias install

prepare:
	test -d $(INSTALL_DIR) || mkdir -p $(INSTALL_DIR)
	test -d $(INSTALL_BIN_DIR) || mkdir -p $(INSTALL_BIN_DIR)

clean:
	rm -f $(SCRIPT_BUILT_FILE)
	rm -f $(ALIAS_BUILT_FILE)

sh:
	cp $(SCRIPT_SRC_FILE) $(SCRIPT_BUILT_FILE)

alias:
	cat $(ALIAS_SRC_FILE) | sed -e 's|gitcwb|$(INSTALL_BIN_DIR)/&|' > $(ALIAS_BUILT_FILE)

chmod:
	chmod +x $(TARGET_BIN_FILE)

install: prepare clean sh chmod alias
	cp -r $(SCRIPT_BUILT_FILE) $(TARGET_BIN_FILE)
	cp -r $(ALIAS_BUILT_FILE) $(TARGET_ALIAS_FILE)
	$(GITCONFIG_INCLUDE_CMD)

uninstall:
	rm -f $(TARGET_BIN_FILE)
	rm -f $(TARGET_ALIAS_FILE)
	$(GITCONFIG_UNINSTALL_CMD)
