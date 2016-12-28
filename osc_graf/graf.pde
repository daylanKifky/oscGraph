class Grafico {

  float[] xGraf, yGraf, zGraf;
  int x;
  int y; 
  int w; 
  int h; 
  float vScale;
  float hScale;

  Grafico(int lenght, int _x, int _y, int _w, int _h, float _vS, float _hS) {
    hScale= _hS;
    vScale=_vS;
    x = _x; 
    y = _y; 
    w = _w; 
    h = _h; 
    xGraf = new float[lenght];
    yGraf = new float[lenght];
    zGraf = new float[lenght];
    cp5.addSlider("hScale")
     .setValue(hScale)
     .setPosition(x+w/20,y+h-h/10)
     .setRange(0,8) 
     .plugTo(this);
     ;
     cp5.addSlider("vScale")
     .setValue(vScale)
     .setPosition(x+w/20,y+h-h/5)
     .setRange(vScale*0.1,vScale*3) 
     .plugTo(this);
     ;
    
    
  }

  void drawGraf ( float _xVal, float _yVal, float _zVal) {

    float xVal = _xVal; 
    float yVal = _yVal; 
    float zVal = _zVal;
    


    strokeWeight(1);
    //X
    stroke(255, 0, 0);
    for (int i = w-1; i>0; i--) {
      line(x+w-(hScale*i) , h/2 + xGraf[i]*vScale, x+w-(i-1)*hScale, h/2 + xGraf[i-1]*vScale); 
      xGraf[i] = xGraf[i-1];
    }
    xGraf [0] = xVal;

    //Y
    stroke(0, 255, 0);
    for (int i = w-1; i>0; i--) {
      line(x+w-(hScale*i), h/2 + yGraf[i]*vScale , x+w-(i-1)*hScale , h/2 + yGraf[i-1]*vScale); 
      yGraf[i] = yGraf[i-1];
    }
    yGraf [0] = yVal;
    //Y
    stroke(0, 0, 255);
    for (int i = w-1; i>0; i--) {
      line(x+w-(hScale*i), h/2 + zGraf[i]*vScale, x+w-(i-1)*hScale, h/2 + zGraf[i-1]*vScale); 
      zGraf[i] = zGraf[i-1];
    }
    zGraf [0] = zVal;
    //ejes
    stroke(255);
    strokeWeight(1);
    line( x+w/20, y, x+w/20, y+h);
    line( x, y+h/2, x+w, y+h/2);
  }
}
/* for (int i = num-1; i > 0; i--) {
 x[i] = x[i-1];
 y[i] = y[i-1];
 }
 // Add the new values to the beginning of the array
 x[0] = mouseX;
 y[0] = mouseY;
 // Draw the circles
 for (int i = 0; i < num; i++) {
 ellipse(x[i], y[i], i/2.0, i/2.0);
 }
 }*/