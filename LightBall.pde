float t1 = 0;
float t1L = 2*3.1416;

float t2 = -1;
float t2L = 1;

float x1 = 0;
float y1 = 0;

float x2 = 0;
float y2 = 0;

void setup () {
  background (0);
}

void draw () {
  //background (0);
  x1 = width/2;
  y1 = height/2;
  stroke  (200);
  fill (0);
  point (x1, y1);
  ellipse (rot (x1,y1-200,x1,y1,t1)[0],rot (x1,y1-200,x1,y1,t1)[1], 400, 400);
  if (t1 < t1L) t1+= 0.01;
  if (t2 < t2L) t2+= 0.01;
}

float [] rot (float x, float y, float cx, float cy, float rad) {
  float[] ret = new float [2];
  x = x - cx;
  y = y - cy;
  ret [0] = x*cos(rad) - y*sin(rad) + cx;
  ret [1] = x*sin(rad) + y*cos(rad) + cy;
  return ret;
}