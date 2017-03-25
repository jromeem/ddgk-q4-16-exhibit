
int stepSize = 15; //changes amount of distortion
float radius = 300; //shape size
float centerX, centerY;

float[] x = new float[stepSize];    //intiates array with 15 slots for x
float[] y = new float[stepSize];    //intiates array with 15 slots for y

float[] randx = new float[stepSize];    
float[] randy = new float[stepSize];


void setup() {
 //size(displayWidth, displayHeight);
 size(800, 800);
 smooth();
 //noLoop();

 // initiate form
 centerX = width/2;   //middle of screen
 centerY = height/2;  //middle of screen

 //populate the arrays
 float angle = radians(360/float(15));  //radians are same as degrees & float of 15 is number of curves

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

 stroke(0, 50);
 background(255);
}

void draw() {
 drawOrganicShape(); //"calling" a function
}

//defining the function that draws the organic shape
void drawOrganicShape() {
 
 //makes 15 points on a circle
 radius -= 3;
 float angle = radians(360/float(15)); 
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
 for (int i=0; i<stepSize; i++) {    //loop that repeats 15 times
   curveVertex(x[i]+centerX, y[i]+centerY);  //curveVertex(x,y)
 }
 curveVertex(x[0]+centerX, y[0]+centerY);
 // end 
 curveVertex(x[1]+centerX, y[1]+centerY);
 endShape();
}