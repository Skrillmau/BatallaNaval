int cA1 = 0, cA2 = 0, cA3 = 0, cA4 = 0, cB1 = 0, cB2 = 0, cB3 = 0, cB4 = 0, cC1 = 0, cC2 = 0, cC3 = 0, cC4 = 0;
int rActivacion = 800;
String c1 = " ";
String c2 = " ";
String coordenada = " ";


void setup() {
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  pinMode(A6, INPUT);
  pinMode(A7, INPUT);
  pinMode(A8, INPUT);
  pinMode(A9, INPUT);
  pinMode(A10, INPUT);
  pinMode(A11, INPUT);
  Serial.begin(9600);
}

void loop() {
  //vCasillas();
  int cA1 = analogRead(A0);
  int cA2 = analogRead(A1);
  int cA3 = analogRead(A2);
  int cA4 = analogRead(A3);
  int cB1 = analogRead(A4);
  int cB2 = analogRead(A5);
  int cB3 = analogRead(A6);
  int cB4 = analogRead(A7);
  int cC1 = analogRead(A8);
  int cC2 = analogRead(A9);
  int cC3 = analogRead(A10);
  int cC4 = analogRead(A11);


    Serial.println(cC3);

  if (cA1 > rActivacion) {
    c1 = "A1";
    if (cA2 > rActivacion) {
      c2 = "A2";
      coordenada = c1 + "-" + c2;
    } else if (cB1 > rActivacion) {
      c2 = "B1";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
Serial.println(coordenada);
  } else if (cA2 > rActivacion) {
    c1 = "A2";
    if (cA1 > rActivacion) {
      c2 = "A1";
      coordenada = c1 + "-" + c2;
    } else if (cA3 > rActivacion) {
      c2 = "A3";
      coordenada = c1 + "-" + c2;
    } else if (cB2 > rActivacion) {
      c2 = "B2";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cA3 > rActivacion) {
    c1 = "A3";
    if (cA2 > rActivacion) {
      c2 = "A2";
      coordenada = c1 + "-" + c2;
    } else if (cA4 > rActivacion) {
      c2 = "A4";
      coordenada = c1 + "-" + c2;
    } else if (cB3 > rActivacion) {
      c2 = "B3";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cA4 > rActivacion) {
    c1 = "A4";
    if (cA3 > rActivacion) {
      c2 = "A3";
      coordenada = c1 + "-" + c2;
    } else if (cB4 > rActivacion) {
      c2 = "B4";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
Serial.println(coordenada);
  } else if (cB1 > rActivacion) {
    c1 = "B1";
    if (cA1 > rActivacion) {
      c2 = "A1";
      coordenada = c1 + "-" + c2;
    } else if (cB2 > rActivacion) {
      c2 = "B2";
      coordenada = c1 + "-" + c2;
    } else if (cC1 > rActivacion) {
      c2 = "C1";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cB2 > rActivacion) {
    c1 = "B2";
    if (cA2 > rActivacion) {
      c2 = "A2";
      coordenada = c1 + "-" + c2;
    } else if (cB1 > rActivacion) {
      c2 = "B1";
      coordenada = c1 + "-" + c2;
    } else if (cB3 > rActivacion) {
      c2 = "B3";
      coordenada = c1 + "-" + c2;
    } else if (cC2 > rActivacion) {
      c2 = "C2";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cB3 > rActivacion) {
    c1 = "B3";
    if (cA3 > rActivacion) {
      c2 = "A3";
      coordenada = c1 + "-" + c2;
    } else if (cB2 > rActivacion) {
      c2 = "B2";
      coordenada = c1 + "-" + c2;
    } else if (cB4 > rActivacion) {
      c2 = "B4";
      coordenada = c1 + "-" + c2;
    } else if (cC3 > rActivacion) {
      c2 = "C3";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
Serial.println(coordenada);
  } else if (cB4 > rActivacion) {
    c1 = "B4";
    if (cA4 > rActivacion) {
      c2 = "A4";
      coordenada = c1 + "-" + c2;
    } else if (cB3 > rActivacion) {
      c2 = "B3";
      coordenada = c1 + "-" + c2;
    } else if (cC4 > rActivacion) {
      c2 = "C4";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cC1 > rActivacion) {
    c1 = "C1";
    if (cB1 > rActivacion) {
      c2 = "B1";
    } else if (cC2 > rActivacion) {
      c2 = "C2";
    } else {
      coordenada = c1;
    }
  } else if (cC2 > rActivacion) {
    c1 = "C2";
    if (cB2 > rActivacion) {
      c2 = "B2";
      coordenada = c1 + "-" + c2;
    } else if (cC1 > rActivacion) {
      c2 = "C1";
      coordenada = c1 + "-" + c2;
    } else if (cC3 > rActivacion) {
      c2 = "C3";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cC3 > rActivacion) {
    c1 = "C3";
    if (cB3 > rActivacion) {
      c2 = "B3";
      coordenada = c1 + "-" + c2;
    } else if (cC2 > rActivacion) {
      c2 = "C2";
      coordenada = c1 + "-" + c2;
    } else if (cC4 > rActivacion) {
      c2 = "C4";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  } else if (cC4 > rActivacion) {
    c1 = "C4";
    if (cB4 > rActivacion) {
      c2 = "B4";
      coordenada = c1 + "-" + c2;
    } else if (cC3 > rActivacion) {
      c2 = "C3";
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
    Serial.println(coordenada);
  }
}
//void vCasillas() {
//  int cA1 = analogRead(A0);
//  int cA2 = analogRead(A1);
//  int cA3 = analogRead(A2);
//  int cA4 = analogRead(A3);
//  int cB1 = analogRead(A4);
//  int cB2 = analogRead(A5);
//  int cB3 = analogRead(A6);
//  int cB4 = analogRead(A7);
//  int cC1 = analogRead(A8);
//  int cC2 = analogRead(A9);
//  int cC3 = analogRead(A10);
//  int cC4 = analogRead(A11);
//}
