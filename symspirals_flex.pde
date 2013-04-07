/* symspirals_flex */
/* A fun exploration with symmtry that reacts to an Arduino-controleld flex sensor */
/* rfboyce@gmail.com */
/* 07 Apr 2013 */

import processing.serial.*;
Serial myPort;
int sval = 0;

Spiral[] spirals;
int sym = 8;
int maxSym = 20;

void setup(){
//  println(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600);
  // read bytes into a buffer until you get a newline:
  myPort.bufferUntil('\n');
  
  size(600, 600);
  background(0);
  spirals = new Spiral[maxSym];
  for (int i = 0; i < spirals.length; i++){
    spirals[i] = new Spiral(height/2);
  }
}

void draw(){
  background(0);
  sym = int(map(sval, 0, 255, 0, maxSym));
  for(int i = 0; i < sym; i++) {
    pushMatrix();
    translate(width/2,height/2);
    rotate(i*TWO_PI/sym);
    spirals[i].display(color(random(50, 255), random(50, 255), random(50, 255)));
    popMatrix();
  }
}

//void keyPressed(){
//  if (keyCode == UP){
//    sym++;
//    sym = constrain(sym, 1, maxSym);
//  }
//  else if (keyCode == DOWN){
//    sym--;
//    sym = constrain(sym, 1, maxSym);
//  }
//}

void serialEvent(Serial myPort) {

  // read a string from the serial port:
  String myString = myPort.readStringUntil('\n');
  myString = trim(myString);
  
 int sensors[]  = int(split(myString, ','));
 
 for (int i = 0; i < sensors.length; i++){
   print("sensor " + i + ": " + sensors[i] + "\t");
 }
 println();
 sval = sensors[0];
 
  myPort.write('A');
}

