int Light = 12; //hero board pin 12

void setup() {
  //initialize a digital pin as an output, then set its value to HIGH (5volts)
  pinMode(Light, OUTPUT);
  digitalWrite(Light, LOW);
}

void loop() {
  digitalWrite(Light, LOW);
  delay(500);
  digitalWrite(Light, HIGH);
  delay(100);

}
