
// number of drips
int numDrips = 30;
// storing all our drips here
PaintDrip[] drips = new PaintDrip[numDrips];
// storing all our frameCount values here
int[] dripTiming = new int[numDrips];

void setup() {
  //fullScreen();
  size(960, 540);
  //pixelDensity(2);
  smooth();

  // intializing our PaintDrip objects and our frameCounts
  for (int i=0; i<numDrips; i++) {
    drips[i] = new PaintDrip(330-i*5); //this is where m (maxSize) is defined
    dripTiming[i] = 40*i;
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
  if (frameCount < 600) {
    saveFrame("f####.png");
  } else {
    exit();
  }
}