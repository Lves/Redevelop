ARCHS = armv7 arm64
TARGET = iphone:latest:8.0
THEOS_DEVICE_IP = 192.168.212.221
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WXRedPackage
WXRedPackage_FILES = Tweak.xm
WXRedPackage_FRAMEWORKS = UIKit 

include $(THEOS_MAKE_PATH)/tweak.mk

clean::
	rm -rf ./packages/* 
before-package::
	cp ./script/postinst ./.theos/_/DEBIAN/
	cp ./script/postrm ./.theos/_/DEBIAN/  