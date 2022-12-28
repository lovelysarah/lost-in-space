#include <Arduino.h>;

int sensorPin = A0; // Analog 0;
int onboardLED = 13; // buildinLED
int sensorValue = 0;

unsigned int batteryCapacity = 50000;
unsigned int batteryLevel = 0;
unsigned long ticks;
unsigned int wait = 100;

int cost = 60;

bool fullLastTick = false;
double percentFull;

void setup() {
  Serial.begin(9600);
  pinMode(onboardLED, OUTPUT);
}

void printBatteryPercentage(){
  Serial.print(ticks);
  Serial.print(" ms | Battery level ");

  percentFull = 100 * ((double)batteryLevel / (double)batteryCapacity);

  Serial.print(percentFull);
  Serial.println("%");
}

void dischargeBattery(){
  int dechargeValue = cost - sensorValue;

  // Prevent the batteryLevel from falling under 0.
  if(batteryLevel < dechargeValue){ 
    batteryLevel = 0;
    return;
  }
  batteryLevel = batteryLevel - dechargeValue;
}

void loop() {
  sensorValue = analogRead(sensorPin); // Read light value from sensor.

  // If sensor value is higher than the energy cost, charge else discharge.
  if(sensorValue >= cost) {
    batteryLevel += sensorValue - cost;
  } else {
    fullLastTick = false;
    dischargeBattery();
  }

  ticks += wait;

  if(batteryLevel >= batteryCapacity){
    batteryLevel = batteryCapacity; // Prevent the int from increasing.
    if(!fullLastTick){ // Prevent the message from repeating.
      fullLastTick = true;
      Serial.print(ticks);
      Serial.print(" ms | FULLY CHARGED");
    }
  } else {
    printBatteryPercentage();
  }

  delay(wait);
}
