class Particula {
  Particula par=null;
  float s = 0;
  float vida = 1;
  float r=random(360);
  PVector posicion = new PVector(0, 0);
  PVector velocidad = new PVector(0, 0);
  PVector ac = new PVector(0, 0);
  PVector or_a = new PVector(0, 0);
  float tamaa = 20;
  color c;
  Particula nei = null;

  Particula(float x, float y, float tamm, color c) {
    posicion.x=x;
    posicion.y=y;
    this.tamaa = tamm;
    this.c=c;  
  }
  
  /////////
  void velo() {
    vida-=.03;
    velocidad.add(ac);
    velocidad.limit(20);
    velocidad.mult(.95);
    posicion.add(velocidad);
    ac.mult(0);
  }
  
  /////////
  void rd() {    
    pushMatrix();
    translate(posicion.x, posicion.y);
    rotate(radians(r));
    noStroke();
    fill(c, 10+vida*255);
    ellipse(0, 0, tamaa*2, tamaa*2);
    stroke(c, 10+vida*255);
    noFill();
    rect(0, 0, tamaa*6, tamaa*6);
    stroke(c, 10+vida*255);
    noFill();
    ellipse(0, 0, tamaa*4, tamaa*4);
    popMatrix();
  }
  
  ////////////////////////////
  void aFuerza(PVector fuerza) {
    ac.add(fuerza);
  }
}