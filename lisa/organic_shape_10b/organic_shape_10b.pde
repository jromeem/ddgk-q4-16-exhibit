
int stepSize = 20; //changes amount of distortion
float radius = 220; //shape size
float centerX, centerY;

float[] x = new float[stepSize];    //intiates array with 15 slots for x
float[] y = new float[stepSize];    //intiates array with 15 slots for y

float[] randx = new float[stepSize];    
float[] randy = new float[stepSize];

float animation;

void setup() {
  //fullScreen();
  size(960, 540);
  smooth();
  animation = 0.2;

  // initiate form
  centerX = width/2;   //middle of screen
  centerY = height/2;  //middle of screen

  //populate the arrays
  float angle = radians(360/float(stepSize));  //radians are same as degrees & float of 15 is number of curves

  //makes 15 points on a circle
  for (int i=0; i<stepSize; i++) {
    x[i] = cos(angle*i) * radius;
    y[i] = sin(angle*i) * radius;
  }

  // calculate new points
  for (int i=0; i<stepSize; i++) {
    randx[i] = random(-stepSize, stepSize);  // += is "add assign": The expression a += b is equivalent to a = a + b.
    randy[i] = random(-stepSize, stepSize);
    x[i] += randx[i];  // += is "add assign": The expression a += b is equivalent to a = a + b.
    y[i] += randy[i];
  }

  //strokeWeight(0.75);
  background(0);
}

void draw() {
  drawOrganicShape(); //"calling" a function
  //stroke(random(255), random(255), random(255));
  fill(random(255));
  stroke(random(255));
  
  saveFrame("f####.png");
  
  if (mousePressed) {
    exit();
  }
}

void drawOrganicShape() { //defining the function that draws the organic shape
  //makes points on a circle
  radius = radius - animation;
  //reverses animation at 800 and 0
  if (radius > 320 || radius < -200) {
    animation = animation * -1;
  }

  float angle = radians(360/float(stepSize)); 
  for (int i=0; i<stepSize; i++) {
    x[i] = cos(angle*i) * radius;
    y[i] = sin(angle*i) * radius;
  }
  // calculate new points
  for (int i=0; i<stepSize; i++) {
    x[i] += randx[i];  // += is "add assign": The expression a += b is equivalent to a = a + b.
    y[i] += randy[i];
  }

  beginShape();
  // start 
  curveVertex(x[stepSize-1]+centerX, y[stepSize-1]+centerY);  //curveVertex(x,y)
  // midpoints
  for (int i=0; i<stepSize; i++) {    //loop that repeats
    curveVertex(x[i]+centerX, y[i]+centerY);  //curveVertex(x,y)
  }
  curveVertex(x[0]+centerX, y[0]+centerY);
  // end 
  curveVertex(x[1]+centerX, y[1]+centerY);
  endShape();
}