class Matriz {
  int videoScale = 120;
  int desX, desY;
  String coordX, coordY;

  Matriz(int desvX, int desvY) {
    desX = desvX;
    desY = desvY;
  }

  void draw() {
    noFill();
    rect(50, 125, 530, 410);
    for (int i=0; i < 4; i++) {        
      if (i == 0) {
          coordX = i+"";
        }
      for (int j=0; j < 3; j++) {
        if (i == 0 && j == 0) {
          coordY = "A";
        } else if (i == 0 && j == 1) {
          coordY = "B";
        } else if (i == 0 && j == 2) {
          coordY = "C";
        }
        int x = i*videoScale;
        int y = j*videoScale;
        fill(255);
        rect(x+desX, y+desY, videoScale, videoScale);
        fill(0);
        text(coordX, x+desX+5, y+desY+15);
      }
    }
  }
}
