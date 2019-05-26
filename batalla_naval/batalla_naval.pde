float posXOri1, posYOri1;
float posXOri2;
float posAleta, posGua;
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

fullScreen();
//PImage fondo;
//fondo=loadImage("blueocean.jpg");
//image(fondo,0,0);
}

void draw(){
  posXOri1=width/2-540;
  posYOri1=height/2-200;
  posXOri2=width/2+40;
  posAleta=135;
  posGua=130;
background(255);
rect(posXOri1,posYOri1,500,posGua);
rect(posXOri2,posYOri1,500,height/2);
line(posXOri1+posAleta,posYOri1,posXOri1+posAleta,height/2);
}
