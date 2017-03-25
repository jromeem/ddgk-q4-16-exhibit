Spinner[] spinner;
int gridSize = 8;
float angleChange = 0.05;
int threshold = 200;


void setup() {
  size(960, 540);
  background(0);
  smooth();
  int cx = (width/gridSize) / 2;
  int cy = (height/gridSize) / 2;

  spinner = new Spinner[gridSize * gridSize];

  for (int i = 0; i < spinner.length; i++) {
    spinner[i] = new Spinner(cx, cy, ((width/gridSize) / 2), random(360));
    cx = cx + width/gridSize;
    if (cx > width) {
      cx = (width/gridSize) /2;
      cy = cy + height/gridSize;
    }
  }
  strokeWeight(3);
}

void draw() {
  background(0);
  //fill(65, 60, 31, 50);
  //noStroke();
  //rect(0,0,width,height);
  for (int i = 0; i < spinner.length; i++) {
    spinner[i].display();
    for (int j = 0; j < spinner.length; j++) {
      float dd = dist(spinner[i].xpos, spinner[i].ypos, spinner[j].xpos, spinner[j].ypos);
      float mappedDD = map(dd, 0, 200, 100, 0);
      colorMode(HSB, 100);
      
      stroke(j+50, 100, 100, mappedDD);
      if (dist(spinner[i].xpos, spinner[i].ypos, spinner[j].xpos, spinner[j].ypos) < threshold) {
        line(spinner[i].xpos, spinner[i].ypos, spinner[j].xpos, spinner[j].ypos);
      }
    }
  }
  //angleChange+=0.1;



  if (frameCount < 600) {
    saveFrame("f####.png");
  } else {
    exit();
  }
}

class Spinner {
  float xpos;
  float ypos;
  float rad;
  float angle;
  float cx;
  float cy;

  Spinner(float cx1, float cy1, float r, float a) {
    angle = a;
    rad = r;
    cx = cx1;
    cy = cy1;
  }

  void display() {
    angle = angle+angleChange;
    xpos = cx + sin(angle)*rad;
    ypos = cy + cos(angle)*rad;
    noStroke();
    fill(255);
    ellipse(xpos, ypos, 5, 5);
  }
}