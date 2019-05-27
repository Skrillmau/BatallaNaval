int led = 3;
int num;
boolean enc1 = false;
void setup() {
  // put your setup code here, to run once:
  pinMode(led, OUTPUT);
  Serial.begin(9600);
  digitalWrite(led, enc1);

}

void loop() {
  // put your main code here, to run repeatedly:

  if (Serial.available() > 0) {
    String val = Serial.readString();
    
    num = val.toInt();
    Serial.println(num);

    delay(100);


  }

}
