int step = 0;
String[] phrases = new String[3];
int phrase = 0;
PImage img = createImage(960, 540, RGB);

void setup() {
  size(960, 540);
  background(0);
  phrases[0] = "WE'RE ALL IN THIS TOGETHER";
  phrases[1] = "CARE FOR EACH OTHER";
  phrases[2] = "LOVE WINS";
  img = get(0, 0, width, height);
}

void draw() {
  //background(0, 0, 0, 255);
  image(img, 0, 0);
  draw_heart(int(random(width+100)-200), int(random(height+100)-200), int(random(255)));
  img = get(0, 0, width, height);
  draw_text();
  
  saveFrame("f####.png");
  
  if (mousePressed) {
    exit();
  }
}

void draw_text() {
  textAlign(CENTER);
  colorMode(RGB);
  textSize(56);
  if (step < 200) {
    fill(255, 255, 255, step*2);
  } else {
    fill(255, 255, 255, 800-(step*2));
  }
  if (step == 400) {
    if (phrase >= 2) {
      phrase = 0;
    } else {
      phrase++;
    }
  }
  if (step > 400) {
    step = 0;
  } else {
    step++;
  }
  text(phrases[phrase], width/2, height/2);
}

void draw_heart(int x, int y, int h) {
  // https://forum.processing.org/one/topic/shape-heart.html
  colorMode(HSB);
  pushMatrix();
  smooth();
  noStroke();
  translate(x, y);
  int scale_amt = int(random(8))+1;
  scale(scale_amt);
  fill(h, 255, 255);
  beginShape();
  vertex(50, 15);
  bezierVertex(50, -5, 90, 5, 50, 45);
  vertex(50, 15);
  bezierVertex(50, -5, 10, 5, 50, 45);
  endShape();
  popMatrix();
}