import processing.serial.*;

Serial jugador1;
Serial jugador2;
int barcrest = 4;
ArrayList<Barco> barcosP1;
Barco[] barcosP2 = new Barco[4];
float posXOri1, posYOri1;
float posXOri2, posYOri2;
float ancho, largo, lineV, lineH, lineH2, disV, disH;
int pox1, poy1;
int pox2, poy2;
int pox3, poy3;
int pox4, poy4;
int pox5, poy6;
int pox7, poy8;
int pox9, poy9;
int pox10, poy10;
int pox11, poy11;
int pox12, poy12;

void setup() {
  size(1280, 720);
  barcosP1 = new ArrayList<Barco>(4);
  //size(1920,1080);
  //fullScreen();
  String port1 = "COM8";
  jugador1 = new Serial(this, port1, 9600);  
  //jugador1.bufferUntil('\n');
  //String port2= "COM8";
  //jugador2 = new Serial(this, port2, 9600);
  //PImage fondo;
  //fondo=loadImage("blueocean.jpg");
  //image(fondo,1920,1080);
}

void draw() {
  posXOri1=(width/2)-640;
  posYOri1=(height/2)-200;
  posXOri2=(width/2)+140;

  disV=135;
  disH=135;
  ancho=540;
  largo=400;

  lineV=posYOri1+400;
  lineH=posXOri1+540;
  lineH2=posXOri2+540;

  background(255);
  stroke(100);
  //tablero jugador 1
  rect(posXOri1, posYOri1, ancho, largo);
  //tablero jugador 2
  rect(posXOri2, posYOri1, ancho, largo);

  //lineas verticales J1
  line(posXOri1+135, posYOri1, posXOri1+disV, lineV);
  line(posXOri1+270, posYOri1, posXOri1+2*disV, lineV);
  line(posXOri1+405, posYOri1, posXOri1+3*disV, lineV);

  //lineas verticales J2
  line(posXOri2+135, posYOri1, posXOri2+disV, lineV);
  line(posXOri2+270, posYOri1, posXOri2+2*disV, lineV);
  line(posXOri2+405, posYOri1, posXOri2+3*disV, lineV);

  //lineas horizontales J1
  line(posXOri1, posYOri1+disH, lineH, posYOri1+disH);
  line(posXOri1, posYOri1+2*disH, lineH, posYOri1+2*disH);

  //lineas horizontales J2
  line(posXOri2, posYOri1+disH, lineH2, posYOri1+disH);
  line(posXOri2, posYOri1+2*disH, lineH2, posYOri1+2*disH);
  if (barcrest>0) {

    delay(1000);
    setUp(jugador1);
  }
  //if (barcrest==0) {
  //  String input = jugador1.readStringUntil('\n');
  //  input = trim(input);
  //  System.out.println(input);
  //}
}

void setUp(Serial player) {
  jugador1.write('b'); 
  Barco barco;
  String coordenadas="";
  String input = player.readStringUntil('\n');
  coordenadas = trim(input);
  //System.out.println(coordenadas);
  if (coordenadas!=null&&!coordenadas.equals("")) {
    //

    String[] coords = split(coordenadas, '-');
    //System.out.println(coords[0]);
    barco = new Barco();
    for (int i = 0; i<coords.length; i++) {   
      //barco.setCoords(coords[i]);
      if (i == 0) {
        barco.setCoord1(coords[0]);
      }
      if (i == 1) {
        barco.setCoord2(coords[1]);
      }
    }
    //println(barco.getCoords());
    barcosP1.add(barco);
    System.out.println(barcosP1.get(0).getCoords());
    barcrest--;
  }
  if (barcrest==0) {
    System.out.println("chokoesputo");
    for (Barco bar : barcosP1) {
      System.out.println(bar.getCoords());
    }

    player.write(barcrest);
  }
}
