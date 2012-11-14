Cube c;

void setup() {
  size(420, 420,P2D);
  smooth();
  c = new Cube(200);
}

void draw() {
  background(255);
  c.drawCube();
  //line(0,0,random(width),random(height));
}

void mouseDragged() {
  c.setR(new PVector(map(mouseY-pmouseY, 0,height, TWO_PI,0), map(mouseX-pmouseX, 0, width, 0, TWO_PI), 0));
}

