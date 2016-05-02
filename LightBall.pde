float [] xs;   // Coordenadas x.
float [] ys;   // Coordenadas y.
int [] CircR;  // Radios de los círculos. 
float [] ts;   // Coordenadas t.
float [] tsI;  // Coordenadas t iniciales.
float [] tsC;  // Cambios en los t.
float [] tsL;  // Límites de los t (si existen).
boolean [] mc; // Vector de muestras.
color [] cs = new color [9];

int [] aCircR = new int [9];
float [] atsI = new float [9];
float [] atsC = new float [9];
boolean [] amc = new boolean [9];

Menu men;
ScrollB scrll;
Button [] buttnL = new Button [56];
CheckBox [] chkB = new CheckBox [9];
byte ind = 0;

byte nc = 9;

// Falta arreglar los índices de los botones.

void setup () {
  men = new Menu ();
  scrll = new ScrollB (-(nc-1)*100, byte (1));
  buttnL [0] = new Button (byte (0), int (3.8*width/6), int (height*0.88), int (5.2*width/6), int (height*0.94), "Inicio");
  buttnL [1] = new Button (byte (1), int (width/15), int (height*0.92), int (width/15 + width/9), int (height*0.95), "Volver");
  background (0);
  Load ();
  for (int i = 0; i < 9; i++) {
    // aCircR [i] = 100;
    // atsI [i] = 0;
    // atsC [i] = 0.01;
    // amc [i] = true;
    if (i < 5) {
      buttnL [2+6*i] = new Button (byte (2+6*i), int (width/6+350), int (height*0.37 + i*height*0.12-11), int (width/6 +400), int (height*0.37+i*height*0.12+39), "+");
      buttnL [3+6*i] = new Button (byte (3+6*i), int (width/6+420), int (height*0.37 + i*height*0.12-11), int (width/6 +470), int (height*0.37+i*height*0.12+39), "-");
      buttnL [4+6*i] = new Button (byte (4+6*i), int (width/6+350), int (height*0.39 + i*height*0.12-11), int (width/6 +400), int (height*0.39+i*height*0.12+39), "+");
      buttnL [5+6*i] = new Button (byte (5+6*i), int (width/6+420), int (height*0.39 + i*height*0.12-11), int (width/6 +470), int (height*0.39+i*height*0.12+39), "-");
      buttnL [6+6*i] = new Button (byte (6+6*i), int (width/6+350), int (height*0.41 + i*height*0.12-11), int (width/6 +400), int (height*0.41+i*height*0.12+39), "+");
      buttnL [7+6*i] = new Button (byte (7+6*i), int (width/6+420), int (height*0.41 + i*height*0.12-11), int (width/6 +470), int (height*0.41+i*height*0.12+39), "-");
      
      chkB [i] = new CheckBox (byte (i), int (width/6+190), int (height*0.43 + i*height*0.12), int (width/6 + 230), int (height*0.43 + i*height*0.12) + 40, amc [i]);
    }
    if (i >= 5) {
      buttnL [2+6*i] = new Button (byte (2+6*i), int (3.4*width/6+350), int (height*0.37 + (i-5)*height*0.12-11), int (3.4*width/6 +400), int (height*0.37+(i-5)*height*0.12+39), "+");
      buttnL [3+6*i] = new Button (byte (3+6*i), int (3.4*width/6+420), int (height*0.37 + (i-5)*height*0.12-11), int (3.4*width/6 +470), int (height*0.37+(i-5)*height*0.12+39), "-");
      buttnL [4+6*i] = new Button (byte (4+6*i), int (3.4*width/6+350), int (height*0.39 + (i-5)*height*0.12-11), int (3.4*width/6 +400), int (height*0.39+(i-5)*height*0.12+39), "+");
      buttnL [5+6*i] = new Button (byte (5+6*i), int (3.4*width/6+420), int (height*0.39 + (i-5)*height*0.12-11), int (3.4*width/6 +470), int (height*0.39+(i-5)*height*0.12+39), "-");
      buttnL [6+6*i] = new Button (byte (6+6*i), int (3.4*width/6+350), int (height*0.41 + (i-5)*height*0.12-11), int (3.4*width/6 +400), int (height*0.41+(i-5)*height*0.12+39), "+");
      buttnL [7+6*i] = new Button (byte (7+6*i), int (3.4*width/6+420), int (height*0.41 + (i-5)*height*0.12-11), int (3.4*width/6 +470), int (height*0.41+(i-5)*height*0.12+39), "-");
      
      chkB [i] = new CheckBox (byte (i), int (3.4*width/6+190), int (height*0.43 + (i-5)*height*0.12), int (3.4*width/6+230), int (height*0.43 + (i-5)*height*0.12) + 40, amc [i]);
    }
  }
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
  if (ind == 0) {
    buttnL [0].mouseP ();
    for (byte i = 0; i < 9; i++) chkB [i].mouseP ();
    for (byte i = 2; i < 56; i++) buttnL [i]. mouseP ();
  }
  if (ind == 10) buttnL [1].mouseP ();
}

void mouseDragged  () {
  if (ind == 0) scrll.mouseD ();
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
        textSize (50);
        if (i < 6) {
          text ("Círculo n° " + i + ":", width/6, height*0.35 + (i-1)*height*0.12);
          textSize (40);
          text ("Radio: " + aCircR [i-1], width/6 +30, height*0.38 + (i-1)*height*0.12);
          text ("Velocidad: " + atsC [i-1], width/6 +30, height*0.40 + (i-1)*height*0.12);
          text ("P. inicial: " + atsI [i-1], width/6 +30, height*0.42 + (i-1)*height*0.12);
          text ("Mostrar", width/6 +30, height*0.44 + (i-1)*height*0.12);
        }
        if (i >= 6) {
          text ("Círculo n° " + i + ":", 3.4*width/6, height*0.35 + (i-6)*height*0.12);
          textSize (40);
          text ("Radio: " + aCircR [i-1], 3.4*width/6 +30, height*0.38 + (i-6)*height*0.12);
          text ("Velocidad: " + atsC [i-1], 3.4*width/6 +30, height*0.40 + (i-6)*height*0.12);
          text ("P. inicial: " + atsI [i-1], 3.4*width/6 +30, height*0.42 + (i-6)*height*0.12);
          text ("Mostrar", 3.4*width/6 +30, height*0.44 + (i-6)*height*0.12);
        }
        chkB [i-1].display ();
        for (int j = 0; j < 6; j++) buttnL [2+6*(i-1)+j].display ();
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
      for (int i = 1; i <= nc; i++) {
        fill (cs [i-1]);
        if (mc [i-1]) ellipse (xs [i], ys [i], 10, 10);
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
  
  void mouseD () {
    if (si == 1) {
      if (!act) {
        if (height*0.15 < mouseY && mouseY < height*0.235) {
          act = true;
        }
      } else {
        if (mouseY-pmouseY > 0) {
          if (sic > -89*9) sic -= mouseY - pmouseY;
          if (sic < -89*9) sic = -88*9;
        } else {
          if (sic < 0) sic -= mouseY - pmouseY;
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

class Button {
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
        Save ();
        ind = 0;
        background (0);
      } else {
        for (int i = 0; i < 9; i++) {
          if (indB == 2+6*i) {
            aCircR [i] += 10;
          } else if (indB == 3+6*i) {
            if (aCircR [i] > 0) aCircR [i] -= 10;
          } else if (indB == 4+6*i) {
            atsC [i] += 0.01;
          } else if (indB == 5+6*i) {
            atsC [i] -= 0.01;
          } else if (indB == 6+6*i) {
            atsI [i] += 0.01;
          } else if (indB == 7+6*i) {
            atsI [i] -= 0.01;
          }
        }
      }
    }
  }
}

class CheckBox {
  byte indC;
  int x1;
  int y1;
  int x2;
  int y2;
  boolean bolC;
  
  CheckBox (byte tindC, int tx1, int ty1, int tx2, int ty2, boolean tbolC) {
    indC = tindC;
    x1 = tx1;
    y1 = ty1;
    x2 = tx2;
    y2 = ty2;
    bolC = tbolC;
  }
  
  void display () {
    if (bolC) {
      stroke (180);
      fill (0);
      rect (x1, y1, x2-x1, y2-y1);
      fill (0, 150, 0);
      beginShape ();
        vertex (x1-5, (y2+y1)/2);
        vertex ((x1+x2)/2, y2+5);
        vertex (x2+10, y1-10);
        vertex ((x1+x2)/2, (y1+y2)/2 + 5);
      endShape ();
      fill (180);
    } else {
      stroke (180);
      fill (0);
      rect (x1, y1, x2-x1, y2-y1);
    }
  }
  
  void mouseP () {
    if (x1 < mouseX && mouseX < x2 && y1 < mouseY && mouseY < y2) bolC = !bolC;
    Actu (indC);
  }
  
  void Actu (byte tindC) {
    amc [tindC] = bolC;
  }
}

void Load () {
  String [] lR = loadStrings ("Radios.txt");
  String [] ltI = loadStrings ("Inicios.txt");
  String [] ltC = loadStrings ("Velocidades.txt");
  String [] lM = loadStrings ("Muestras.txt");
  for (int i = 0; i < 9; i++) {
    if (lR != null) {
      aCircR [i] = int (lR [i]);
    } else {
      aCircR [i] = 100;
    }
    if (ltI != null) {
      atsI [i] = float (ltI [i]);
    } else {
      atsI [i] = 0;
    }
    if (ltC != null) {
      atsC [i] = float (ltC [i]);
    } else {
      atsC [i] = 0.01;
    }
    if (lM != null) {
      amc [i] = boolean (lM [i]);
    } else {
      amc [i] = true;
    }
  }
}

void Save () {
  String [] sR = new String [9];
  String [] stI = new String [9];
  String [] stC = new String [9];
  String [] sM = new String [9];
  for (int i = 0; i < 9; i++) {
    sR [i] = str (aCircR [i]);
    stI [i] = str (atsI [i]);
    stC [i] = str (atsC [i]);
    sM [i] = str (amc [i]);
  }
  saveStrings ("Radios.txt", sR);
  saveStrings ("Inicios.txt", stI);
  saveStrings ("Velocidades.txt", stC);
  saveStrings ("Muestras.txt", sM);
}