

class PaintDrip {
  int stepSize;
  float radius;

  float[] x;
  float[] y;
  float[] randx;
  float[] randy;

  float centerX;
  float centerY;

  float acceleration;
  float maxSize; //maximum size of paint drip
  color paintColor;

  // constructor fucntion
  PaintDrip(float m) {
    this.stepSize = 15;
    this.radius = 30;

    this.x = new float[stepSize];
    this.y = new float[stepSize];
    this.randx = new float[stepSize];
    this.randy = new float[stepSize];

    //populate the arrays
    float angle = radians(360/float(this.stepSize));  //radians are same as degrees & float of 15 is number of curves
    //makes 15 points on a circle
    for (int i=0; i<this.stepSize; i++) {
      this.x[i] = cos(angle*i) * this.radius;
      this.y[i] = sin(angle*i) * this.radius;
    }

    // calculate new points
    for (int i=0; i<this.stepSize; i++) {
      this.randx[i] = random(-this.stepSize, this.stepSize);  // += is "add assign": The expression a += b is equivalent to a = a + b.
      this.randy[i] = random(-this.stepSize, this.stepSize);
      this.x[i] += randx[i];  // += is "add assign": The expression a += b is equivalent to a = a + b.
      this.y[i] += randy[i];
    }

    this.centerX = width/2;
    this.centerY = height/2;
    this.acceleration = 0.75; //controls speed of acceleration
    this.maxSize = m;

    colorMode(HSB);
    //this.paintColor =  color(random(255), 255*0.4, 255); //pastel color
    //this.paintColor =  color(random(255), 255*0.4, 100); //color
    //this.paintColor =  color(random(255), random(255), random(255)); //gaudy color
    //this.paintColor =  color(random(255), random(50), random(255)); //muted color
    //this.paintColor =  color(random(50), random(255), random(255)); //camouflage tiger colors
    this.paintColor =  color(random(50), random(200), random(255)); //camouflage tiger colors
  }

  void display() {
    stroke(this.paintColor);
    fill(this.paintColor);

    this.radius = this.radius + log(25)/this.acceleration;
    this.acceleration = this.acceleration + 0.05; // acceleration
    println(this.radius);

    if (this.radius > this.maxSize) {
      this.radius = this.maxSize;
    }

    float angle = radians(360/float(this.stepSize)); 
    for (int i=0; i<this.stepSize; i++) {
      x[i] = cos(angle*i) * this.radius;
      y[i] = sin(angle*i) * this.radius;
    }
    // calculate new points
    for (int i=0; i<this.stepSize; i++) {
      this.x[i] += this.randx[i];
      this.y[i] += this.randy[i];
    }

    beginShape();
    // start 
    curveVertex(this.x[this.stepSize-1]+this.centerX, this.y[this.stepSize-1]+this.centerY);  //curveVertex(x,y)
    // midpoints
    for (int i=0; i<this.stepSize; i++) {
      curveVertex(this.x[i]+this.centerX, this.y[i]+this.centerY);
    }
    curveVertex(this.x[0]+this.centerX, this.y[0]+this.centerY);
    // end 
    curveVertex(this.x[1]+this.centerX, this.y[1]+this.centerY);
    endShape();
  }
}