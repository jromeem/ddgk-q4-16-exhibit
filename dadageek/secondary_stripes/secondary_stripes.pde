

color WHITE = color(255,255,255);
color BLACK = color(0,0,0);
color currentColor = BLACK;
boolean isBlack = true;
PGraphics pg;
float width_diff = 0.1;
float stripe_width = 36.0;
float moveStripes = 0;

float moveSecond = 0;

public void setup() {
  size(1008, 500);
  background(WHITE);
  noStroke();
  pg = createGraphics(width, height);
}

public void draw() {
  currentColor = BLACK;

  int numStripes = int(width/stripe_width + stripe_width);
  //float stripeDrawWidth = stripe_width * numStripes;
  for (int i = 0; i<numStripes; i++) {
    currentColor = (isBlack) ? WHITE : BLACK;
    fill(currentColor);
    rect(i*stripe_width+moveStripes, 0, stripe_width, height);
    isBlack = !isBlack;
  }

  if (stripe_width < 18 || stripe_width > 54) {
    width_diff *= -1.0;
  }

  moveStripes++;
  moveSecond+= 3;
  if (moveStripes > stripe_width*2) {
    moveStripes = 0;
  }

  //stripe_width += width_diff;

  pg.beginDraw();
  pg.background(255, 0);
  pg.noStroke();
  //pg.ellipse(mouseX, mouseY, 200, 200);
  pg.fill(255,255,255);
  pg.rect(moveSecond, 0, 30, height);
  pg.fill(0,0,0);
  pg.rect(moveSecond+30, 0, 30, height);
  pg.fill(255,255,255);
  pg.rect(moveSecond+60, 0, 30, height);
  //pg.rect(rectX, 0, 200, height);
  pg.endDraw();
  blend(pg, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
}