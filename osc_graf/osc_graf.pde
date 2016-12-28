import netP5.*;
import oscP5.*;
import controlP5.*;

ControlP5 cp5;
Grafico rotRaw;
OscP5 oscP5;
double rx, ry, rz;

void setup(){
  size(640, 480);
  frameRate(25);
  cp5 = new ControlP5(this);
  rotRaw = new Grafico(1024, 0, 0, width, height, 150, 4);
  oscP5 = new OscP5(this, "127.0.0.1",7000,0);
}

void draw(){
  background(0);
  rotRaw.drawGraf((float)rx, (float)ry, (float)rz);
}


void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */
  
  if(theOscMessage.checkAddrPattern("/Chordata")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("dddd")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      rx = theOscMessage.get(1).doubleValue();
      ry = theOscMessage.get(2).doubleValue();
      rz = theOscMessage.get(3).doubleValue();
      

      println(" values: "+rx+", "+ry+", "+rz);
      return;
    }  
  } 
  //println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
  println("### received an osc message. with typetag "+theOscMessage.typetag());
  
}