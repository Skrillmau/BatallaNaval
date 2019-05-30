import processing.serial.*;

Serial jugador1;
Serial jugador2;
int barcrest1 = 4;
int barcrest2 = 4;
ArrayList<Barco> barcosP1;
ArrayList<Barco> barcosP2;
int turno = 0;

PImage vS;
PImage fondo;
PImage J1;
PImage J2;
PImage BS;
PImage yTurn;
PImage yTurn2;

Barco barco1;
Barco barco2;
Barco barco3;
Barco barco4;
Barco barco5;
Barco barco6;
Barco barco7;
Barco barco8;

Matriz matJ1;
Matriz matJ2;

boolean mostrarYt = false;
boolean mostrarYt1 = false;

void setup() {
  //size(1280, 720);
  //size(1920,1080);
  fullScreen();
  fondo = loadImage("blueocean.jpg");
  background(fondo);
  BS = loadImage("Battleship.jpg");
  image(BS, width/2-360, 50); 
  J1 = loadImage("player1.jpg");
  image(J1, ((width/2)-635), ((height/2)-250), (J1.width/2)*1.25, (J1.height/2)*1.2); 
  J2 = loadImage("player2.jpg"); 
  image(J2, ((width/2)+300), ((height/2)-250)); 
  vS = loadImage("VS.jpg");
  image(vS, (width/2)-100, (height/2)-100, vS.width/2, vS.height/2);
  yTurn = loadImage("Turn.jpg");
  yTurn2 = loadImage("Turn.jpg");
  matJ1 = new Matriz(((width/2)-700), ((height/2)-150));
  matJ2 = new Matriz(((width/2)+250), ((height/2)-150));
  matJ1.draw();
  matJ2.draw();

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
  String port1 = "COM7";
  jugador1 = new Serial(this, port1, 9600);
  String port2= "COM8";
  jugador2 = new Serial(this, port2, 9600);
}

void draw() {
  background(fondo);
  image(BS, width/2-360, 50);
  image(J1, ((width/2)-635), ((height/2)-250), (J1.width/2)*1.25, (J1.height/2)*1.2); 
  image(J2, ((width/2)+300), ((height/2)-250)); 
  image(vS, (width/2)-100, (height/2)-100, vS.width/2, vS.height/2);
  matJ1.draw();
  matJ2.draw();
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
      mostrarYt = true;
      mostrarYt1 = false;
      if (mostrarYt) {
        image(yTurn, ((width/2)-580), height/2+250, yTurn.width*2, yTurn.height*2);
        mostrarYt = false;
      }
      playerTurn(jugador1, "P1");
    } else if (whosTurn().equals("P2")) {
      mostrarYt = false;
      mostrarYt1 = true;
      if (mostrarYt1) {
        image(yTurn2, ((width/2)+375), height/2+250, yTurn2.width*2, yTurn2.height*2);
        mostrarYt1 = false;
      }
      println("Turno del jugador2");
      playerTurn(jugador2, "P2");
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
