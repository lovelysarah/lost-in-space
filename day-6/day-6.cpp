#include <Arduino.h>;

int sensorPin = A0; // Analog 0;
int onboardLED = 13; // buildinLED
int sensorValue = 0;

String chargeRate = "Average";

void setup() {
  Serial.begin(9600);
  pinMode(onboardLED, OUTPUT);
}

String getChargeRate(int sensorValue) {
  if(sensorValue < 50) {
    return String("Slow");
  }
  if(sensorValue < 250) {
    return String("Average");
  }
  if(sensorValue >= 250) {
    return String("Fast");
  }
}

void loop() {
  // Get the light value and blink the LED 
  // more light = faster blinking
  sensorValue = analogRead(sensorPin);

  digitalWrite(onboardLED, HIGH);

  chargeRate = getChargeRate(sensorValue);

  delay(1024 - sensorValue);
  Serial.print("Charging state: " + chargeRate + ":" + sensorValue);
  Serial.print("\n\r");

  digitalWrite(onboardLED, LOW);
  delay(1024 - sensorValue);
}
