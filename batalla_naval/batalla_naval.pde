import processing.serial.*;

Serial jugador1;
Serial jugador2;

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
  //size(1920,1080);
  //fullScreen();
  //String port1 = "COM7";
  jugador1 = new Serial(this, Serial.list()[0], 9600);  
  jugador1.bufferUntil('\n');
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

  serialEvent(jugador1);
}

void serialEvent(Serial jugador1) {
  int barcrest = 4;
  String myString;

  while (barcrest >= 0) {
    //System.out.println(barcrest);
    jugador1.write(barcrest);
    barcrest--;
    //myString = jugador1.readString();
    //println(myString);
  }
  //if (myString != null) {
  //  // trim crap
  //  myString = trim(myString);
  //  //value1 = int(myString); //make string to integer
  //  println(myString);
  //}

  //int barcrest = 4;
  //String dataReading = " ";
  //String inString;

  //dataReading = jugador1.readString();
  //println(dataReading);

  //int inByte = jugador1.read();
  //println(inByte);

  //if (barcrest >= 0) {
  //  System.out.println(barcrest);
  //  jugador1.write(barcrest);
  //  barcrest--;
  //}

  //while (jugador1.available() > 0) {
  //  if (barcrest == 0) {
  //    inString = jugador1.readString();
  //    System.out.println(inString);
  //    //if (inString != null) {
  //    //  System.out.println(inString+" debería estar aqui");
  //    //} else {
  //    //  System.out.println("¿Que haces aqui fred?");
  //    //}
  //  }
  //}
}
