ARCHS = arm64
TARGET = iphone:clang:latest:11.0

FINALPACKAGE=1
DEBUG = 0
GO_EASY_ON_ME = 0
#THEOS_DEVICE_IP = 192.168.1.8

PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Power

$(TWEAK_NAME)_FILES = $(wildcard src/*.m src/*.xm)
$(TWEAK_NAME)_FRAMEWORKS = 
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = 
$(TWEAK_NAME)_CFLAGS += -fobjc-arc -I$(THEOS_PROJECT_DIR)/source
$(TWEAK_NAME)_LDFLAGS += -lCSPreferencesProvider

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += preferences
SUBPROJECTS += power

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
