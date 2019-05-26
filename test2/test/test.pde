import processing.serial.*;

Serial serie1;
Serial serie2;
char value;

void setup() {
  size(200, 200);
  String port1 = "COM7";
  serie1 = new Serial(this, port1, 9600);
  String port2= "COM8";
  serie2 = new Serial(this, port2, 9600);
}

void draw() {
  fill(0);
}
void keyPressed() {
  if (key == 'a') {

    serie2.write('a');
    System.out.println("hola");
  }
  if (key =='c'){
    serie1.write('c');
  }
}
