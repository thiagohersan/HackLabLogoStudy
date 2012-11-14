import processing.opengl.*;

final int SIZEOFCUBE = 200;
boolean needsDrawn;

Cube c;

void setup() {
  size(SIZEOFCUBE*2+20, SIZEOFCUBE*2+20, P3D);
  needsDrawn = true;
  c = new Cube(SIZEOFCUBE);
  background(255);
}

void draw() {
  if (needsDrawn == true) {
    background(255);
    smooth();
    needsDrawn = false;
    c.drawCube();
  }
}

void mouseReleased() {
  needsDrawn = true;
}

void keyReleased() {

}

