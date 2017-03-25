
// number of drips
int numDrips = 15;
// storing all our drips here
PaintDrip[] drips = new PaintDrip[numDrips];
// storing all our frameCount values here
int[] dripTiming = new int[numDrips];

int stepSize = 15;
float[] x = new float[stepSize];
float[] y = new float[stepSize];
float[] randx = new float[stepSize];
float[] randy = new float[stepSize];

void setup() {
  size(960, 540);
  //pixelDensity(2);

  //populate the arrays
  float angle = radians(360/float(stepSize));  //radians are same as degrees & float of 15 is number of curves
  float radius = 30;
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

  // intializing our PaintDrip objects and our frameCounts
  for (int i=0; i<numDrips; i++) {
    drips[i] = new PaintDrip(385-i*5, stepSize, x, y, randx, randy); 
    dripTiming[i] = 25*i + int(random(250));
  }
}

void draw() {
  background(0);

  // drawing all our drips based on the frameCount
  for (int i=0; i<numDrips; i++) {
    if (frameCount > dripTiming[i]) {
      drips[i].display();
    }
  }
  
  if (frameCount < 1200) {
    saveFrame("f####.png");
  } else {
    exit();
  }
}