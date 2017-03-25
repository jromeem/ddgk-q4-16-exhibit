float movement = 0;
float accel = 1;
float ellipseWidth = 150;
float ellipseHeight = 100;

float movement2 = 0;
float accel2 = 1;
float ellipseWidth2 = 150;
float ellipseHeight2 = 150;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(255);
  
  fill(0);
  float newWidth = constrain(ellipseWidth + movement, 0, width);
  float newHeight = constrain(ellipseHeight + movement, 0, width);
  ellipse(250, 250, newWidth, newHeight);
  movement = movement + log(100)/accel;
  accel = accel+0.05;
  
  if (frameCount > 100) {
    fill(255);
    float newWidth2 = constrain(ellipseWidth2 + movement2, 0, width);
    float newHeight2 = constrain(ellipseHeight2 + movement2, 0, width);
    ellipse(250, 250, newWidth2, newHeight2);
    movement2 = movement2 + log(100)/accel2;
    accel2 = accel2+0.05;
  }
  
  
}