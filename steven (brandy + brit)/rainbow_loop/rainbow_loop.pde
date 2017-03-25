int x = 0;
int y = 0;
int row = 0;
//color[] palette = {
// color(255, 10, 0),
 
//};
void setup() {
  size(600, 550);
  frameRate(600);
}
void draw() {
  //scale(random(.5, 2));
  scale(2);
  
  //color red1 = color(255,30,0);
  
  //for loop?
  pixelGradient(row + 0 % height, 172, 0, 40, 252, 56, 0);
  pixelGradient(row + (35 * 1)+1 % height, 252, 56, 0, 252, 184, 0);
  pixelGradient(row + (35 * 2)+1 % height, 252, 184, 0, 0, 184, 0);
  pixelGradient(row + (35 * 3)+1 % height, 0, 184, 0, 0, 120, 252);
  pixelGradient(row + (35 * 4)+1 % height, 0, 120, 252, 64, 40, 196);
  pixelGradient(row + (35 * 5)+1 % height, 64, 40, 196, 172, 0, 40);  
  pixelGradient(row + (35 * 6)+1 % height, 172, 0, 40, 252, 56, 0);  
  pixelGradient(row + (35 * 7)+1 % height, 252, 56, 0, 252, 184, 0);
  pixelGradient(row + (35 * 8)+1 % height, 252, 184, 0, 0, 184, 0);
  pixelGradient(row + (35 * 9)+1 % height, 0, 184, 0, 0, 120, 252);
  pixelGradient(row + (35 * 10)+1 % height, 0, 120, 252, 64, 40, 196);
  pixelGradient(row + (35 * 11)+1 % height, 64, 40, 196, 172, 0, 40);  
  pixelGradient(row + (35 * 12)+1 % height, 172, 0, 40, 252, 56, 40); 
  
  //pixelGradient(0, 1, 165, 214, 120, 218, 255);
  //pixelGradient((35 * 1)+1, 120, 218, 255, 120, 218, 255);
  //pixelGradient((35 * 2)+1, 120, 218, 255, 1, 165, 214);
  //pixelGradient((35 * 3)+1, 1, 165, 214, 120, 218, 255);
  //pixelGradient((35 * 4)+1, 120, 218, 255, 166, 221, 166);
  //pixelGradient((35 * 5)+1, 166, 221, 166, 166, 221, 166);  
  //pixelGradient((35 * 6)+1, 166, 221, 166, 29, 193, 33);  
  //pixelGradient((35 * 7)+1, 29, 193, 33, 166, 221, 166);
   
  row = row + 1;
  if (row >= height) { 
    row = 0; 
  }
}
void pixelGradient(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  line0(row + 0, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line1(row + 1, color1_r, color1_g, color1_b);
  line2(row + 2, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line1(row + 3, color1_r, color1_g, color1_b);
  line0(row + 4, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line1(row + 5, color1_r, color1_g, color1_b);
  line3(row + 6, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line1(row + 7, color1_r, color1_g, color1_b);
  line3(row + 8, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line1(row + 9, color1_r, color1_g, color1_b);
  line3(row + 10, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line4(row + 11, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line3(row + 12, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);
  line5(row + 13, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);  
  line3(row + 14, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);  
  line6(row + 15, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);    
  line3(row + 16, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);  
  line6(row + 17, color1_r, color1_g, color1_b, color2_r, color2_g, color2_b);    
  
  line3(row + 18, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line6(row + 19, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line3(row + 20, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line5(row + 21, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b);  
  line3(row + 22, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line4(row + 23, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line3(row + 24, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line1(row + 25, color2_r, color2_g, color2_b);
  line3(row + 26, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line1(row + 27, color2_r, color2_g, color2_b);
  line3(row + 28, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line1(row + 29, color2_r, color2_g, color2_b);
  line0(row + 30, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line1(row + 31, color2_r, color2_g, color2_b);
  line2(row + 32, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line1(row + 33, color2_r, color2_g, color2_b);
  line0(row + 34, color2_r, color2_g, color2_b, color1_r, color1_g, color1_b); 
  line1(row + 35, color2_r, color2_g, color2_b);
  
}
void line0(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  x=0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row);
  
  for (x = 0; x < width; x = x+4) {
    for (y = row; y < row+1; y++) {
      stroke(color2_r, color2_g, color2_b);
      point(x, y);
    } 
  }
}
void line1(int row, int color1_r, int color1_g, int color1_b){
  x = 0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row); 
}
void line2(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  x=0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row);
  
  for (x = 2; x < width; x = x+4) {
    for (y = row; y < row+1; y++) {
      stroke(color2_r, color2_g, color2_b);
      point(x, y);
    } 
  }
}
void line3(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  x=0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row);
  
  for (x = 0; x < width; x = x+2) {
    for (y = row; y < row+1; y++) {
      stroke(color2_r, color2_g, color2_b);
      point(x, y);
    } 
  }
}
void line4(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  x=0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row);
  for (x = 3; x < width; x = x+4) {
    for (y = row; y < row+1; y++) {
      stroke(color2_r, color2_g, color2_b);
      point(x, y);
    } 
  }
}
void line5(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  x=0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row);
  for (x = 1; x < width; x = x+4) {
    for (y = row; y < row+1; y++) {
      stroke(color2_r, color2_g, color2_b);
      point(x, y);
    } 
  }
}
void line6(int row, int color1_r, int color1_g, int color1_b, int color2_r, int color2_g, int color2_b){
  x=0;
  stroke(color1_r, color1_g, color1_b);
  line(x, row, width, row);
  for (x = 1; x < width; x = x+2) {
    for (y = row; y < row+1; y++) {
      stroke(color2_r, color2_g, color2_b);
      point(x, y);
    } 
  }
}