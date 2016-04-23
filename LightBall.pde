float [] xs = new float [5];   // Coordenadas x.
float [] ys = new float [5];   // Coordenadas y.
int [] CircR = new int [5];    // Radios de los círculos. 
float [] ts = new float [5];   // Coordenadas t.
float [] tsL = new float [5];  // Límites de los t (si existen).

void setup () {
  background (0);
}

void draw () {
  //background (0);
  xs[0] = width/2;
  ys[0] = height/2;
  CircR[1] = 500;
  CircR[2] = 300;
  CircR[3] = 200;
  CircR[4] = 100;
  for (int i = 1; i < 5; i++) {
    xs[i] = rot (xs[i-1], ys[i-1] - CircR[i], xs[i-1], ys[i-1], ts[i])[0];
    ys[i] = rot (xs[i-1], ys[i-1] - CircR[i], xs[i-1], ys[i-1], ts[i])[1];
  }
  // El punto de giro, blanco.
  fill (250, 250, 250, 200);
  ellipse (xs [0], ys [0], 10, 10);
  // La primera azul.
  fill (0, 0, 200);
  ellipse (xs [1], ys [1], 10, 10);
  // La segunda verde.
  fill (0, 200, 0);
  ellipse (xs [2], ys [2], 10, 10);
  // La tercera roja.
  fill (200, 0, 0);
  ellipse (xs [3], ys [3], 10, 10);
  // La cuarta amarilla.
  fill (200, 200, 0);
  ellipse (xs [4], ys [4], 10, 10);
  
  ts [1] += 0.005;
  ts [2] -= 0.01;
  ts [3] += 0.01;
  ts [4] -= 0.01;
  /*
  for (int i = 1; i < 5; i++) {
    ts[i] += 0.001;
  }
  */
}

float [] rot (float x, float y, float cx, float cy, float rad) {
  float[] ret = new float [2];
  x = x - cx;
  y = y - cy;
  ret [0] = x*cos(rad) - y*sin(rad) + cx;
  ret [1] = x*sin(rad) + y*cos(rad) + cy;
  return ret;
}