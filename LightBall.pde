float t1 = 0;
float t1L = 2;

float t2 = -1;
float t2L = 1;

void setup () {
  background (0);
}

void draw () {
  pushMatrix ();
     translate (width/2, height/2);
     stroke (200);
     fill (0);
     ellipse (0,0, 400, 400);
     rotate (t1);
     pushMatrix  ();
        translate (0,-200);
        fill (0);
        ellipse (0,0,300,300);
        rotate  (t2);
        stroke (200);
        fill(200);
        ellipse (0, -300, 10,10);
     popMatrix  ();
  popMatrix ();
  if (t1 < t1L) t1+= 0.01;
  if (t2 < t2L) t2+= 0.01;
}

class circleG {
  
}