#!/bin/bash
source ./tools/config.sh

if [ -z $ESP32_ARDUINO ]; then
    if [[ "$AR_OS" == "macos" ]]; then
    	ESP32_ARDUINO="$HOME/Documents/Arduino/hardware/espressif/esp32"
    else
    	ESP32_ARDUINO="../arduino-esp32/"
    fi
fi

mkdir -p $ESP32_ARDUINO

if ! [ -d "$ESP32_ARDUINO" ]; then
	echo "ERROR: Target arduino folder does not exist!"
	exit 1
fi

echo "Installing new libraries to $ESP32_ARDUINO"

rm -rf $ESP32_ARDUINO/tools/sdk $ESP32_ARDUINO/tools/esptool.py $ESP32_ARDUINO/tools/gen_esp32part.py $ESP32_ARDUINO/tools/platformio-build-*.py $ESP32_ARDUINO/platform.txt

cp -f $AR_OUT/platform.txt $ESP32_ARDUINO/
cp -Rf $AR_TOOLS/sdk $ESP32_ARDUINO/tools/
cp -f $AR_TOOLS/esptool.py $ESP32_ARDUINO/tools/
cp -f $AR_TOOLS/gen_esp32part.py $ESP32_ARDUINO/tools/
cp -f $AR_TOOLS/platformio-build-*.py $ESP32_ARDUINO/tools/
