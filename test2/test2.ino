int led = 3;

boolean enc1 = false;
void setup() {
  // put your setup code here, to run once:
  pinMode(led, OUTPUT);
  Serial.begin(9600);
  digitalWrite(led, enc1);

}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
    char val = Serial.read();

    if (val == 'c') {
      enc1 = !enc1;
    }
    digitalWrite(led, enc1);
    delay(100);


  }
}
