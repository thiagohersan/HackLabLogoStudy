class Cube {
  private PVector rotation;
  private ArrayList<PGraphics> faces;
  private int cubeSize;

  private color[] colorP = {
    color(000, 000, 000, 000), 
    color(255, 237, 000, 166), 
    color(000, 159, 227, 255), 
    color(000, 105, 180, 255), 
    color(230, 000, 126, 255), 
    color(199, 004, 123, 255)
  };

  public Cube(int s_) {
    rotation = new PVector(random(0, TWO_PI), random(0, TWO_PI), random(0, TWO_PI));

    faces = new ArrayList<PGraphics>();
    cubeSize = s_;

    for (int i=0; i<6; i++) {
      PGraphics c = createGraphics(cubeSize*2, cubeSize*2, P3D);
      faces.add(c);
    }
  }

  private void genCube() {
    // first graphic is just a white rect
    PGraphics c = faces.get(0);
    c.beginDraw();
    c.background(255);
    c.smooth();
    c.endDraw();

    // draw all 6 faces as flat boxes
    for (int i=1; i<faces.size(); i++) {
      c = faces.get(i);
      c.beginDraw();
      c.background(255, 0);
      c.smooth();
      c.stroke(colorP[i]);
      c.fill(colorP[i]);
      c.translate(cubeSize, cubeSize, -cubeSize/2);
      c.rotateX(rotation.x);
      c.rotateY(rotation.y);
      c.rotateZ(rotation.z);
      c.scale(cubeSize/2+cubeSize/4);
      c.beginShape(QUADS);
      if (i==1) {
        c.vertex(0, 0, 0);
        c.vertex(1, 0, 0);
        c.vertex(1, 1, 0);
        c.vertex(0, 1, 0);
      }
      else if (i==2) {
        c.vertex(0, 0, 1);
        c.vertex(1, 0, 1);
        c.vertex(1, 1, 1);
        c.vertex(0, 1, 1);
      }
      else if (i==3) {
        c.vertex(0, 0, 0);
        c.vertex(1, 0, 0);
        c.vertex(1, 0, 1);
        c.vertex(0, 0, 1);
      }
      else if (i==4) {
        c.vertex(1, 1, 0);
        c.vertex(0, 1, 0);
        c.vertex(0, 1, 1);
        c.vertex(1, 1, 1);
      }
      else if (i==5) {
        c.vertex(0, 0, 0);
        c.vertex(0, 0, 1);
        c.vertex(0, 1, 1);
        c.vertex(0, 1, 0);
      }
      // this shouldn't happen
      else if (i==6) {
        c.vertex(1, 0, 0);
        c.vertex(1, 0, 1);
        c.vertex(1, 1, 1);
        c.vertex(1, 1, 0);
      }
      c.endShape();
      c.endDraw();
    }
  }

  public void drawCube() {
    this.genCube();

    PImage t = createImage(cubeSize*2, cubeSize*2, ARGB);
    t.copy(faces.get(0), 0, 0, faces.get(0).width, faces.get(0).height, 0, 0, t.width, t.height);

    for (int i=1; i<faces.size(); i++) {
      t.blend(faces.get(i), 0, 0, faces.get(i).width, faces.get(i).height, 0, 0, t.width, t.height, MULTIPLY);
    }
    image(t, 10, 10);
  }

  void setR(PVector pv) {
    rotation.add(pv);
  }
}

