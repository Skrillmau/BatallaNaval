int btn = 13;
int btn1 = 12;
unsigned long t_s1 = 0;
unsigned long t_0_s1 = 0;
unsigned long s0 = 0;
unsigned long bounceTime = 20;
int s1 = 0;
int s1_prev = 0;
int value = 0;
String fase = "";
int op = 1;
int barcrest = 4;
void setup() {
  // put your setup code here, to run once:
  pinMode(btn, INPUT);
  pinMode(btn1, INPUT);
  Serial.begin(9600);
}

void loop() {
//  if (Serial.available()) {
//    String barc = Serial.readString();
//    barcrest = barc.toInt();
//    if (barcrest == 0) {
//      op = 2;
//    }
//  }
  delay(100);
  // Serial.println(op);
  test();
}

void test() {
  switch (op) {
    case 1:
      if (digitalRead(btn) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1500;) {
          debounce(btn);
        }
      }
      break;
    case 2:
      if (digitalRead(btn1) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(btn1);
        }
      }

  }

}

boolean debounce(int pin) {
  s1_prev = s1;
  switch (s1) {
    case 0:
      s1 = 1;
      break;
    case 1:
      value = digitalRead(pin);
      if (value == LOW) {
        s1 = 2;
      }
      break;
    case 2:
      t_0_s1 = millis();
      s1 = 3;
      break;
    case 3:
      value = digitalRead(pin);
      t_s1 = 0;
      if (value == HIGH) {
        s1 = 0;
      }
      if ((t_s1 - t_0_s1) > bounceTime) {
        s1 = 4;
      }
      break;
    case 4:
      value = digitalRead(pin);
      if (value == HIGH) {
        s1 = 5;
      }
      break;
    case 5:
      if (pin == btn) {
        Serial.println("A1-B1");
        delay(100);
      } else if (pin == btn1) {
        Serial.println("B1");
      }

      s1 = 0;
      break;
  }

}
