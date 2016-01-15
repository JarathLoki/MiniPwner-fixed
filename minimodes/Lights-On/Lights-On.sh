#!/bin/sh

echo 255 > /sys/devices/platform/leds-gpio/leds/tp-link:green:3g/brightness
echo 255 > /sys/devices/platform/leds-gpio/leds/tp-link:green:wlan/brightness
echo 255 > /sys/devices/platform/leds-gpio/leds/tp-link:green:lan/brightness 
