
//PRESION/USE MOUSE o_o
ArrayList<Particula> parte;
PVector g = new PVector(0, .3);
float colorn=random(255);
boolean r=false;
//////////////
void setup() {
  size(800, 850);
  smooth();
  background(1);
  frameRate(35);
  parte = new ArrayList();
}


//////
void draw() {
 noStroke();
 fill(1);
 rectMode(CORNER);
 rect(0,0, width, height);

  if (r) {
    ultimap=pintura(mouseX, mouseY, (pmouseX-mouseX)*.5, (pmouseY-mouseY)*.5, random(10), ultimap, true);
  }
  else {
    ultimap=null;
  }
  uParticulas();
}

//////////
void mousePressed() {
  r=true;
}
void mouseReleased() {
  r=false;
}

///////////
void rD(PVector vect, float t) {
  float xT = vect.x;
  vect.x = vect.x*cos(xT) - vect.y*sin(t);
  vect.y = xT*tan(t) + vect.y*cos(xT);
}

/////////
void uParticulas() {
  if (parte.size()>0) {
    int s = parte.size()-3;
    for (int i = s; i >= 0; i--) {
      Particula p = (Particula) parte.get(i);      
      p.velo();
      
      if (p.vida<0) {
       parte.remove(p);
      } 
      ////
      if (p.par!=null) {
        line(p.posicion.x, p.posicion.y, p.par.posicion.x, p.par.posicion.y);
      }
     
      if (p.vida<.6 && p.s<25 && parte.size()<500 && p.vida>.2) {
        p.s++;
        if (random(1)>.9) {//9

          PVector dir = p.or_a;
            dir.normalize();
           rD(dir, radians(random(45)-22.5));
          
          dir.mult(2);
          Particula np = pintura(p.posicion.x, p.posicion.y,dir.x, dir.y, p.tamaa*.9, p, false);
          np.s=p.s;
        }
      }
      p.rd();
    }
  }
}

///////////////////////////////////////////
Particula pintura(float x, float y, float dx, float dy, float tam, Particula pa, boolean pormouse) {
  float xx = x;
  float yy = y;
 
  colorn++;
  if (colorn>255) {
    colorn=0;
  }
  
  colorMode(HSB);
  color c = color(colorn, 200, 255); 
  Particula p = new Particula(xx, yy, tam, c);
  if (!pormouse) {
    p.c=pa.c;
  }

  p.velocidad.x=0;
  p.velocidad.y=0;
  p.ac.x=dx;
  p.ac.y=dy; 
  p.or_a.x = dx;
  p.or_a.y = dy;
  p.par=pa;
   
  if (dy == 0 && dx == 0) {
     dx=random(1)-.5; 
     dy=random(1)-.5;
  }

  parte.add(p);
  return p;
}

Particula ultimap=null;

/////////
void keyPressed() {

  if (key == 'a') {
    background(1);
    parte = new ArrayList();
  }
}