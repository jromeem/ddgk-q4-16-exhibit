PImage bkg;
PImage im;
PGraphics phyllo;
float theta = 0;
float radius = 0;
float invertSize = 0;
float speed = 0.5;
float invertMax = 640000000;

float black = 0;
float white = 255;
boolean isBlack = true;
void setup() {
  size(960, 540);
  //bkg = loadImage("black.jpg");
  //im = loadImage("two 500 color.jpg");
  phyllo = createGraphics(width, height);
  noStroke();
}

void draw() {

  if (isBlack) {
    background(white);
    fill(black);
  } else {
    background(black);
    fill(white);
  }

  float xpos = width/2  + cos(-theta);
  float ypos = height/2 + sin(-theta);

  ellipse(xpos, ypos, invertSize, invertSize);

  theta += 0.05;
  invertSize+=speed;
  speed*=1.2;

  if (invertSize > invertMax) {
    invertSize = 0;
    speed = 0.5;
    isBlack = !isBlack;
  }
  //translate(-width/2, -height/2);
  //image(bkg, mouseX, mouseY);
  //loadPixels();
  //im.loadPixels();
  //for (int i = 0; i < pixels.length; i++) {
  //  pixels[i] = pixels[i] ^ im.pixels[i] | 0xff000000;
  //}
  //updatePixels();
  drawPhyllo();
  blend(phyllo, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);


  if (frameCount < 600) {
    saveFrame("f####.png");
  } else {
    exit();
  }
}


/////////////////////////////////////////////////
/////////// Phyllo Section //////////////////////
/////////////////////////////////////////////////

int numFlorets = 1300;
float angleFloret = 137.5;
int scaleFloret = 15;

void drawPhyllo() {
  phyllo.beginDraw();
  //if (invertSize < 3000) {
  //  phyllo.background(255); 
  //} else {
  //  phyllo.background(0);
  //}
  phyllo.background(255);
  phyllo.translate(width/2, height/2);
  for (int i=0; i<numFlorets; i++) {
    float radius = scaleFloret*sqrt(i);
    float angle = i*angleFloret;

    float posx = radius*cos(angle);
    float posy = radius*sin(angle);

    //if (invertSize < 3000) {
    //  phyllo.fill(0);
    //} else {
    //  phyllo.fill(255);
    //}
    phyllo.fill(0);
    phyllo.ellipse(posx, posy, 10, 10);
  }
  angleFloret = angleFloret + 0.00002;
  phyllo.endDraw();
}