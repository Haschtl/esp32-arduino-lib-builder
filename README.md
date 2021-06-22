# ESP32 Arduino Lib Builder [![Build Status](https://travis-ci.org/espressif/esp32-arduino-lib-builder.svg?branch=master)](https://travis-ci.org/espressif/esp32-arduino-lib-builder)

This repository contains the scripts that produce the libraries included with esp32-arduino.

Tested on WSL-Debian (64 bit)

Note: Both the

### Build on WSL Windows
```bash
sudo apt-get install git wget curl libssl-dev libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
sudo pip install --upgrade pip
git clone https://github.com/haschtl/esp32-arduino-lib-builder
git clone https://github.com/haschtl/arduino-esp32
cd esp32-arduino-lib-builder
./tools/update-components.sh
./tools/install-esp-idf.sh
./build.sh  //maybe not needed
python esp-idf/tools/idf.py menuconfig   //make your modifications and save it as sdkconfig.esp32, sdkconfig.esp32c3 or sdkconfig.esp32s2 in the main directory. Important: The sdkconfig file is automatically overwritten!
./build.sh         //The IDF is compiled to the out/ folder

// Copy the content from esp32-arduino-lib-builder/components/arduino/ to arduino-esp32/

./tools/copy-to-arduino.sh           // Important: This file is modified that it replaces the files in the previously cloned arduino-esp32 repository!
```

### Use with Platformio (platformio.ini)

``````
[env]
platform = espressif32
framework = arduino
platform_packages =
  framework-arduinoespressif32 @ https://github.com/haschtl/arduino-esp32.git
  toolchain-xtensa32@~2.80400.0 

[env:esp32dev]
board = esp32dev
``````

Note: After platformio has initialized the packages, copy the file `esptool.py` from `<USER>/.platformio/packages/framework-arduinoespressif32/tools` to `<USER>/.platformio/packages/tool-esptoolpy/` to use the esptool version 3.1



