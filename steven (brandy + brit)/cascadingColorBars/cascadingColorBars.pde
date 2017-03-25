import processing.serial.*;

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph
float inByte = 0;

PImage img;
PGraphics pg;
float wavelength = 125;

static float vert = 0;
static float horz = 0;
static float h = 0;
static float s = 255;
static float b = 100;
static float l = 5;
void setup(){
  size(displayWidth, displayHeight);
  noStroke();
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');
  colorMode(HSB, 255);
  background(0, 255, 0);
  img = loadImage("octopus.png");
  pg = createGraphics(displayWidth, displayHeight);
}
void draw(){


  noStroke();
  fill(h, s, b);
  //rect(horz, vert, width-inByte, height-inByte);
  rect(horz, vert, width/10, height-inByte);
  ellipse(horz-200, vert-200, 400-inByte, 400-inByte);
  fill(h-10, s, b-10);
  ellipse(horz-600, vert-400, 300-inByte, 300-inByte);
  vert += inByte;
  //vert += (abs(sin(frameCount/inByte)))+.5;
  b += 1;
  l += 1;
  if( vert > height){
    vert = 0;
    horz += 40;
    h += 3;
    l = 5;
  }
  if (horz > width){
    horz = 0;
  }
  if( h > 255)
    h = 0;
  if( b > 255)
    b = 200;
    
  float value = (abs(cos(frameCount/wavelength)))+.5;
  pg.beginDraw();  
  pg.image(img, 0, 0);
  pg.endDraw();
  image(pg,  inByte+10, inByte*value/1.5-height/3);
 

}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    inByte = float(inString);
    println(inByte);
    //inByte = map(inByte, 0, 1023, 0, height);
  }
}