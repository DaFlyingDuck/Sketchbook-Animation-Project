// Taiki Shickele 
// Sketchbook Solar System Vector Animation Project

//declare objects

Body Earth;
Body Sun;

void setup(){
  
  size(800, 600, P2D);
  smooth();
  frameRate(100);
  background(0);
  translate(400,300);
  
  
}

void draw() { 
  noStroke();
  fill(0);
  rect(-400, -300, 800, 600);
  
  //functions on mover objects

}


class Body {
  PVector radius;
  PVector velocity;
  PVector centripetal_accel;
  PVector random_accel;
  
  Body() { //initialize values for 2 objects
  
  Body Earth = new Body();
  Body Sun = new Body();  
  
  Earth.radius = new PVector(
  Earth.velocity = new PVector(
  Earth.random_accel = new PVector(
    
  Sun.radius = new PVector(
  Sun.velocity = new PVector(
  Sun.random_accel = new PVector(
    
  }

}
