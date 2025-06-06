## This file adds a target to perform the initial Qt for MCUs export
QUL_TOOL ?= $(wildcard $(QUL_DIR)/bin/qmlprojectexporter*)
ifeq ($(QUL_TOOL),)
$(error Could not find qmlprojectexporter tool. Use the QUL_DIR variable to point to a Qt for MCUs installation. On Windows, use forward slashes.)
endif
QUL_BOARD_DEFAULTS ?= $(QUL_DIR)/platform/boards/cypress/tviic2d6mlite-baremetal/cmake/BoardDefaults_32bpp_default.qmlprojectconfig

.PHONY: export_qmlproject
export_qmlproject:
	$(info Exporting $(QMLPROJECT_FILE) into the project)
	$(QUL_TOOL) $(QMLPROJECT_FILE) \
	  --extend-project Makefile \
	  --project-type modustoolbox \
	  --boarddefaults $(QUL_BOARD_DEFAULTS) \
	  --platform tviic2d6mlite-baremetal \
	  --toolchain gnu \
	  --infineon-resource-generator=tool/graphics/bin/windows/ResourceGenerator.exe \
	  --generate-entrypoint

