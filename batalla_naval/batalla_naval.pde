import processing.serial.*;

Serial jugador1;
Serial jugador2;
int barcrest1 = 4;
int barcrest2 = 4;
ArrayList<Barco> barcosP1;
ArrayList<Barco> barcosP2;
int turno = 0;
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

Barco barco1;
Barco barco2;
Barco barco3;
Barco barco4;
Barco barco5;
Barco barco6;
Barco barco7;
Barco barco8;

void setup() {
  size(1280, 720);
  barco1 = new Barco();
  barco1.setCoord1("A1");
  barco1.setCoord2("A2");
  barco2 = new Barco();
  barco2.setCoord1("C4");
  barco2.setCoord2("B4");
  barco3 = new Barco();
  barco3.setCoord1("C2");
  barco4 = new Barco();
  barco4.setCoord1("A3");


  barco5 = new Barco();
  barco5.setCoord1("B3");
  barco5.setCoord2("B2");
  barco6 = new Barco();
  barco6.setCoord1("A3");
  barco6.setCoord2("A4");
  barco7 = new Barco();
  barco7.setCoord1("C4");
  barco8 = new Barco();
  barco8.setCoord1("A2");

  barcosP1 = new ArrayList<Barco>();
  barcosP1.add(barco1);
  barcosP1.add(barco2);
  barcosP1.add(barco3);
  barcosP1.add(barco4);

  barcosP2 = new ArrayList<Barco>();
  barcosP2.add(barco5);
  barcosP2.add(barco6);
  barcosP2.add(barco7);
  barcosP2.add(barco8);
  //size(1920,1080);
  //fullScreen();
  String port1 = "COM8";
  jugador1 = new Serial(this, port1, 9600);
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
  //if (barcrest1>0) {
  //  delay(1000);
  //  setUp(jugador1, "P1");
  //}
  //if (barcrest2>0) {
  //  delay(1000);
  //  setUp(jugador2, "P2");
  //}
  if (barcosP1.size() == 4 && barcosP2.size()==4) {
    delay(1000);
    println(turno);
    if (whosTurn().equals("P1")) {  
      println("Turno del jugador1");
      playerTurn(jugador1, "P1");
    } else if (whosTurn().equals("P2")) {  
      println("Turno del jugador2");
      //playerTurn(jugador2, "P2");
    }
  }
}

void setUp(Serial player, String jugador) {
  player.write('b'); 
  Barco barco;
  String coordenadas="";
  String input = player.readStringUntil('\n');
  coordenadas = trim(input);

  if (coordenadas!=null && !coordenadas.equals("")) {
    String[] coords = split(coordenadas, '-');
    barco = new Barco();

    for (int i = 0; i<coords.length; i++) {
      if (i == 0) {
        barco.setCoord1(coords[0]);
      }
      if (i == 1) {
        barco.setCoord2(coords[1]);
      }
    }

    if (jugador.equals("P1")) {
      barcosP1.add(barco);
      //println(barco.getCoords());
      barcrest1--;
    } else if (jugador.equals("P2")) {
      barcosP2.add(barco);    
      barcrest2--;
    }
    player.clear();
  }
}

void playerTurn(Serial player, String jugador) {
  player.write('u');
  String coordenadaDisparo="";
  String input = player.readStringUntil('\n');
  coordenadaDisparo = trim(input);
  println(coordenadaDisparo);

  if (coordenadaDisparo!=null && !coordenadaDisparo.equals("")) {
    if (jugador.equals("P1")) {
      disparar("P1", coordenadaDisparo);
    } else if (jugador.equals("P2")) {
      disparar("P2", coordenadaDisparo);
    }
  }
}

void disparar(String jugador, String coordenada) {
  boolean impactoC1 = false;
  boolean impactoC2 = false;
  boolean fallo = false;
  int pos = 0;

  if (jugador.equals("P1")) {
    for (int i = 0; i < barcosP2.size(); i++) {
      if (barcosP2.get(i).getCord1().equals(coordenada)) {
        impactoC1 = true;
        pos = i;
      } else if (barcosP2.get(i).getCord2().equals(coordenada)) {
        impactoC2 = true;
        pos = i;
      } else {
        fallo = true;
      }
    }
    if (impactoC1) {
      barcosP2.get(pos).setImpacto1(true);
      println("Impacto1 en: "+coordenada);
    } else if (impactoC2) {
      barcosP2.get(pos).setImpacto2(true);
      println("Impacto2 en: "+coordenada);
    } else if (fallo) {
      println(coordenada+" Vacia");
    }
  }
  if (jugador.equals("P2")) {
    for (int i = 0; i < barcosP1.size(); i++) {
      if (barcosP1.get(i).getCord1().equals(coordenada)) {
        impactoC1 = true;
        pos = i;
      } else if (barcosP1.get(i).getCord2().equals(coordenada)) {
        impactoC2 = true;
        pos = i;
      } else {
        fallo = true;
      }
    }
    if (impactoC1) {
      barcosP1.get(pos).setImpacto1(true);
      println("Impacto1 en: "+coordenada);
    } else if (impactoC2) {
      barcosP1.get(pos).setImpacto2(true);
      println("Impacto2 en: "+coordenada);
    } else if (fallo) {
      println(coordenada+" Vacia");
    }
  }
  turno++;
}

String whosTurn() {
  String itsTurn = "";
  if (turno%2 == 0) {
    itsTurn = "P1";
  } else if (turno%2 == 1) {
    itsTurn = "P2";
  }
  return itsTurn;
}
