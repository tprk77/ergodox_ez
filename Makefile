# Copyright (c) 2018 Tim Perkins

QMK_DIR := qmk_firmware
QMK_TMP_DIR := build/qmk_tmp
BUILD_DIR := build

all:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(QMK_TMP_DIR)
	mkdir -p $(QMK_TMP_DIR)/keyboards
	cp -R -f -t $(QMK_TMP_DIR) $(QMK_DIR)/Makefile
	cp -R -f -t $(QMK_TMP_DIR) $(QMK_DIR)/*.mk
	cp -R -f -t $(QMK_TMP_DIR) $(QMK_DIR)/lib
	cp -R -f -t $(QMK_TMP_DIR) $(QMK_DIR)/drivers
	cp -R -f -t $(QMK_TMP_DIR) $(QMK_DIR)/quantum
	cp -R -f -t $(QMK_TMP_DIR) $(QMK_DIR)/tmk_core
	cp -R -f -t $(QMK_TMP_DIR)/keyboards $(QMK_DIR)/keyboards/ergodox_ez
	ln -r -f -T -s . $(QMK_TMP_DIR)/keyboards/ergodox_ez/keymaps/tprk77
	make -C $(QMK_TMP_DIR) ergodox_ez:tprk77
	cp -t $(BUILD_DIR) $(QMK_TMP_DIR)/ergodox_ez_tprk77.hex

clean:
	-rm -rf build
