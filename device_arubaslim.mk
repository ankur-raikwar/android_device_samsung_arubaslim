# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
    
# Inherit products (Most specific first)
# (arubaslim blobs) > (device/vendor)
$(call inherit-product, vendor/samsung/arubaslim/vendor-blobs.mk)

## LDPI assets
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

## Inherit overlays  (Most specific last)
DEVICE_PACKAGE_OVERLAYS += device/samsung/arubaslim/overlay

## FM Radio permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/com.stericsson.hardware.fm.receiver.xml:system/etc/permissions/com.stericsson.hardware.fm.receiver.xml

## Ramdisk
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.qcom.rc \
	lpm.rc \
	init.qcom.usb.rc \
	ueventd.qcom.rc \
           initlogo.rle

## Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## FM
PRODUCT_COPY_FILES += \
    device/samsung/arubaslim/prebuilt/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh
        
## Audio
PRODUCT_COPY_FILES += \
    device/samsung/arubaslim/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/arubaslim/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

## Keychar
PRODUCT_COPY_FILES += \
    device/samsung/arubaslim/prebuilt/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm

## Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/arubaslim/prebuilt/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/samsung/arubaslim/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/samsung/arubaslim/prebuilt/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \

## Touchscreen configuration
PRODUCT_COPY_FILES += \
    device/samsung/arubaslim/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

### BEGIN: build properties

## Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=0 \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
    dalvik.vm.heapsize=48m

## Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=1 \
    ro.secure=1 \
    ro.allow.mock.location=0

## Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_highendgfx=1

## Loop ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.multiple=false

## Other
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    dev.sfbootcomplete=0 \
    ro.config.play.bootsound=0 \
    ro.setupwizard.enable_bypass=1

## RIL, telephony
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ro.telephony.default_network=0 \
    ro.telephony.ril_class=SamsungRIL \
    rild.libargs=-d/dev/smd0

## SELinux - we're not ready for enforcing mode yet
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=permissive

## USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

## WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180

## WiFi AP
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.ap.interface=wlan0

## QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

### END:  properties
