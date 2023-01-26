#include <Arduino.h>;

int sensorPin = A0; // Analog 0;
int sensorValue = 0;

int red = 11;
int green = 10;
int blue = 9;

unsigned int batteryCapacity = 50000;
unsigned int batteryLevel = 0;
unsigned long ticks = 0;
unsigned int wait = 100;

int cost = 60;

bool fullLastTick = false;
double percentFull;

void setup() {

  // Declare RGB LEDs pins as output
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);

  // Start serial monitor
  Serial.begin(9600);
}

void RGB_color(int red_value, int green_value, int blue_value){
  analogWrite(red, red_value);
  analogWrite(green, green_value);
  analogWrite(blue, blue_value);
}

double getBatteryPercentage(){
  return (100 * ((double)batteryLevel / (double)batteryCapacity));
}

void printBatteryPercentage(double percentage){
  Serial.print(ticks);
  Serial.print(" ms | Battery level ");
  Serial.print(percentage);
  Serial.println("%");
}

void updateBatteryLED(double percentage){
  if (percentage > 0 && percentage <= 25)
  {
    RGB_color(125,0,0); // red
  }
  else if (percentage > 25 && percentage <= 50)
  {
    RGB_color(80,125,0); // yellow
  }
  else if (percentage > 50 && percentage <= 75)
  {
    RGB_color(0,125,125); //blue
  }
  else if (percentage > 75 && percentage < 100){
    RGB_color(125,125,125); //white
  }

}

void showBatteryPourcentage(){
  percentFull = getBatteryPercentage();

  printBatteryPercentage(percentFull);
  updateBatteryLED(percentFull);
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
    showBatteryPourcentage();
  }

  delay(wait);
}
