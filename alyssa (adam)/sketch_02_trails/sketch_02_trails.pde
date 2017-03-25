/* Trails */

Mover mover1;
Mover mover2;
Mover mover3;
Mover mover4;
Mover mover5;
Mover mover6;
Mover mover7;
Mover mover8;

int numMovers = 50;
Mover[] movers = new Mover[numMovers];
Mover thisMover;

void setup(){
  //size(500,500);
  size(960, 540);
  //fullScreen();
  background(0);
  frameRate(10);
  
  for (int i=0; i<numMovers; i++)  {
    movers[i] = new Mover(width/2,height/2, 20);
  }
  //mover1 = new Mover(width/2,height/2, 20);
  //mover2 = new Mover(width/2,height/2, 20);
  //mover3 = new Mover(width/2,height/2, 20);
  //mover4 = new Mover(width/2,height/2, 20);
  //mover5 = new Mover(width/2,height/2, 20);
  //mover6 = new Mover(width/2,height/2, 20);
  //mover7 = new Mover(width/2,height/2, 20);
  //mover8 = new Mover(width/2,height/2, 20);
}

void draw(){
  fill(0, 0, 0, 50);
  rect(0,0,width,height);
  
  for (int i=0; i<numMovers; i++)  {
    thisMover = movers[i];
    thisMover.display();
    thisMover.move((int)random(4)+1);
    //movers[i] = new Mover(width/2,height/2, 20);
  }
  
  if (frameCount < 600) {
    saveFrame("trails-f#####.png"); 
  } else {
    exit();
  }
  
  //mover1.display();
  //mover1.move((int)random(4)+1);
  
  //mover2.display();
  //mover2.move((int)random(4)+1);
  
  //mover3.display();
  //mover3.move((int)random(4)+1);
  
  //mover4.display();
  //mover4.move((int)random(4)+1);
  
  //mover5.display();
  //mover5.move((int)random(4)+1);
  
  //mover6.display();
  //mover6.move((int)random(4)+1);
  
  //mover7.display();
  //mover7.move((int)random(4)+1);
  
  //mover8.display();
  //mover8.move((int)random(4)+1);
 
}

class Mover
{
  int xpos;
  int ypos;
  int size;
  
  Mover(int x, int y, int s){
   xpos = x;
   ypos = y;
   size = s;
  }
  
  void move (int dir) {
    if(dir == 1){ //move right
      xpos += size;
    } else if(dir == 2) { //move left
      xpos -= size;
    } else if(dir == 3) { //move up
      ypos += size;
    } else { //move down
      ypos -= size;
    }
    //println(dir);
    
    //if the mover wanders off screen, make it reappear on the other side
    if (xpos > width){
      xpos = 0;
    }
    if (xpos < 0){
      xpos = width - size;
    }
    if (ypos > height){
      ypos = 0;
    }
    if (ypos < 0){
      ypos = height - size;
    }
  }
  
  void display(){
    noStroke();
    fill(255);
    rect(xpos, ypos, size, size);
  }
  
  
}