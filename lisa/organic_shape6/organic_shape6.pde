int stepSize = 2; //changes amount of distortion
float radius = 170; //shape size
float centerX, centerY;
float[] x = new float[15];    //intiates array with 15 slots for x
float[] y = new float[15];    //intiates array with 15 slots for y


void setup() {
  //size(displayWidth, displayHeight);
  fullScreen();
  //smooth();
  pixelDensity(2);
  //noLoop();

  // initiate form
  centerX = width/2;   //middle of screen
  centerY = height/2;  //middle of screen

  //populate the arrays
  float angle = radians(360/float(15));  //radians are same as degrees & float of 15 is number of curves

  for (int i=0; i<15; i++) {
    x[i] = cos(angle*i) * radius;
    y[i] = sin(angle*i) * radius;
  }

  stroke(255, 25);
  background(0);
}

void draw() {
  drawOrganicShape(); //"calling" a function
}

//defining the function that draws the organic shape
void drawOrganicShape() {

  // calculate new points
  for (int i=0; i<15; i++) {
    x[i] += random(-stepSize, stepSize);  // += is "add assign": The expression a += b is equivalent to a = a + b.
    y[i] += random(-stepSize, stepSize);
  }


  noFill();

  beginShape();
  // start 
  curveVertex(x[15-1]+centerX, y[15-1]+centerY);  //curveVertex(x,y)
  // midpoints
  for (int i=0; i<15; i++) {    //loop that repeats 15 times
    curveVertex(x[i]+centerX, y[i]+centerY);  //curveVertex(x,y)
  }
  curveVertex(x[0]+centerX, y[0]+centerY);
  // end 
  curveVertex(x[1]+centerX, y[1]+centerY);
  endShape();
}