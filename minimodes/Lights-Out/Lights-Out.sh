#!/bin/sh

echo 0 > /sys/devices/platform/leds-gpio/leds/tp-link:green:3g/brightness
echo 0 > /sys/devices/platform/leds-gpio/leds/tp-link:green:wlan/brightness
echo 0 > /sys/devices/platform/leds-gpio/leds/tp-link:green:lan/brightness 
