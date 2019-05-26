float posXOri1, posYOri1;
float posXOri2, posYOri2;
float ancho, largo, lineV,lineH,lineH2, disV, disH;
int pox1,poy1;
int pox2,poy2;
int pox3,poy3;
int pox4,poy4;
int pox5,poy6;
int pox7,poy8;
int pox9,poy9;
int pox10,poy10;
int pox11,poy11;
int pox12,poy12;

void setup(){
//size(1900,800);
fullScreen();
//PImage fondo;
//fondo=loadImage("blueocean.jpg");
//image(fondo,0,0);
}

void draw(){
  
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
rect(posXOri1,posYOri1,ancho,largo);
//tablero jugador 2
rect(posXOri2,posYOri1,ancho,largo);

//lineas verticales J1
line(posXOri1+135,posYOri1,posXOri1+disV,lineV);
line(posXOri1+270,posYOri1,posXOri1+2*disV,lineV);
line(posXOri1+405,posYOri1,posXOri1+3*disV,lineV);

//lineas verticales J2
line(posXOri2+135,posYOri1,posXOri2+disV,lineV);
line(posXOri2+270,posYOri1,posXOri2+2*disV,lineV);
line(posXOri2+405,posYOri1,posXOri2+3*disV,lineV);

//lineas horizontales J1
line(posXOri1,posYOri1+disH,lineH,posYOri1+disH);
line(posXOri1,posYOri1+2*disH,lineH,posYOri1+2*disH);

//lineas horizontales J2
line(posXOri2,posYOri1+disH,lineH2,posYOri1+disH);
line(posXOri2,posYOri1+2*disH,lineH2,posYOri1+2*disH);

}
