class Matriz {

  PImage B2pH;
  PImage B2pV;
  PImage B1pH;
  int escala = 120;
  int desX, desY;
  String coordX;
  String coordY;

  Matriz(int desvX, int desvY) {
    B2pH = loadImage("B2pH.png");
    B2pV = loadImage("B2pV.png");
    B1pH = loadImage("B1pH.jpg");
    desX = desvX;
    desY = desvY;
  }

  void draw() {
    fill(150);
    for (int i=0; i < 4; i++) {            
      for (int j=0; j < 3; j++) {
        int x = i * escala;
        int y = j * escala;

        if (i == 0) {
          coordX = "1";
        } else if (i == 1) {
          coordX = "2";
        } else if (i == 2) {
          coordX = "3";
        } else if (i == 3) {
          coordX = "4";
        }
        if (j == 0) {
          coordY = "A";
        } else if (j == 1) {
          coordY = "B";
        } else if (j == 2) {
          coordY = "C";
        }

        rect(desX-25, desY-25, 530, 410, 25);
        fill(color(100, 150, 250));
        rect(x+desX, y+desY, escala, escala);
        fill(255);
        textSize(12);
        text(coordX, x+desX+55, desY-7);
        text(coordY, desX-15, y+desY+55);
        noFill();
        //fill(0);
      }
    }
  }

  public void coordM1(char co, int pos2) {
    //mostrar barco de 1 posicion
    int pos1 = 0;
    pos2 -= 1;
    if (co =='A') {
      pos1 = 0;
    } else if (co == 'B') {
      pos1 = 1;
    } else if (co == 'C') {
      pos1 = 2;
    }
    for (int i = 0; i<3; i++) {
      if (pos1 == i) {
        for (int j = 0; j<4; j++) {
          if (pos2 == j) {
            int y = i*escala;
            int x = j*escala; 
            B1pH.resize(escala, escala);
            image(B1pH, x+desX, y+desY, escala, escala);
          }
        }
      }
    }
  }

  public void coordM2(char co, int pos2, char co3, int pos4) {
    //mostrar barco de 2 posiciones
    String posicionB="";
    int pos1 = 0; 
    int pos3 = 0;
    pos2 -= 1;    
    pos4 -= 1;

    if (co == co3) {
      posicionB = "horizontal";
      co3 = co;
    } else if (co != co3) {
      posicionB = "vertical";
    }

    if (co =='A') {
      pos1 = 0;
    } else if (co == 'B') {
      pos1 = 1;
    } else if (co == 'C') {
      pos1 = 2;
    }

    if (co3 =='A') {
      pos3 = 0;
    } else if (co3 == 'B') {
      pos3 = 1;
    } else if (co3 == 'C') {
      pos3 = 2;
    }

    if (posicionB.equals("horizontal")) {
      for (int i = 0; i<3; i++) {
        if (pos1 == i) {
          for (int j = 0; j<4; j++) {
            if (pos2 == j && j < 3) {
              int y = i*escala;
              int x = j*escala; 
              B2pH.resize(escala, escala);
              image(B2pH, x+desX, y+desY, escala*2, escala);
            }
          }
        }
      }
    } else if (posicionB.equals("vertical")) {
      for (int i = 0; i<3; i++) {
        if (pos3 == i && i<2) {
          for (int j = 0; j<4; j++) {
            if (pos4 == j) {
              int y = i*escala;
              int x = j*escala; 
              B2pV.resize(escala, escala);
              image(B2pV, x+desX, y+desY, escala, escala*2);
            }
          }
        }
      }
    }
  }

  void drawDisparos(ArrayList<Disparo> disparos) {
    char co1, co2;
    int pos1 = 0, pos2 =0;   

    for (Disparo disp : disparos) {
      //print
      if (disp.getStatus().equals("impacto")) {
        co1 = disp.getDisparo().charAt(0);
        co2 = disp.getDisparo().charAt(1);

        pos2 = Integer.parseInt(co2+"");
        pos2 -= 1;

        if (co1 =='A') {
          pos1 = 0;
        } else if (co1 == 'B') {
          pos1 = 1;
        } else if (co1 == 'C') {
          pos1 = 2;
        }

        for (int i = 0; i<3; i++) {
          if (pos1 == i) {
            for (int j = 0; j<4; j++) {
              if (pos2 == j) {
                int y = i*escala;
                int x = j*escala; 
                fill(255, 0, 0, 100);
                rect(x+desX, y+desY, escala, escala);
              }
            }
          }
        }
      } else if (disp.getStatus().equals("fallo")) {
        co1 = disp.getDisparo().charAt(0);
        co2 = disp.getDisparo().charAt(1);

        pos2 = Integer.parseInt(co2+"");
        pos2 -= 1;

        if (co1 =='A') {
          pos1 = 0;
        } else if (co1 == 'B') {
          pos1 = 1;
        } else if (co1 == 'C') {
          pos1 = 2;
        }
        for (int i = 0; i<3; i++) {
          if (pos1 == i) {
            for (int j = 0; j<4; j++) {
              if (pos2 == j) {
                int y = i*escala;
                int x = j*escala; 
                fill(255, 150);
                rect(x+desX, y+desY, escala, escala);
              }
            }
          }
        }
      }
    }
  }
}
