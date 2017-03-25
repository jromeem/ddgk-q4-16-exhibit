PGraphics barLayer;
Bar[] bars = new Bar[10];

void setup() {
  size(1066, 800);
  noStroke();

  barLayer = createGraphics(width, height);
  for (int i=0; i<bars.length; i++) {
    bars[i] = new Bar();
  }
  //blendMode(DIFFERENCE);
}

void draw() {
  background(0);

  //fill(255, 0, 0);
  //ellipse(width/2, height/2, 200, 200);

  drawBars();
  
  if (frameCount < 1200) {
      saveFrame("f####.png");
  } else {
      exit();
  }
}

void drawBars() {
  barLayer.beginDraw();
  barLayer.background(0);
  barLayer.noStroke();
  for (int i=0; i<bars.length; i++) {
    bars[i].display();
  }
  barLayer.endDraw();
  //image(barLayer, 0, 0);
  blend(barLayer, 0, 0, width, height, 0, 0, width, height, EXCLUSION);
}

class Bar {
  float barWidth;
  float posx;
  float speed;
  float opacity;
  Bar() {
    this.barWidth = random(5, 50);
    this.posx = map(this.barWidth, 5, 50, 0, width)+50;
    this.speed = map(this.barWidth, 5, 50, 5, 1);
    //this.opacity = map(this.barWidth, 5, 50, 50, 255);
    this.opacity = 255;
  }
  void moveAround() {
    float movement = -2*this.speed;
    this.posx = this.posx+movement;
    if (this.posx < 0-this.barWidth+1) {
      this.posx = width;
    }
  }
  void display() {
    this.moveAround();
    barLayer.fill(255, 255, 255, this.opacity);
    barLayer.rect(this.posx, 0, this.barWidth, height);
  }
}