#!/bin/bash
ARDUINO=/home/lovely/Programs/arduino-1.8.19

SKETCH_NAME=blink

ADN_TOOLS=/home/lovely/.arduino15/packages/arduino/tools
ADN_HARDWARE=/home/lovely/.arduino15/packages/arduino/hardware
ADN_CORE=${ADN_HARDWARE}/avr/1.8.6/cores/arduino

GCC_CORE_FLAGS="-c -g -Os -w -std=gnu11 -ffunction-sections -fdata-sections -MMD -flto -fno-fat-lto-objects -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I${ADN_CORE} -I${ADN_HARDWARE}/avr/1.8.6/variants/standard ${ADN_HARDWARE}/avr/1.8.6/cores/arduino"

GPP_FLAGS="-c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I${ADN_CORE} -I${ADN_HARDWARE}/avr/1.8.6"

#${ARDUINO}/arduino-builder -dump-prefs -logger=machine -hardware ${ARDUINO}/hardware -hardware /home/lovely/.arduino15/packages -tools ${ARDUINO}/tools-builder -tools ${ARDUINO}/hardware/tools/avr -tools /home/lovely/.arduino15/packages -built-in-libraries ${ARDUINO}/libraries -libraries /home/lovely/Arduino/libraries -fqbn=arduino:avr:uno -vid-pid=1A86_7523 -ide-version=10819 -build-path /tmp/arduino_build_890694 -warnings=none -build-cache /tmp/arduino_cache_377176 -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.arduinoOTA.path=${ADN_TOOLS}/arduinoOTA/1.3.0 -prefs=runtime.tools.arduinoOTA-1.3.0.path=${ADN_TOOLS}/arduinoOTA/1.3.0 -prefs=runtime.tools.avrdude.path=${ADN_TOOLS}/avrdude/6.3.0-arduino17 -prefs=runtime.tools.avrdude-6.3.0-arduino17.path=${ADN_TOOLS}/avrdude/6.3.0-arduino17 -prefs=runtime.tools.avr-gcc.path=${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7 -prefs=runtime.tools.avr-gcc-7.3.0-atmel3.6.1-arduino7.path=${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7 -verbose /home/lovely/dev/lost-in-space/blink/blink.ino
#${ARDUINO}/arduino-builder -compile -logger=machine -hardware ${ARDUINO}/hardware -hardware /home/lovely/.arduino15/packages -tools ${ARDUINO}/tools-builder -tools ${ARDUINO}/hardware/tools/avr -tools /home/lovely/.arduino15/packages -built-in-libraries ${ARDUINO}/libraries -libraries /home/lovely/Arduino/libraries -fqbn=arduino:avr:uno -vid-pid=1A86_7523 -ide-version=10819 -build-path /tmp/arduino_build_890694 -warnings=none -build-cache /tmp/arduino_cache_377176 -prefs=build.warn_data_percentage=75 -prefs=runtime.tools.arduinoOTA.path=${ADN_TOOLS}/arduinoOTA/1.3.0 -prefs=runtime.tools.arduinoOTA-1.3.0.path=${ADN_TOOLS}/arduinoOTA/1.3.0 -prefs=runtime.tools.avrdude.path=${ADN_TOOLS}/avrdude/6.3.0-arduino17 -prefs=runtime.tools.avrdude-6.3.0-arduino17.path=${ADN_TOOLS}/avrdude/6.3.0-arduino17 -prefs=runtime.tools.avr-gcc.path=${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7 -prefs=runtime.tools.avr-gcc-7.3.0-atmel3.6.1-arduino7.path=${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7 -verbose /home/lovely/dev/lost-in-space/blink/blink.ino

#Using board 'uno' from platform in folder: /home/lovely/.arduino15/packages/arduino/hardware/avr/1.8.6
#Using core 'arduino' from platform in folder: /home/lovely/.arduino15/packages/arduino/hardware/avr/1.8.6
#Detecting libraries used...

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -flto -w -x c++ -E -CC -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I${ADN_CORE} -I${ADN_HARDWARE}/avr/1.8.6/variants/standard sketch/blink.ino.cpp -o /dev/null

#Generating function prototypes...

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -flto -w -x c++ -E -CC -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I${ADN_CORE} -I${ADN_HARDWARE}/avr/1.8.6/variants/standard sketch/blink.ino.cpp -o preproc/ctags_target_for_gcc_minus_e.cpp
${ARDUINO}/tools-builder/ctags/5.8-arduino11/ctags -u --language-force=c++ -f - --c++-kinds=svpf --fields=KSTtzns --line-directives preproc/ctags_target_for_gcc_minus_e.cpp

#Compiling sketch...

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard sketch/blink.ino.cpp -o sketch/blink.ino.cpp.o

#Compiling libraries...
#Compiling core...

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc -c -g -x assembler-with-cpp -flto -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10819 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I${ADN_CORE} -I${ADN_HARDWARE}/avr/1.8.6/variants/standard ${ADN_CORE}/wiring_pulse.S -o core/wiring_pulse.S.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/WInterrupts.c -o core/WInterrupts.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/hooks.c -o core/hooks.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/wiring_shift.c -o core/wiring_shift.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/wiring_digital.c -o core/wiring_digital.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/wiring_analog.c -o core/wiring_analog.c.o

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/wiring.c -o core/wiring.c.o

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc ${GCC_CORE_FLAGS}/wiring_pulse.c -o core/wiring_pulse.c.o

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/CDC.cpp -o core/CDC.cpp.o

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/IPAddress.cpp -o core/IPAddress.cpp.o

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/Print.cpp -o core/Print.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/HardwareSerial2.cpp -o core/HardwareSerial2.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/HardwareSerial1.cpp -o core/HardwareSerial1.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/PluggableUSB.cpp -o core/PluggableUSB.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/Stream.cpp -o core/Stream.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/HardwareSerial3.cpp -o core/HardwareSerial3.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/HardwareSerial0.cpp -o core/HardwareSerial0.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/Tone.cpp -o core/Tone.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/HardwareSerial.cpp -o core/HardwareSerial.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/USBCore.cpp -o core/USBCore.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/WMath.cpp -o core/WMath.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/WString.cpp -o core/WString.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/abi.cpp -o core/abi.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/main.cpp -o core/main.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-g++ ${GPP_FLAGS}/variants/standard ${ADN_CORE}/new.cpp -o core/new.cpp.o

${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/wiring_pulse.S.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/WInterrupts.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/hooks.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/wiring.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/wiring_analog.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/wiring_digital.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/wiring_pulse.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/wiring_shift.c.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/CDC.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/HardwareSerial.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/HardwareSerial0.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/HardwareSerial1.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/HardwareSerial2.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/HardwareSerial3.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/IPAddress.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/PluggableUSB.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/Print.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/Stream.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/Tone.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/USBCore.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/WMath.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/WString.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/abi.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/main.cpp.o
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc-ar rcs core/core.a core/new.cpp.o
#Archiving built core (caching) in: /tmp/arduino_cache_377176/core/core_arduino_avr_uno_facd07b621984b417855a0a799075445.a
#Linking everything together...
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-gcc -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=atmega328p -o blink.ino.elf sketch/blink.ino.cpp.o core/core.a -L./ -lm
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 blink.ino.elf blink.ino.eep
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-objcopy -O ihex -R .eeprom blink.ino.elf blink.ino.hex
${ADN_TOOLS}/avr-gcc/7.3.0-atmel3.6.1-arduino7/bin/avr-size -A blink.ino.elf
${ADN_TOOLS}/avrdude/6.3.0-arduino17/bin/avrdude -C${ADN_TOOLS}/avrdude/6.3.0-arduino17/etc/avrdude.conf -v -patmega328p -carduino -P/dev/ttyUSB0 -b115200 -D -Uflash:w:blink.ino.hex:i 
