int fill_color = 0;
PGraphics pg;

void setup() {
  size(1008, 500);
  background(255);
  pixelDensity(2);
  noStroke();
  pg = createGraphics(width, height, P2D);
}

void draw() {
  for (int i = 0; i < width; i += 36) {
    if (fill_color == 0)
      fill_color = 255;
    else
      fill_color = 0;
    fill(fill_color);
    rect(i,0,36,height);
  }
  
  pg.beginDraw();
  pg.background(255, 0);
  pg.noStroke();
  pg.fill(255);
  pg.ellipse(mouseX, mouseY, 200, 200);
  pg.endDraw();
  blend(pg, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
}