# Copyright (c) 2018 Tim Perkins

QMK_DIR := qmk_firmware
QMK_TMP_DIR := build/qmk_tmp
BUILD_DIR := build

all:
	mkdir -p "$(BUILD_DIR)"
	mkdir -p "$(QMK_TMP_DIR)/keyboards"
	rsync -a "$(QMK_DIR)/Makefile" "$(QMK_TMP_DIR)"
	rsync -a --include='*.mk' --exclude='*' "$(QMK_DIR)/" "$(QMK_TMP_DIR)"
	rsync -a "$(QMK_DIR)/lib" "$(QMK_TMP_DIR)"
	rsync -a "$(QMK_DIR)/drivers" "$(QMK_TMP_DIR)"
	rsync -a "$(QMK_DIR)/quantum" "$(QMK_TMP_DIR)"
	rsync -a "$(QMK_DIR)/tmk_core" "$(QMK_TMP_DIR)"
	rsync -a "$(QMK_DIR)/keyboards/ergodox_ez" "$(QMK_TMP_DIR)/keyboards"
	ln -r -f -T -s . "$(QMK_TMP_DIR)/keyboards/ergodox_ez/keymaps/tprk77"
	make -C "$(QMK_TMP_DIR)" ergodox_ez:tprk77
	cp -t "$(BUILD_DIR)" "$(QMK_TMP_DIR)/ergodox_ez_tprk77.hex"

clean:
	-rm -rf build

.PHONY: all clean depends
