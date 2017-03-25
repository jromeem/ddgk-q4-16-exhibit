int norm_size = 300;
int ball_count = 0;
PImage img = createImage(1066, 800, RGB);
Ball ball = new Ball(random(1066), random(800));
int mode = MULTIPLY;

void setup() {
  noStroke();
  size(960, 540);
  background(255);
  img = get(0, 0, width, height);
  frameRate(15);
  colorMode(HSB);
}

void draw() {
  blendMode(REPLACE);
  background(255);
  image(img, 0, 0);
  blendMode(mode);
  ball.draw();
  if (ball.h <= 250) {
    ball.h = ball.h + 63;
  } else {
    img = get(0, 0, width, height);

    if (random(100) > 50) {
      mode = MULTIPLY;
    } else {
      mode = LIGHTEST;
    }
    ball = new Ball(constrain(random(width), width/10, width/10*9), constrain(random(height), height/10, height/10*9));
    ball_count++;
  }
  
  if (frameCount < 600) {
    saveFrame("f####.png");
  } else {
    exit();
  }
  // Additional image manipulation can be done here and not stick from draw to draw.
}



class Ball {
  float posx;
  float posy;
  float c;
  float h;
  float[][] steps = new float[5][2];

  Ball(float x, float y) {
    c = random(255);
    h = 0;
    posx = x;
    posy = y;
    steps[0][0] = norm_size;
    steps[0][1] = 5;
    steps[1][0] = steps[0][0] - constrain(random(40), 20, 40);
    steps[1][1] = 10;
    steps[2][0] = steps[1][0] - constrain(random(60), 40, 60);
    steps[2][1] = 20;
    steps[3][0] = steps[2][0] - constrain(random(80), 60, 80);
    steps[3][1] = 20;
    steps[4][0] = steps[3][0] - constrain(random(100), 80, 100);
    steps[4][1] = 20;
  }

  void draw() {
    for (int i = 0; i < steps.length; i++) {
      fill(255, 255, 255, 0);
      stroke(c, h, 255);
      strokeWeight(steps[i][1]);
      if (i < steps.length-1) {
        ellipse(posx, posy, steps[i][0], steps[i][0]);
      } else {
        noStroke();
        fill(c, h, 255);
        ellipse(posx, posy, steps[i][0]-10, steps[i][0]-10);
      }
    }
  }
}