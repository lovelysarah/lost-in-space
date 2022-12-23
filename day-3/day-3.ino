int LED = 12;
int Switch1 = 2; //pin 2 will be attached to our switch
void setup() {
  //setup output and input on the HERO board
  pinMode(LED, OUTPUT);
  pinMode(Switch1, INPUT);
}

void loop() {
  // Now we'll take action base on the status of the input switch
  if (digitalRead(Switch1) == HIGH){

    // Blink LED
    digitalWrite(LED, LOW); 
    delay(1000);
    digitalWrite(LED, HIGH);
    delay(100);
    digitalWrite(LED, LOW);
    delay(100);
    digitalWrite(LED, HIGH);
    delay(100);
  } else {
    digitalWrite(LED, LOW); //TURN LED OFF   
  }
}
