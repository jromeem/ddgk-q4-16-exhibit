  
PGraphics pg;
int slices = 12;
float angle = PI/slices;
PShape mySlice;
float radius;

void setup() {
  size(960, 540, P2D);
  pg = createGraphics(width, height);
  radius = min(width, height)/2*0.9;
  mySlice = createShape(); 
  background(0);
}

float offset = 0;
int count = 0;

void draw() {
  background(0);
  offset+=PI/180;
  
  pg.beginDraw();
  pg.colorMode(HSB, 100);
  pg.stroke(count, 100, 100);
  pg.strokeWeight(6);
  pg.line(pmouseX, pmouseY, mouseX, mouseY);
  pg.endDraw();
  //image(pg, 9, 30); 
  //image(pg, 51, 30);
  mySlice = createShape();
  mySlice.beginShape(TRIANGLE);
    mySlice.texture(pg);
    mySlice.noStroke();
    mySlice.vertex(0, 0, pg.width/2, pg.height/2);
    mySlice.vertex(cos(angle)*radius, sin(angle)*radius, cos(angle+offset)*radius+pg.width/2, sin(angle+offset)*radius+pg.height/2);
    mySlice.vertex(cos(-angle)*radius, sin(-angle)*radius, cos(-angle+offset)*radius+pg.width/2, sin(-angle+offset)*radius+pg.height/2);
  mySlice.endShape();

  translate(width/2, height/2);
  for (int i = 0; i < slices; i++) {
    rotate(angle*2);
    shape(mySlice);
  }
  
  count++;
  if(count > 100){
    count=0;
  }
  
  if (frameCount < 600) {
    saveFrame("kaleido-f####.png"); 
  } else {
    exit(); 
  }
}