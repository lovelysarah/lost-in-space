#include <Arduino.h>;

int switch1 = 2;

int active;
int previous;
int minPin = 11;
int maxPin = 13;

bool powered = false;

void setup() {
  // Loop through pins from min to max.
  for(int i = minPin; i > maxPin+1; i++){
    pinMode(i, OUTPUT);
  }
  pinMode(switch1, INPUT);
}


void wave() {
  if(previous) {
    digitalWrite(previous, LOW);
  }
  digitalWrite(active, HIGH);
}

void turnOff(){
  // Loop through pins from min to max.
  for(int i = minPin; i < maxPin + 1; i++){
    digitalWrite(i, LOW);
  }
  powered = false;
}

void loop() {
  // If switch input reads a high voltage, take the happy path.
  if(digitalRead(switch1) == HIGH) { 

    powered = true;
    delay(500);
    
    // If active isn't set and or it has reached the end, set it to first pin.
    if(!active || active == maxPin+1){
      active = minPin;
    };

    wave();
    previous = active;
    active++;
    
  } else if (powered) {
    turnOff();
  }
}
