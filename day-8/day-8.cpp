#include <Arduino.h>;

int r = 11;
int g = 10;
int b = 9;


void setup(){
  pinMode(r, OUTPUT);
  pinMode(g, OUTPUT);
  pinMode(b, OUTPUT);
  Serial.begin(9600);
}

void RGB_color(int r_val, int g_val, int b_val){
  analogWrite(r, r_val);
  analogWrite(g, g_val);
  analogWrite(b, b_val);
}

void loop(){

  // Max red, ramp g
  for (int i = 0; i <= 50; i++){
    RGB_color(50,i,0);
    delay(30);
  }
  //Max green ramp r-down
  for (int i = 50; i != 0; i--){
    RGB_color(i,50,0);
    delay(30);
  }
  //Max green, ramb b
  for (int i = 0; i <= 50; i++){
    RGB_color(0,50,i);
    delay(30);
  }
  //max green ramb b-down
  for (int i = 50; i != 0; i--){
    RGB_color(0,i,50);
    delay(30);
  }
  //Max blue, ramb r
  for (int i = 0; i <= 50; i++){
    RGB_color(i,0,50);
    delay(30);
  }
  //max green ramb -down
  for (int i = 50; i != 0; i--){
    RGB_color(50,0,i);
    delay(30);
  }
}
