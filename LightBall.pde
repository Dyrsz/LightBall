float [] xs = new float [5];   // Coordenadas x.
float [] ys = new float [5];   // Coordenadas y.
int [] CircR = new int [4];    // Radios de los círculos. 
float [] ts = new float [4];   // Coordenadas t.
float [] tsI = new float [4];  // Coordenadas t iniciales.
float [] tsC = new float [4];  // Cambios en los t.
float [] tsL = new float [4];  // Límites de los t (si existen).

Menu men;
byte ind = 0;

byte nc = 1;

void setup () {
  men = new Menu ();
  background (0);
  CircR[0] = 300;
  CircR[1] = 200;
  CircR[2] = 100;
  CircR[3] = 50;
  tsC[0] = 0.008;
  tsC[1] = 0.032;
  tsC[2] = -0.02;
  tsC[3] = 0.01;
  ts[0] = 0;
  ts[1] = 0;
  ts[2] = 0;
  ts[3] = 0;
  for (int i = 0; i < 4; i++) tsI [i] = ts [i];
  textSize (30);
}

void draw () {
  men.display (ind);
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
      
      
    } else if (tind == 10) {
      xs[0] = width/2;
      ys[0] = height/2;
      for (int i = 1; i < 5; i++) {
        xs[i] = rot (xs[i-1], ys[i-1] - CircR[i-1], xs[i-1], ys[i-1], ts[i-1])[0];
        ys[i] = rot (xs[i-1], ys[i-1] - CircR[i-1], xs[i-1], ys[i-1], ts[i-1])[1];
      }
      // El punto de giro, blanco.
      noStroke ();
      fill (250, 250, 250, 200);
      ellipse (xs [0], ys [0], 10, 10);
      // La primera azul.
      fill (0, 0, 200);
      //ellipse (xs [1], ys [1], 10, 10);
      // La segunda verde.
      fill (0, 200, 0);
      ellipse (xs [2], ys [2], 10, 10);
      // La tercera roja.
      fill (200, 0, 0);
      ellipse (xs [3], ys [3], 10, 10);
      // La cuarta amarilla.
      fill (200, 200, 0);
      ellipse (xs [4], ys [4], 10, 10);
  
      stroke (200);
      fill (200);
      text ("Radios: ", width-600, height-200);
      text ("t iniciales: ", width-600, height-160);
      text ("Dts: ", width-600, height-120);
      //text ("Límites: ", width-500, height-80);
      for (int i = 0; i < 4; i++) {
        text (CircR [i], width-450+100*i, height-200);
        text (tsI [i], width-450+100*i, height-160);
        text (tsC [i], width-450+100*i, height-120);
        //text (tsL [i], width-450+100*i, height-80);
      }
  
      for (int i = 0; i < 4; i++) {
        ts[i] += tsC [i];
      }
    }
  }
}

class ScrollB () {
  int sic = 0;
  
  ScrollB (int tsic) {
    sic = tsic;
  }
  
  void display (int x1, int y1, int x2, int y2) {
    fill (0);
    noStroke ();
    rect (0, 0, width, y1);
    rect (0, y2, width, height-y2);
    rect (0, 0, x1, height);
    rect (x2, 0, width-2, height);
  }
  void mouseD (int mx, int my) {
    
  }
}