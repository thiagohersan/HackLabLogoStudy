import processing.opengl.*;

final int SIZEOFCUBE = 200;
Cube c;

void setup() {
  size(SIZEOFCUBE*2+20, SIZEOFCUBE*2+20, P3D);
  smooth();
  c = new Cube(SIZEOFCUBE);
  background(255);
}

void draw() {
  background(255);
  c.drawCube();
}

void mouseDragged() {
  c.setR(new PVector(map(mouseY-pmouseY, 0, height, 0, TWO_PI), map(mouseX-pmouseX, 0, width, 0, TWO_PI), 0));
}

