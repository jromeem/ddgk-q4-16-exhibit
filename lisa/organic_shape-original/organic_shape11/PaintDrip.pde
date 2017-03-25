

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
  PaintDrip(float m, int s, float[] x, float[] y, float[] randx, float[] randy) {
    this.stepSize = s;
    this.centerX = width/2;
    this.centerY = height/2;
    this.acceleration = 0.5; //controls speed of acceleration
    this.maxSize = m;

    this.x = x;
    this.y = y;
    this.randx = randx;
    this.randy = randy;

    colorMode(HSB);
    this.paintColor =  color(random(255), 255*0.4, 255);
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