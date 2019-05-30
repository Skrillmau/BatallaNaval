class Matriz {
  int videoScale = 120;
  int desX, desY;
  String coordX;
  String coordY;

  Matriz(int desvX, int desvY) {
    desX = desvX;
    desY = desvY;
  }

  void draw() {
    fill(150);
    for (int i=0; i < 4; i++) {            
      for (int j=0; j < 3; j++) {
        int x = i*videoScale;
        int y = j*videoScale;

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
        rect(x+desX, y+desY, videoScale, videoScale);
        fill(255);
        textSize(12);
        text(coordX, x+desX+55, desY-7);
        text(coordY, desX-15, y+desY+55);
        noFill();
        //fill(0);
      }
    }
  }
}
