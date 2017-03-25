/*
--concept
 exquisite corpse direction
 as a designer, constraints are important components, i'd like to impose my own
 also an beginner's exploration of procedural emergence through iterative sketchs
 --rules
 0. choose a word to inform the direction of your exquisite corpse exploration
 1. choose one primitive shape to start your exploration with
 2. declare one ( or two ) variables to associate with your primitive shape
 3. choose one way to affect the variable attribute
 4. pass on to partner
 5. recieve sketch from partner
 decide between performing steps 6.1 + 6.1.2 || step 6.2 
 6.1 choose one additional primitive shape to add to your partner's sketch
 6.1.2 declare one variable to associate with the primitive shape you added to 
 the sketch you received
 OR
 6.2 declare one additional variable associated with your partner's chosen primitive shape 
 THEN
 7. determine what attribute the declared variable will represent
 8. choose one way to affect the variable attribute
 pass on to partner
 --prompt
 follow
 */
int ballDiam;
int ballSize;
float followAccel = 0;
float followXpos;
float followYpos;
int hue;
int tailLength = 10;
int[] xpos = new int[tailLength]; 
int[] ypos = new int[tailLength];
float theta;


float side2side = 0;
float speedSide = 2;
void setup() {
  size(960, 540);
  smooth();
  colorMode(HSB, 100);
  background (0, 0, 0);
  ballDiam = 50;
  ballSize = 1;

  hue = 0;
  theta = 0;

  followXpos = width/2;
  followYpos = height/2;

  // initilize the arrays to make the trailing tail
  for (int i = 0; i < tailLength; i++) {
    xpos[i] = width/2;
    ypos[i] = height/2;
  }
}
void draw() {
  trailTail();
  display();
  breath();
  follow(); 

  if (frameCount < 600) {
    saveFrame("exquisite-f####.png");
  } else {
    exit();
  }
}
void display() {
  strokeWeight(2);
  stroke(hue, 100, 100);
  fill(0, 0, 0, 50);

  float radius = map(ballDiam, 0, 100, 0, 200);
  float speed = map(ballDiam, 0, 100, 0, 3);

  side2side += speedSide;
  if (side2side > width || side2side < 0) {
    speedSide *= -1;
  }
  float xpos = width/2  + radius * cos(theta);
  float ypos = height/2  + radius * sin(theta);

  float xpos2 = side2side + 200 * -cos(theta);
  float ypos2 = height/2  + 200 * -sin(theta);

  theta += 0.1;

  ellipse(xpos2, ypos2, ballDiam, ballDiam);
  ellipse(xpos, ypos, ballDiam, ballDiam);

  //draw follower
  noStroke();
  fill(hue, 100, 100);
  //if the mouse leaves the follower behind, color it black so we can find it again
  float distance = dist(xpos, ypos, followXpos, followYpos);
  if (distance > 100) {
    fill(0, 0, 0);
  }
  hue++;
  //reset the hue if it goes too far
  if (hue > 100) {
    hue = 0;
  }
  //draw the follower
  fill(hue, 100, 100, 100);
  ellipse(xpos2, ypos2, 10, 10);
}
void breath() {
  ballDiam = ballDiam + ballSize;

  if (ballDiam > 100 || ballDiam <0) {
    ballSize = ballSize * -1;
  }
}
void follow() {
  float distance = dist(mouseX, mouseY, followXpos, followYpos);
  if (distance < 100) {
    followXpos = pmouseX;
    followYpos = pmouseY;
  }
}

void trailTail() {
  //shift values down in accordance with prior mouse position 
  for (int i = 0; i < tailLength - 1; i++) {
    xpos[i] = xpos[i + 1];
    ypos[i] = ypos[i + 1];
  }

  //set the X and Y positions
  xpos[tailLength - 1] = mouseX;
  ypos[tailLength - 1] = mouseY;

  //draw trailing tail
  for (int i=0; i<tailLength; i++) {
    noStroke();
    fill(255 - i*5);
    ellipse(xpos[i], ypos[i], i, i);
  }
}