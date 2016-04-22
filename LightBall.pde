float t = 0;

void setup () {
  background (0);
}

void draw () {
  pushMatrix ();
  translate (width/2, height/2);
  rotate (t);
  stroke (200);
  fill (0);
  ellipse (0, 0, 400, 400);
  fill(200);
  ellipse (0, -200, 10,10);
  popMatrix ();
  t+= 0.01;
}

class circleG {
  
}