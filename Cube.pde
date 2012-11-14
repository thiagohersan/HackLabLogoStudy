class Cube {
  private float rx, ry, rz;
  private ArrayList<PGraphics> faces;
  private int cubeSize;

  private color[] colorP = {
    color(255, 237, 000, 166), 
    color(000, 159, 227, 255), 
    color(000, 105, 180, 255), 
    color(230, 000, 126, 255), 
    color(199, 004, 123, 255), 
    color(000, 000, 000, 000)
  };

  private boolean needsGen;

  public Cube(int s_) {
    rx = random(0, TWO_PI);
    ry = random(0, TWO_PI);
    rz = random(0, TWO_PI);

    faces = new ArrayList<PGraphics>();
    cubeSize = s_;
    needsGen = true;

    for (int i=0; i<5; i++) {
      PGraphics c = createGraphics(cubeSize*2, cubeSize*2, OPENGL);
      faces.add(c);
    }
  }

  private void genCube() {
    // draw all 6 faces as flat boxes
    for (int i=0; i<faces.size(); i++) {
      PGraphics c = faces.get(i);
      c.beginDraw();
      c.smooth();
      c.background(255, 0);
      c.stroke(colorP[i]);
      c.fill(colorP[i]);
      c.translate(cubeSize, cubeSize, -cubeSize/2);
      c.rotateX(rx);
      c.rotateY(ry);
      c.rotateZ(rz);
      c.scale(cubeSize/2+cubeSize/4);
      c.beginShape(QUADS);
      if (i==0) {
        c.vertex(0, 0, 0);
        c.vertex(1, 0, 0);
        c.vertex(1, 1, 0);
        c.vertex(0, 1, 0);
      }
      else if (i==1) {
        c.vertex(0, 0, 1);
        c.vertex(1, 0, 1);
        c.vertex(1, 1, 1);
        c.vertex(0, 1, 1);
      }
      else if (i==2) {
        c.vertex(0, 0, 0);
        c.vertex(1, 0, 0);
        c.vertex(1, 0, 1);
        c.vertex(0, 0, 1);
      }
      else if (i==3) {
        c.vertex(1, 1, 0);
        c.vertex(0, 1, 0);
        c.vertex(0, 1, 1);
        c.vertex(1, 1, 1);
      }
      else if (i==4) {
        c.vertex(0, 0, 0);
        c.vertex(0, 0, 1);
        c.vertex(0, 1, 1);
        c.vertex(0, 1, 0);
      }
      else if (i==5) {
        c.vertex(1, 0, 0);
        c.vertex(1, 0, 1);
        c.vertex(1, 1, 1);
        c.vertex(1, 1, 0);
      }
      c.endShape();
      c.endDraw();
    }
    needsGen = false;
  }

  public void drawCube() {
    rx = random(0, TWO_PI);
    ry = random(0, TWO_PI);
    rz = random(0, TWO_PI);

    this.genCube();

    PImage t = createImage(cubeSize*2, cubeSize*2, ARGB);
    t.loadPixels();
    for (int i=0; i<(t.width*t.height); i++) {
      t.pixels[i] = color(255, 0);
    }
    t.updatePixels();

    for (int i=0; i<faces.size(); i++) {
      t.blend(faces.get(i), 0, 0, faces.get(i).width, faces.get(i).height, 0, 0, t.width, t.height, MULTIPLY);
    }
    image(t, 10, 10);
  }
}

