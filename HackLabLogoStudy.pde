import processing.opengl.*;

Cube c;

void setup() {
  size(420, 420, P3D);
  smooth();
  c = new Cube(200);
  background(255);
}

void draw() {
  background(255);
  c.drawCube();
}

void mouseDragged() {
  c.setR(new PVector(map(mouseY-pmouseY, 0,height, TWO_PI,0), map(mouseX-pmouseX, 0, width, 0, TWO_PI), 0));
}

