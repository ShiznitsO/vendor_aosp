# Set all versions
CUSTOM_BUILD_TYPE ?= UNOFFICIAL
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
ifeq ($(IS_GO_VERSION), true)
CUSTOM_VERSION := nitrogen_$(CUSTOM_BUILD)-$(PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ROM_FINGERPRINT := nitrogen/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
else
CUSTOM_VERSION := nitrogen_$(CUSTOM_BUILD)-$(PLATFORM_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_BUILD_TYPE)
ROM_FINGERPRINT := nitrogen/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
endif
TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))

CUSTOM_PROPERTIES := \
    org.nitrogen.version=$(CUSTOM_VERSION) \
    org.nitrogen.build_date=$(CUSTOM_BUILD_DATE) \
    org.nitrogen.build_type=$(CUSTOM_BUILD_TYPE) \
    org.nitrogen.fingerprint=$(ROM_FINGERPRINT)

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true \
    persist.sys.disable_rescue=true
