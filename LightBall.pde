float t1 = 0;
float t1L = 2;

float t2 = -1;
float t2L = 1;

float x = 400;
float y = 400;

void setup () {
  background (0);
}

void draw () {
  background (0);
  stroke (200);
  fill (0);
  point (400, 400);
  ellipse (rot (x,y,400,400,t1)[0],rot (x,y,400,400,t1)[1], 400, 400);
  if (t1 < t1L) t1+= 0.01;
  if (t2 < t2L) t2+= 0.01;
}

float [] rot (float x, float y, float cx, float cy, float rad) {
  float[] ret = new float [2];
  ret [0] = x * cos (rad) + cx;
  ret [1] = y * sin (rad) + cy;
  return ret;
}