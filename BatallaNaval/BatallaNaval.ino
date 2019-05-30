// Coordinates variable declaration
int cA1 = 0, cA2 = 0, cA3 = 0, cA4 = 0, cB1 = 0, cB2 = 0, cB3 = 0, cB4 = 0, cC1 = 0, cC2 = 0, cC3 = 0, cC4 = 0;

// Button shoot coordinate variable declaration
int bA1 = 2, bA2 = 3, bA3 = 4, bA4 = 5, bB1 = 6, bB2 = 7, bB3 = 8, bB4 = 9, bC1 = 10, bC2 = 11, bC3 = 12, bC4 = 13;

// State machine state value variable
int value = 0;

//
int barcrest = 4;

// Activation range constant
int rActivacion = 700;

// Battleship coordinate variables
String c1 = " ", c2 = " ", coordinates = " ";

// State machine debounce btn
unsigned long t_b1 = 0;
unsigned long t_0_b1 = 0;
unsigned long s0 = 0;
unsigned long bounceTime = 20;
int b1 = 0;
int b1_prev = 0;

// State machine battleship
int sB = 3;
int sB_prev = 0;
unsigned long t_sB = 0;

void setup() {
  // Button pins initialization
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
  // Sensor pins initialization
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
  //pinMode(2, OUTPUT);
}

void loop() {
  Serial.println(analogRead(A0));
  // ejecuta state machine del juego
  SM_Battleship();
  if (Serial.available()) {
    char val = Serial.read();
    //si llega por puerto serial el caracter 'b' pone la state machine del juego en 0 para cargar coordenadas
    if (val == 'b') {
      //digitalWrite(2, HIGH);
      sB = 0;
    }
    // si llega por puerto serial el caracter 'u' pone la state machine del juego en 2 para esperar a que el jugador
    // oprima un boton
    if (val == 'u') {
      sB = 2;
    }
  }
  //delay(100);
  //digitalWrite(2, LOW);
}
// metodo que controla el estado del juego caso 1 para leer fotoresistencias y enviar por puerto serial
// las coordenadas, caso 2 para esperar a que el jugador presione un boton y ejecuta metodo debounce
// para eliminar rebotes, caso 3 permanece en idle el juego
void SM_Battleship() {
  sB_prev = sB;
  switch (sB) {
    case 0:
      sB = 1;
      break;
    case 1:
      coordinates = setCoordinates();
      Serial.println(coordinates);
      sB = 3;
      break;
    case 2:
      if (digitalRead(bA1) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bA1);
        }
      }
      if (digitalRead(bA2) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bA2);
        }
      }
      if (digitalRead(bA3) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bA3);
        }
      }
      if (digitalRead(bA4) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bA4);
        }
      }
      if (digitalRead(bB1) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bB1);
        }
      }
      if (digitalRead(bB2) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bB2);
        }
      }
      if (digitalRead(bB3) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bB3);
        }
      }
      if (digitalRead(bB4) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bB4);
        }
      }
      if (digitalRead(bC1) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bC1);
        }
      }
      if (digitalRead(bC2) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bC2);
        }
      }
      if (digitalRead(bC3) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bC3);
        }
      }
      // Pin 13 de uno de los mega no esta funcionando, le cambie el valor al pin 22 /choko
      if (digitalRead(bC4) == HIGH) {
        for (s0 = millis(); (millis() - s0) < 1000;) {
          debounce(bC4);
        }
      }
      break;
    case 3:

      break;
  }
}
// metodo ejecuta la lectura de las fotoceldas y en caso de encontrar una por encima del rango de activacion
// pone las coordenadas para imprimir por puerto serial
String setCoordinates() {
  vCasillas();
  String coordenada;
  if (cA1 > rActivacion) {
    c1 = "A1";
    pinMode(A0, OUTPUT);
    if (cA2 > rActivacion) {
      c2 = "A2";
      pinMode(A1, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB1 > rActivacion) {
      c2 = "B1";
      pinMode(A4, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cA2 > rActivacion) {
    c1 = "A2";
    pinMode(A1, OUTPUT);
    if (cA1 > rActivacion) {
      c2 = "A1";
      pinMode(A0, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cA3 > rActivacion) {
      c2 = "A3";
      pinMode(A2, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB2 > rActivacion) {
      c2 = "B2";
      pinMode(A5, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cA3 > rActivacion) {
    c1 = "A3";
    pinMode(A2, OUTPUT);
    if (cA2 > rActivacion) {
      c2 = "A2";
      pinMode(A1, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cA4 > rActivacion) {
      c2 = "A4";
      pinMode(A3, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB3 > rActivacion) {
      c2 = "B3";
      pinMode(A6, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cA4 > rActivacion) {
    c1 = "A4";
    pinMode(A3, OUTPUT);
    if (cA3 > rActivacion) {
      c2 = "A3";
      pinMode(A2, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB4 > rActivacion) {
      c2 = "B4";
      pinMode(A7, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cB1 > rActivacion) {
    c1 = "B1";
    pinMode(A4, OUTPUT);
    if (cA1 > rActivacion) {
      c2 = "A1";
      pinMode(A0, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB2 > rActivacion) {
      c2 = "B2";
      pinMode(A5, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC1 > rActivacion) {
      c2 = "C1";
      pinMode(A8, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cB2 > rActivacion) {
    c1 = "B2";
    pinMode(A5, OUTPUT);
    if (cA2 > rActivacion) {
      c2 = "A2";
      pinMode(A1, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB1 > rActivacion) {
      c2 = "B1";
      pinMode(A4, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB3 > rActivacion) {
      c2 = "B3";
      pinMode(A6, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC2 > rActivacion) {
      c2 = "C2";
      pinMode(A9, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cB3 > rActivacion) {
    c1 = "B3";
    pinMode(A6, OUTPUT);
    if (cA3 > rActivacion) {
      c2 = "A3";
      pinMode(A2, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB2 > rActivacion) {
      c2 = "B2";
      pinMode(A5, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB4 > rActivacion) {
      c2 = "B4";
      pinMode(A7, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC3 > rActivacion) {
      c2 = "C3";
      pinMode(A10, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cB4 > rActivacion) {
    c1 = "B4";
    pinMode(A7, OUTPUT);
    if (cA4 > rActivacion) {
      c2 = "A4";
      pinMode(A3, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cB3 > rActivacion) {
      c2 = "B3";
      pinMode(A6, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC4 > rActivacion) {
      c2 = "C4";
      pinMode(A11, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cC1 > rActivacion) {
    c1 = "C1";
    pinMode(A8, OUTPUT);
    if (cB1 > rActivacion) {
      c2 = "B1";
      pinMode(A4, OUTPUT);
    } else if (cC2 > rActivacion) {
      c2 = "C2";
      pinMode(A9, OUTPUT);
    } else {
      coordenada = c1;
    }
  } else if (cC2 > rActivacion) {
    c1 = "C2";
    pinMode(A9, OUTPUT);
    if (cB2 > rActivacion) {
      c2 = "B2";
      pinMode(A5, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC1 > rActivacion) {
      c2 = "C1";
      pinMode(A8, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC3 > rActivacion) {
      c2 = "C3";
      pinMode(A10, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cC3 > rActivacion) {
    c1 = "C3";
    pinMode(A10, OUTPUT);
    if (cB3 > rActivacion) {
      c2 = "B3";
      pinMode(A6, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC2 > rActivacion) {
      c2 = "C2";
      pinMode(A9, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC4 > rActivacion) {
      c2 = "C4";
      pinMode(A11, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  } else if (cC4 > rActivacion) {
    c1 = "C4";
    pinMode(A11, OUTPUT);
    if (cB4 > rActivacion) {
      c2 = "B4";
      pinMode(A7, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else if (cC3 > rActivacion) {
      c2 = "C3";
      pinMode(A10, OUTPUT);
      coordenada = c1 + "-" + c2;
    } else {
      coordenada = c1;
    }
  }
  return coordenada;
}
// lee los valores de las fotoceldas
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
// state machine para eliminar rebotes de los pulsadores
void debounce(int pin) {
  b1_prev = b1;
  switch (b1) {
    case 0: // RESET
      b1 = 1;
      break;
    case 1:// leer valor y esperar que baje a low el estado (debido al rebote)
      value = digitalRead(pin);
      if (value == LOW) {
        b1 = 2;
      }
      break;
    case 2: // toma tiempo del ultimo rebote
      t_0_b1 = millis();
      b1 = 3;
      break;
    case 3:// lee nuevamente el valor y setea el tiempo 0
      value = digitalRead(pin);
      t_b1 = 0;
      if (value == HIGH) { // si el valor vuelve a alto significa que hubo un rebote vuelve al estado RESET
        b1 = 0;
      }
      if ((t_b1 - t_0_b1) > bounceTime) { // si paso el tiempo permitido de rebotes pasa a el siguiente estado
        b1 = 4;
      }
      break;
    case 4:// si aun permanece en alto significa que se presiono el boton
      value = digitalRead(pin);
      if (value == HIGH) {
        b1 = 5;
      }
      break;
    case 5: // determina la coordenada del pulsador oprimido y la envia por puerto serialS
      if (pin == bA1) {
        Serial.println("A1");
      } else if (pin == bA2) {
        Serial.println("A2");
      } else if (pin == bA3) {
        Serial.println("A3");
      } else if (pin == bA4) {
        Serial.println("A4");
      } else if (pin == bB1) {
        Serial.println("B1");
      } else if (pin == bB2) {
        Serial.println("B2");
      } else if (pin == bB3) {
        Serial.println("B3");
      } else if (pin == bB4) {
        Serial.println("B4");
      } else if (pin == bC1) {
        Serial.println("C1");
      } else if (pin == bC2) {
        Serial.println("C2");
      } else if (pin == bC3) {
        Serial.println("C3");
      } else if (pin == bC4) {
        Serial.println("C4");
      }
      b1 = 0;
      break;
  }
}
