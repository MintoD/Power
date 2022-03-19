ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = power

$(TOOL_NAME)_FILES = main.m
$(TOOL_NAME)_CFLAGS = -fobjc-arc
$(TOOL_NAME)_CODESIGN_FLAGS = -Sentitlements.plist
$(TOOL_NAME)_INSTALL_PATH = /usr/libexec

include $(THEOS_MAKE_PATH)/tool.mk
