float [] xs;
// = new float [10];     // Coordenadas x.
float [] ys;
// = new float [10];     // Coordenadas y.
int [] CircR;
// = new int [9];      // Radios de los círculos. 
float [] ts;
// = new float [9];     // Coordenadas t.
float [] tsI;
// = new float [9];    // Coordenadas t iniciales.
float [] tsC;
// = new float [9];    // Cambios en los t.
float [] tsL;
// = new float [9];    // Límites de los t (si existen).
boolean [] mc;
// = new boolean [9]; // Vector de muestras.
color [] cs = new color [9];

int [] aCircR = new int [9];
float [] atsI = new float [9];
float [] atsC = new float [9];
boolean [] amc = new boolean [9];

Menu men;
ScrollB scrll;
Button [] buttnL = new Button [2];
byte ind = 0;

byte nc = 9;

void setup () {
  men = new Menu ();
  scrll = new ScrollB (0, byte (1));
  buttnL [0] = new Button (byte (0), int (3.8*width/6), int (height*0.88), int (5.2*width/6), int (height*0.94), "Inicio");
  buttnL [1] = new Button (byte (1), int (width/15), int (height*0.92), int (width/15 + width/9), int (height*0.95), "Volver");
  background (0);
  //
  for (int i = 0; i < 9; i++) {
    aCircR [i] = 100;
    atsI [i] = 0;
    atsC [i] = 0.01;
    amc [i] = true;
  }
  atsC [2] = -0.01;
  cs [0] = #0000FF;
  cs [1] = #00FF00;
  cs [2] = #FF0000;
  cs [3] = #AA00AA;
  cs [4] = #AAAA00;
  cs [5] = #00AAAA;
  cs [6] = #009966;
  cs [7] = #996600;
  cs [8] = #660099;
  //
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

void mousePressed () {
  if (ind == 0) buttnL [0].mouseP ();
  if (ind == 10) buttnL [1].mouseP ();
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
          textSize (40);
          text ("Radio: " + aCircR [i-1], width/6 +30, height*0.38 + (i-1)*height*0.12);
          text ("Velocidad: " + atsC [i-1], width/6 +30, height*0.40 + (i-1)*height*0.12);
          text ("P. inicial: " + atsI [i-1], width/6 +30, height*0.42 + (i-1)*height*0.12);
          text ("Mostrar", width/6 +30, height*0.44 + (i-1)*height*0.12);
          fill (0);
          if (amc [i-1]) fill (0, 150, 0);
          stroke (200);
          rect (width/6+180, height*0.44 + (i-1)*height*0.12, 50, 40);
        }
        if (i >= 6) {
          text ("Círculo n° " + i + ":", 3.4*width/6, height*0.35 + (i-6)*height*0.12);
          textSize (40);
          text ("Radio: " + aCircR [i-6], 3.4*width/6 +30, height*0.38 + (i-6)*height*0.12);
          text ("Velocidad: " + atsC [i-6], 3.4*width/6 +30, height*0.40 + (i-6)*height*0.12);
          text ("P. inicial: " + atsI [i-6], 3.4*width/6 +30, height*0.42 + (i-6)*height*0.12);
          text ("Mostrar", 3.4*width/6 +30, height*0.44 + (i-6)*height*0.12);
          fill (0);
          if (amc [i-1]) fill (0, 150, 0);
          rect (3.4*width/6+180, height*0.44 + (i-6)*height*0.12, 50, 40);
        }
        fill  (200);
      }
      buttnL[0].display ();
      
      
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
      for (int i = 1; i < nc; i++) {
        fill (cs [i]);
        if (mc [0]) ellipse (xs [i], ys [i], 10, 10);
      }
      stroke (200);
      fill (200);
      text ("Radios: ", 300, height-200);
      text ("t iniciales: ", 300, height-160);
      text ("Dts: ", 300, height-120);
      //text ("Límites: ", width-500, height-80);
      for (int i = 0; i < nc; i++) {
        text (CircR [i], 460+100*i, height-200);
        text (tsI [i], 450+100*i, height-160);
        text (tsC [i], 450+100*i, height-120);
        //text (tsL [i], width-450+100*i, height-80);
      }
  
      for (int i = 0; i < nc; i++) {
        ts[i] += tsC [i];
      }
      buttnL [1].display ();
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
    fill (200);
    text (title, (x1+x2)/2, (y1+y2)/2+10);
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
          ts [i] = atsI [i];
          tsC [i] = atsC [i];
          mc [i] = amc [i];
        }
        background (0);
        ind = 10;
      } else if (indB == 1) {
        ind = 0;
        background  (0);
      }
    }
  }
}