

void setup() {
  size(1066, 800);
  background(255);
  pixelDensity(2);
  stroke(0);
  strokeWeight(6);
  rectMode(CENTER);
}


void draw() {
  stroke(0);
  line(width/2, 0, width/2, height);
  
  stroke(255,50,50);
  fill(255,100,100);
  
  float pillOneWidth = 60;
  float pillOne_x = width/4;
  float pillTwo_y = height/2;
  

  //curve(pillOne_x-10, pillTwo_y-10, pillOneWidth/2, pillTwo_y, pillOneWidth/2, pillTwo_y, pillOneWidth/2-10, pillTwo_y-10);
  rect(width/4, height/2, 60, 160, 30,30,30,30);
  stroke(255);
  point(pillOne_x-10, pillTwo_y-10);
  
  stroke(50,50,255);
  fill(100,100,255);
  //curve(x1, y1, x2, y2, x3, y3, x4, y4)
  rect(width/2+width/4,height/2,60,160, 30,30,30,30);
}