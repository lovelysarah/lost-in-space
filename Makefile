SKETCH_DIR=creative/
SKETCH_NAME=day-5

BIN=/usr/bin
AVR_HARDWARE=/usr/share/arduino/hardware/archlinux-arduino/avr

GCC_FLAGS=-c -g -Os -Wall -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000L -MMD -DUSB_VID=null -DUSB_PID=null -DARDUINO=105 -D__PROG_TYPES_COMPAT__ -I${AVR_HARDWARE}/cores/arduino -I${AVR_HARDWARE}/variants/standard

GPP_FLAGS=-c -g -Os -w -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000L -MMD -DUSB_VID=null -DUSB_PID=null -DARDUINO=105 -D__PROG_TYPES_COMPAT__ -I${AVR_HARDWARE}/cores/arduino -I${AVR_HARDWARE}/variants/standard

ARDUINO_CORE_SOURCE_DIR=${AVR_HARDWARE}/cores/arduino
ARDUINO_CC=${BIN}/avr-gcc
ARDUINO_CPP=${BIN}/avr-g++
ARDUINO_AR=${BIN}/avr-ar

OBJECT_FILES=$(SKETCH_NAME).o wiring.o wiring_pulse.o wiring_digital.o wiring_shift.o wiring_analog.o WInterrupts.o Stream.o HardwareSerial.o CDC.o WString.o Print.o new.o main.o WMath.o IPAddress.o USBCore.o Tone.o PluggableUSB.o hooks.o
D_FILES=$(OBJECT_FILES:.o=.d)

default: $(OBJECT_FILES)
	rm -f core.a
	$(ARDUINO_AR) rcs core.a hooks.o
	$(ARDUINO_AR) rcs core.a wiring_pulse.o 
	$(ARDUINO_AR) rcs core.a wiring.o 
	$(ARDUINO_AR) rcs core.a wiring_digital.o 
	$(ARDUINO_AR) rcs core.a wiring_shift.o 
	$(ARDUINO_AR) rcs core.a wiring_analog.o 
	$(ARDUINO_AR) rcs core.a WInterrupts.o 
	$(ARDUINO_AR) rcs core.a Stream.o 
	$(ARDUINO_AR) rcs core.a HardwareSerial.o 
	$(ARDUINO_AR) rcs core.a CDC.o 
	$(ARDUINO_AR) rcs core.a WString.o 
	$(ARDUINO_AR) rcs core.a Print.o 
	$(ARDUINO_AR) rcs core.a new.o 
	$(ARDUINO_AR) rcs core.a main.o 
	$(ARDUINO_AR) rcs core.a WMath.o 
	$(ARDUINO_AR) rcs core.a IPAddress.o 
	$(ARDUINO_AR) rcs core.a USBCore.o 
	$(ARDUINO_AR) rcs core.a Tone.o 
	$(ARDUINO_AR) rcs core.a PluggableUSB.o
	$(BIN)/avr-gcc -Os -Wl,-Map,avr.map,--gc-sections -mmcu=atmega328p -o $(SKETCH_NAME).elf $(SKETCH_NAME).o core.a -L./ -lm 
	$(BIN)/avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 $(SKETCH_NAME).elf $(SKETCH_NAME).eep 
	$(BIN)/avr-objcopy -O ihex -R .eeprom $(SKETCH_NAME).elf $(SKETCH_NAME).hex 
	/home/lovely/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/bin/avrdude -C/home/lovely/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino17/etc/avrdude.conf -v -v -v -v -patmega328p -carduino -P/dev/ttyUSB0 -b115200 -D -Uflash:w:$(SKETCH_NAME).hex:i

#  C sources:
hooks.o: $(ARDUINO_CORE_SOURCE_DIR)/hooks.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

wiring.o: $(ARDUINO_CORE_SOURCE_DIR)/wiring.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

wiring_pulse.o: $(ARDUINO_CORE_SOURCE_DIR)/wiring_pulse.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

wiring_digital.o: $(ARDUINO_CORE_SOURCE_DIR)/wiring_digital.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

wiring_shift.o: $(ARDUINO_CORE_SOURCE_DIR)/wiring_shift.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

wiring_analog.o: $(ARDUINO_CORE_SOURCE_DIR)/wiring_analog.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

WInterrupts.o: $(ARDUINO_CORE_SOURCE_DIR)/WInterrupts.c
	 $(ARDUINO_CC) $(GCC_FLAGS) $< -o $@

#  C++ sources:

$(SKETCH_NAME).o: $(SKETCH_DIR)$(SKETCH_NAME).cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

Stream.o: $(ARDUINO_CORE_SOURCE_DIR)/Stream.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

HardwareSerial.o: $(ARDUINO_CORE_SOURCE_DIR)/HardwareSerial.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

CDC.o: $(ARDUINO_CORE_SOURCE_DIR)/CDC.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

WString.o: $(ARDUINO_CORE_SOURCE_DIR)/WString.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

Print.o: $(ARDUINO_CORE_SOURCE_DIR)/Print.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

new.o: $(ARDUINO_CORE_SOURCE_DIR)/new.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

main.o: $(ARDUINO_CORE_SOURCE_DIR)/main.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

WMath.o: $(ARDUINO_CORE_SOURCE_DIR)/WMath.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

IPAddress.o: $(ARDUINO_CORE_SOURCE_DIR)/IPAddress.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

USBCore.o: $(ARDUINO_CORE_SOURCE_DIR)/USBCore.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

PluggableUSB.o: $(ARDUINO_CORE_SOURCE_DIR)/PluggableUSB.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

Tone.o: $(ARDUINO_CORE_SOURCE_DIR)/Tone.cpp
	 $(ARDUINO_CPP) $(GPP_FLAGS) $< -o $@

clean:
	rm -f *.o *.d core.a $(SKETCH_NAME).eep $(SKETCH_NAME).elf $(SKETCH_NAME).hex avr.map

