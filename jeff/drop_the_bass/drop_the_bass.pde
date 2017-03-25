int pixel_count;
int[][][] points;
int[][][] cpoints;
float theta = 0.0;
float threshhold = 100;
int step = 0;
int cstep = 0;

void setup() {
  size(960, 540);
  int pixel_count = height*width;
  colorMode(RGB);
  points = new int[pixel_count/4000][3][2];
  for (int i = 0; i < points.length; i++) {
    points[i][0][0] = int(random(width+100)-50);
    points[i][1][0] = points[i][0][0];
    points[i][0][1] = int(random(height+100)-50);
    points[i][1][1] = points[i][0][1];
  }
  cpoints = new int[pixel_count/6000][3][2];
  for (int i = 0; i < cpoints.length; i++) {
    cpoints[i][0][0] = int(random(width+100)-50);
    cpoints[i][1][0] = cpoints[i][0][0];
    cpoints[i][0][1] = int(random(height+100)-50);
    cpoints[i][1][1] = cpoints[i][0][1];
  }
  frameRate(10);
  if (frameCount < 600) {
    saveFrame("f####.png");
  } else {
    exit();
  }
}

void draw() {
  background(0);
  draw_background_polys();
  draw_foreground_polys();
}

void draw_foreground_polys() {
  strokeWeight(2);
  colorMode(HSB);
  int c = int(random(255));
  stroke(c, 100, 100);
  for (int i = 0; i < 5; i++) {
    cstep++;
    cpoints[cstep][0][0] = int(random(width+100)-50);
    cpoints[cstep][0][1] = int(random(height+100)-50);
    if (cstep >= cpoints.length-1 ) {
      cstep = 0;
    }
  }
  for (int i = 0; i < cpoints.length; i++) {
    cpoints[i][1][0] = cpoints[i][0][0] + int(random(10)-5);
    cpoints[i][1][1] = cpoints[i][0][1] + int(random(10)-5);
    //point(cpoints[i][1][0], cpoints[i][1][1]);
  }
  for (int i = 0; i < cpoints.length; i++) {
    stroke(c+(random(20)-10), 255, 255);
    int lines[][][] = new int[20][2][2];
    int line_count = 0;
    for (int x = 0; x < cpoints.length; x++) {
      if (dist(cpoints[i][1][0], cpoints[i][1][1], cpoints[x][1][0], cpoints[x][1][1]) <= threshhold && line_count < 19) {
        line_count++;
        lines[line_count][0][0] = cpoints[i][1][0];
        lines[line_count][0][1] = cpoints[i][1][1];
        lines[line_count][1][0] = cpoints[x][1][0];
        lines[line_count][1][1] = cpoints[x][1][1];
      }
    }
    if (line_count >= 2) {
      for (int x = 0; x < lines.length; x++) {
        line(lines[x][0][0], lines[x][0][1], lines[x][1][0], lines[x][1][1]);
      }
    }
  }
  
  if (frameCount < 600) {
    saveFrame("f####.png");
  } else {
    exit();
  }
}

void draw_background_polys() {
  colorMode(RGB);
  stroke(50);
  strokeWeight(1);
  for (int i = 0; i < 10; i++) {
    step++;
    points[step][0][0] = int(random(width+100)-50);
    points[step][0][1] = int(random(height+100)-50);
    if (step >= points.length-1 ) {
      step = 0;
    }
  }
  for (int i = 0; i < points.length; i++) {
    points[i][1][0] = points[i][0][0] + int(random(10)-5);
    points[i][1][1] = points[i][0][1] + int(random(10)-5);
    //point(points[i][1][0], points[i][1][1]);
  }
  for (int i = 0; i < points.length; i++) {
    int lines[][][] = new int[25][2][2];
    int line_count = 0;
    for (int x = 0; x < points.length; x++) {
      if (dist(points[i][1][0], points[i][1][1], points[x][1][0], points[x][1][1]) <= threshhold && line_count < 20) {
        stroke(random(100));
        line_count++;
        lines[line_count][0][0] = points[i][1][0];
        lines[line_count][0][1] = points[i][1][1];
        lines[line_count][1][0] = points[x][1][0];
        lines[line_count][1][1] = points[x][1][1];
      }
    }
    if (line_count >= 1) {
      for (int x = 0; x < lines.length; x++) {
        line(lines[x][0][0], lines[x][0][1], lines[x][1][0], lines[x][1][1]);
      }
    }
  }
}