import processing.serial.*;
// Variables puerto serial
Serial jugador1;
Serial jugador2;
// variable sde puntaje y barcos restantes de cada jugador
int barcrest1 = 4;
int barcrest2 = 4;
int puntaje1=0;
int puntaje2=0;
//arreglos de barcos y disparos de cada jugador
ArrayList<Barco> barcosP1;
ArrayList<Barco> barcosP2;
ArrayList<Disparo> disparosP1;
ArrayList<Disparo> disparosP2;
int turno = 0;
//Variables de imaganes
PImage vS;
PImage fondo;
PImage J1;
PImage J2;
PImage BS;
PImage yTurn;
PImage yTurn2;
PImage Winner;
// variables pruebas barcos
Barco barco1;
Barco barco2;
Barco barco3;
Barco barco4;
Barco barco5;
Barco barco6;
Barco barco7;
Barco barco8;
// variables matriz jugador 1 y 2
Matriz matJ1;
Matriz matJ2;

boolean mostrarYt = false;
boolean mostrarYt1 = false;

String tBarco;
char co1;
char co2;
char co3;
char co4;

void setup() {
  //size(1280, 720);
  //size(1920,1080);
  // inicializar imagenes de fondo 
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
  Winner = loadImage("winner.png");
  // inicializar obtetos de matriz de cada jugador
  matJ1 = new Matriz(((width/2)-700), ((height/2)-150));
  matJ2 = new Matriz(((width/2)+250), ((height/2)-150));
  // mostrar ambas matrices
  matJ1.draw();
  matJ2.draw();

  barco1 = new Barco();
  barco1.setCoord1("A1");
  barco1.setImpacto1(true);

  barco1.setCoord2("A2");
  barco2 = new Barco();
  barco2.setCoord1("C4");
  barco2.setCoord2("B4");
  barco2.setImpacto1(true);
  barco2.setImpacto2(true);
  barco3 = new Barco();
  barco3.setCoord1("C2");
  barco3.setImpacto1(true);
  barco4 = new Barco();
  barco4.setCoord1("A3");
  barco4.setImpacto1(true);

  barco5 = new Barco();
  barco5.setCoord1("B3");
  barco5.setCoord2("B2");
  barco5.setImpacto2(true);
  barco5.setImpacto1(true);
  barco6 = new Barco();
  barco6.setCoord1("A3");
  barco6.setCoord2("A4");

  barco6.setImpacto2(true);
  barco6.setImpacto1(true);
  barco7 = new Barco();
  barco7.setCoord1("C4");
  barco7.setImpacto1(true);
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
  // inicializar arreglos de disparos
  disparosP1 = new ArrayList<Disparo>();
  disparosP2 = new ArrayList<Disparo>();
  // inicializar comunicacion serial de ambos jugadores
  String port1 = "COM7";
  jugador1 = new Serial(this, port1, 9600);
  String port2= "COM8";
  jugador2 = new Serial(this, port2, 9600);
}

void draw() {
  //dibujar imagenes de fondo
  background(fondo);
  image(BS, width/2-360, 50);
  image(J1, ((width/2)-635), ((height/2)-250), (J1.width/2)*1.25, (J1.height/2)*1.2); 
  image(J2, ((width/2)+300), ((height/2)-250)); 
  image(vS, (width/2)-100, (height/2)-100, vS.width/2, vS.height/2);
  matJ1.draw();
  matJ2.draw();
  // cargar matriz de disparos de cada jugador si ya tienen algun disparo registrado
  if (disparosP1.size() > 0) {
    matJ2.drawDisparos(disparosP1);
  }
  if (disparosP2.size() > 0) {
    matJ1.drawDisparos(disparosP2);
  }
  // ejecuta el metodo para cargar los barcos desde arduino de ambos jugadores
  if (barcrest1>0) {
    delay(1000);
    setUp(jugador1, "P1");
  }
  if (barcrest2>0) {
    delay(1000);
    setUp(jugador2, "P2");
  }
  //Verifica que ambos jugadores tengan 4 barcos e inicia el juego
  if (barcosP1.size() == 4 && barcosP2.size()==4) {
    delay(1000);
    //println(turno);
    //ejecuta metodo para saber si es el turno del player 1 o player 2
    if (whosTurn().equals("P1")) {
      for (int i = 0; i<barcosP1.size(); i++) {
        Barco barc = barcosP1.get(i);
        // obtener coordenadas para poner imagenes de los barcos 
        if (barc.getCord2().equals("")) { 
          tBarco = "uno";
          co1 = barc.getCord1().charAt(0);
          co2 = barc.getCord1().charAt(1);
          matJ1.coordM1(co1, Integer.parseInt(co2+""));
          matJ1.drawDisparos(disparosP2);
          matJ2.drawDisparos(disparosP1);
        } else {
          tBarco = "dos";
          co1 = barc.getCord1().charAt(0);
          co2 = barc.getCord1().charAt(1);
          co3 = barc.getCord2().charAt(0);
          co4 = barc.getCord2().charAt(1);
          matJ1.coordM2(co1, Integer.parseInt(co2+""), co3, Integer.parseInt(co4+""));
          matJ1.drawDisparos(disparosP2);
          matJ2.drawDisparos(disparosP1);
        }
      }
      mostrarYt = true;
      mostrarYt1 = false;
      if (mostrarYt) {
        image(yTurn, ((width/2)-580), (height/2)+250, yTurn.width*2, yTurn.height*2);
        mostrarYt = false;
      }      // verifica puntaje 1 punto = 1 impacto cuando el jugador llega a 6 puntos gana
      if (puntaje2 == 6) {        
        mostrarYt = false;
        mostrarYt1 = false;
        image(Winner, ((width/2)+375), (height/2)+250, Winner.width/2, Winner.height/2);
        noLoop();
      }
      // ejecuta el metodo de turno para el jugador 1
      playerTurn(jugador1, "P1");
    } else if (whosTurn().equals("P2")) {
      for (int i = 0; i<barcosP2.size(); i++) {
        // obtener coordenadas para poner imagenes de los barcos
        Barco barc = barcosP2.get(i);
        if (barc.getCord2().equals("")) { 
          tBarco = "uno";
          co1 = barc.getCord1().charAt(0);
          co2 = barc.getCord1().charAt(1);
          matJ2.coordM1(co1, Integer.parseInt(co2+""));
          matJ1.drawDisparos(disparosP2);
          matJ2.drawDisparos(disparosP1);
        } else {
          tBarco = "dos";
          co1 = barc.getCord1().charAt(0);
          co2 = barc.getCord1().charAt(1);
          co3 = barc.getCord2().charAt(0);
          co4 = barc.getCord2().charAt(1);
          matJ2.coordM2(co1, Integer.parseInt(co2+""), co3, Integer.parseInt(co4+""));
          matJ1.drawDisparos(disparosP2);
          matJ2.drawDisparos(disparosP1);
        }
      }
      mostrarYt = false;
      mostrarYt1 = true;
      if (mostrarYt1) {
        image(yTurn2, ((width/2)+375), (height/2)+250, yTurn2.width*2, yTurn2.height*2);
        mostrarYt1 = false;
      } // verifica puntaje 1 punto = 1 impacto cuando el jugador llega a 6 puntos gana
      if (puntaje1 == 6) {
        mostrarYt = false;
        mostrarYt1 = false;
        image(Winner, ((width/2)-580), (height/2)+250, Winner.width/2, Winner.height/2);
        noLoop();
      }
      // ejecuta el metodo de turno para el jugador 1
      playerTurn(jugador2, "P2");
    }
  }
}
// metodo de setup de los barcos, lee el puerto serial en espera de las coordenadas, crea los objetos con
// esas coordenadas y los agrega a el arraylist del jugador
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
// metodo para leer la coordenada del disparo del jugador que se encuentra en turno
void playerTurn(Serial player, String jugador) {
  player.write('u');
  String coordenadaDisparo="";
  String input = player.readStringUntil('\n');
  coordenadaDisparo = trim(input);
  //println(coordenadaDisparo);
  // verifica que no llegue null o vacio la coordenada 
  if (coordenadaDisparo!=null && !coordenadaDisparo.equals("")) {
    if (jugador.equals("P1")) {
      disparar("P1", coordenadaDisparo);
    } else if (jugador.equals("P2")) {
      disparar("P2", coordenadaDisparo);
    }
  }
}
// Metodo para crear objeto tipo disparo con la coordenada y el tipo (impacto o fallo) y lo agrega a 
// el arraylist de disparos de cada jugador
void disparar(String jugador, String coordenada) {
  Disparo disp;
  boolean impactoC1 = false;
  boolean impactoC2 = false;
  boolean fallo = false;
  int pos = 0;
  // agrega en la lista del jugador 1
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
      disp = new Disparo("impacto", coordenada);
      disparosP1.add(disp);
      puntaje1++;
      println("¡Impacto1 en: "+coordenada+"!");
    } else if (impactoC2) {
      barcosP2.get(pos).setImpacto2(true);
      disp = new Disparo("impacto", coordenada);
      disparosP1.add(disp);
      puntaje1++;
      println("¡Impacto2 en: "+coordenada+"!");
    } else if (fallo) {
      disp = new Disparo("fallo", coordenada);
      disparosP1.add(disp);
      println("¡Disparo en la coordenada "+coordenada+" fallo!");
    }
    matJ2.drawDisparos(disparosP1);
  }
  // agrega en la lista de disparos del jugador 2
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
      disp = new Disparo("impacto", coordenada);
      disparosP2.add(disp);
      puntaje2++;
      println("¡Impacto1 en: "+coordenada+"!");
    } else if (impactoC2) {
      barcosP1.get(pos).setImpacto2(true);
      disp = new Disparo("impacto", coordenada);
      disparosP2.add(disp);
      puntaje2++;
      println("¡Impacto2 en: "+coordenada+"!");
    } else if (fallo) {
      disp = new Disparo("fallo", coordenada);
      disparosP2.add(disp);
      println("¡Disparo en la coordenada "+coordenada+" fallo!");
    } 
    matJ1.drawDisparos(disparosP2);
  }
  turno++;
}
// metodo para verificar que jugador tiene el turno, par para jugador 1 el cual comienza
// e impar para jugador 2 
String whosTurn() {
  String itsTurn = "";
  if (turno%2 == 0) {
    itsTurn = "P1";
  } else if (turno%2 == 1) {
    itsTurn = "P2";
  }
  return itsTurn;
}
