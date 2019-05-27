int cA1 = 0, cA2 = 0, cA3 = 0, cA4 = 0, cB1 = 0, cB2 = 0, cB3 = 0, cB4 = 0, cC1 = 0, cC2 = 0, cC3 = 0, cC4 = 0;
int bA1 = 2, bA2 = 3, bA3 = 4, bA4 = 5, bB1 = 6, bB2 = 7, bB3 = 8, bB4 = 9, bC1 = 10, bC2 = 11, bC3 = 12, bC4 = 13;
int rActivacion = 800;
int barcrest = 4;
String c1 = "";
String c2 = "";
String coordinates;


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
  if (Serial.available()) {
    String barc = Serial.readString();
    barcrest = barc.toInt();
    while (barcrest != 0) {
      coordinates = setCoordinates();
      Serial.println(coordinates);
    }
  }


}

String setCoordinates() {
  vCasillas();
  String coordenada = "";
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
  }
}
void vCasillas() {
  cA1 = analogRead(A0);
  cA2 = analogRead(A1);
  cA3 = analogRead(A2);
  cA4 = analogRead(A3);
  cB1 = analogRead(A4);
  cB2 = analogRead(A5);
  cB3 = analogRead(A6);
  cB4 = analogRead(A7);
  cC1 = analogRead(A8);
  cC2 = analogRead(A9);
  cC3 = analogRead(A10);
  cC4 = analogRead(A11);
}
