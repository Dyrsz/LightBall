float [] xs;
// = new float [5];     // Coordenadas x.
float [] ys;
// = new float [5];     // Coordenadas y.
int [] CircR;
// = new int [4];      // Radios de los círculos. 
float [] ts;
// = new float [4];     // Coordenadas t.
float [] tsI;
// = new float [4];    // Coordenadas t iniciales.
float [] tsC;
// = new float [4];    // Cambios en los t.
float [] tsL;
// = new float [4];    // Límites de los t (si existen).
boolean [] mc;
// = new boolean [4]; // Vector de muestras.

int [] aCircR = new int [9];
float [] atsI = new float [9];
float [] atsC new float [9];
boolean [] amc = new boolean [9];

Menu men;
ScrollB scrll;
byte ind = 0;

byte nc = 9;

void setup () {
  men = new Menu ();
  scrll = new ScrollB (0, byte (1));
  background (0);
  /*
  CircR[0] = 300;
  CircR[1] = 200;
  CircR[2] = 100;
  CircR[3] = 50;
  tsC[0] = 0.01;
  tsC[1] = -0.01;
  tsC[2] = -0.03;
  tsC[3] = 0.03;
  ts[0] = 0;
  ts[1] = 0;
  ts[2] = 0;
  ts[3] = 0;
  mc[0] = false;
  mc[1] = true;
  mc[2] = true;
  mc[3] = true;
  for (int i = 0; i < 4; i++) tsI [i] = ts [i];
  */
  textSize (30);
}

void draw () {
  men.display (ind);
}

void mouseDragged  () {
  if (ind == 0) scrll.mouseD (mouseY, pmouseY);
}

void mouseReleased () {
  if (ind == 0) scrll.mouseR ();
}

float [] rot (float x, float y, float cx, float cy, float rad) {
  float[] ret = new float [2];
  x = x - cx;
  y = y - cy;
  ret [0] = x*cos(rad) - y*sin(rad) + cx;
  ret [1] = x*sin(rad) + y*cos(rad) + cy;
  return ret;
}

class Menu {
  Menu () {}
  
  void display (byte tind) {
    if (tind == 0) {
      background (0);
      scrll.display (tind);
      scrll.mascr (width/2+180, int (height*0.18), width/2+250, int (height*0.21));
      fill (200);
      textSize (100);
      textAlign (CENTER);
      stroke (150);
      text ("LightBall", width/2, height*0.1);
      textSize (70);
      text ("Parámetros", width/2, height*0.3);
      line (width/2-500, height*0.15, width/2+500, height*0.15);
      line (width/2-400, height*0.235, width/2+400, height*0.235);
      textAlign (LEFT);
      stroke (120);
      textSize (50);
      text ("Número de círculos: ", width/2-300, height*0.2);
      for (int i = 1; i <= nc; i++) {
        if (i < 6) {
          text ("Círculo n° " + i + ":", width/6, height*0.35 + (i-1)*height*0.12);
        }
        if (i >= 6) {
          text ("Círculo n° " + i + ":", 3.4*width/6, height*0.35 + (i-6)*height*0.12);
        }
      }
      
      
      
    } else if (tind == 10) {
      xs[0] = width/2;
      ys[0] = height/2;
      for (int i = 1; i < nc+1; i++) {
        xs[i] = rot (xs[i-1], ys[i-1] - CircR[i-1], xs[i-1], ys[i-1], ts[i-1])[0];
        ys[i] = rot (xs[i-1], ys[i-1] - CircR[i-1], xs[i-1], ys[i-1], ts[i-1])[1];
      }
      // El punto de giro, blanco.
      noStroke ();
      fill (250, 250, 250, 200);
      ellipse (xs [0], ys [0], 10, 10);
      // La primera azul.
      fill (0, 0, 200);
      if (nc <= 1) if (mc [0]) ellipse (xs [1], ys [1], 10, 10);
      // La segunda verde.
      fill (0, 200, 0);
      if (nc <= 2) if (mc [1]) ellipse (xs [2], ys [2], 10, 10);
      // La tercera roja.
      fill (200, 0, 0);
      if (nc <= 3) if (mc [2]) ellipse (xs [3], ys [3], 10, 10);
      // La cuarta amarilla.
      fill (200, 200, 0);
      if (nc <= 4) if (mc [3]) ellipse (xs [4], ys [4], 10, 10);
      // La quinta.
      fill (200, 0, 200);
      if (nc <= 5) if (mc [4]) ellipse (xs [5], ys [5], 10, 10);
      // La sexta.
      fill (0, 200, 200);
      if (nc <= 6) if (mc [5]) ellipse (xs [6], ys [6], 10, 10);
      // La séptima.
      fill (100, 0, 0);
      if (nc <= 7) if (mc [6]) ellipse (xs [7], ys [7], 10, 10);
      // La octava.
      fill (0, 100, 0);
      if (nc <= 8) if (mc [7]) ellipse (xs [8], ys [8], 10, 10);
      // La novena.
      fill (0, 0, 100);
      if (nc <= 9) if (mc [8]) ellipse (xs [9], ys [9], 10, 10);
      stroke (200);
      fill (200);
      text ("Radios: ", 300, height-200);
      text ("t iniciales: ", 300, height-160);
      text ("Dts: ", 300, height-120);
      //text ("Límites: ", width-500, height-80);
      for (int i = 0; i < nc; i++) {
        text (CircR [i], 450+100*i, height-200);
        text (tsI [i], 450+100*i, height-160);
        text (tsC [i], 450+100*i, height-120);
        //text (tsL [i], width-450+100*i, height-80);
      }
  
      for (int i = 0; i < 4; i++) {
        ts[i] += tsC [i];
      }
    }
  }
  
  //  ScrollB y Button deberían ser subclases de esta.
}

class ScrollB {
  int sic = 0;
  byte si = 0;
  boolean act = false;
  
  ScrollB (int tsic, byte tsi) {
    sic = tsic;
    si = tsi;
  }
  
  void display (byte tind) {
    if (tind == 0) {
      pushMatrix ();
        translate (0, sic);
        textAlign (LEFT);
        textSize (70);
        stroke (150);
        for (byte i = 1; i <= 9; i++) text (i, width/2+200, height*0.163+100*i);
      popMatrix ();
    }
  }
  
  void mascr (int x1, int y1, int x2, int y2) {
    fill (0);
    noStroke ();
    rect (0, 0, width, y1);
    rect (0, y2, width, height-y2);
    rect (0, 0, x1, height);
    rect (x2, 0, width-2, height);
  }
  
  void mouseD (int my, int myp) {
    if (si == 1) {
      if (!act) {
        if (height*0.15 < my && my < height*0.235) {
          act = true;
        }
      } else {
        if (my-myp > 0) {
          if (sic > -89*9) sic -= my - myp;
          if (sic < -89*9) sic = -88*9;
        } else {
          if (sic < 0) sic -= my - myp;
          if (sic > 0) sic = 0;
        }
      }
    }
  }
  
  void mouseR () {
    if (si == 1) if (act) {
      act = false;
      if (-50 <= sic && sic <= 0) nc = 1;
      for (int i = 2; i < 9; i++) if (-i*100+50 <= sic && sic <= -(i-1)*100+50) nc = byte (i);
      if (-850 <= sic && sic <= -750) nc = 9;
      sic = -(nc-1)*100;
    }
  }
}

class Button { // Hago un vector de botones.
  byte indB;
  int x1;
  int y1;
  int x2;
  int y2;
  String title;
  
  Button (byte tindB, int tx1, int ty1, int tx2, int ty2, String ttitle) {
    indB = tindB;
    x1 = tx1;
    y1 = ty1;
    x2 = tx2;
    y2 = ty2;
    title = ttitle;
  }
  
  void display () {
    fill (0);
    stroke (180);
    rect (x1, y1, x2-x1, y2-y1);
    textAlign (CENTER);
    textSize (30);
    text (title, (x1+x2)/2, (y1+y2)/2);
    textAlign (LEFT);
  }
  
  void mouseP () {
    if (x1 < mouseX && mouseX < x2 && y1 < mouseY && mouseY < y2) {
      if (indB == 0) {
        xs = new float [nc+1];
        ys = new float [nc+1];
        CircR = new int [nc];
        ts = new float [nc];
        tsI = new float [nc];
        tsC = new float [nc];
        mc = new boolean [nc];
        for (int i = 0; i < nc; i++) {
          CircR [i] = aCircR [i];
          tsI [i] = atsI [i];
          tsC [i] = atsC [i];
          mc [i] = amc [i];
        }
        ind = 10;
      }
    }
  }
}