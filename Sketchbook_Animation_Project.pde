// Taiki Shickele 
// Sketchbook Solar System Vector Animation Project

//declare objects

Body animation;

void setup(){
  
  size(800, 600, P2D);
  smooth();
  frameRate(60);
  background(0);
  translate(400, 300);
  
    
  animation = new Body();

  
  
}

void draw() { 
  noStroke();
  fill(0);
  translate(400, 300);
  rect(-400, -300, 800, 600);
  
  //functions on class
  animation.update_values();
  animation.display();
  
}



class Body {
  
  
  PVector Earth_location;
  PVector Earth_velocity;
  PVector Earth_centri_accel;
  PVector Earth_random_accel;
  
  PVector Sun_location;
  PVector Sun_velocity;
  PVector Sun_random_accel;
  
  PVector Comet_location;
  PVector Comet_velocity;
  PVector Comet_centri_accel;
  PVector Comet_random_accel;
  
  
  
  Body() { //initialize values for 2 objects

    Earth_location = new PVector(0, 200);
    Earth_velocity = new PVector(1, 0);
    Earth_centri_accel = new PVector(0, 0.005);
    Earth_random_accel = new PVector(0, 0);
    
    Sun_location = new PVector(0, 0);
    Sun_velocity = new PVector(0, 0);
    Sun_random_accel = new PVector(0, 0);

    Comet_location = new PVector(1000, 750);
    Comet_velocity = new PVector(0, 0);
    Comet_centri_accel = new PVector(0, 0);
    Comet_random_accel = new PVector(0, 0);
    
  }
  
  void update_values() {
    
    
    PVector dir = PVector.sub(Sun_location, Earth_location); // find vector pointing towards Sun
    dir.normalize();
    dir.mult(0.005); //set centripetal acceleration to constant
    
    Earth_centri_accel = dir; //set centripetal acceleration to sun
    
    Earth_velocity.add(Earth_centri_accel);
    Earth_location.add(Earth_velocity);
    //===================================================================

    //Sun stuff
    
    //======================================================
    
    PVector dir2 = PVector.sub(Sun_location, Comet_location); // find vector pointing towards Sun
    dir2.normalize();
    dir2.mult(0.5); //set centripetal acceleration to constant
    
    Comet_centri_accel = dir; //set centripetal acceleration to sun
    
    Comet_velocity.add(Comet_centri_accel);
    Comet_location.add(Comet_velocity);
    //====================================================
    
    
    
  }
  
  
  void display() {
    
    strokeWeight(0);
    fill(53, 155, 14);
    ellipse(Earth_location.x, Earth_location.y, 30, 30);
    fill(255, 196, 0);
    ellipse(Sun_location.x, Sun_location.y, 30, 30);
    ellipse(Comet_location.x, Comet_location.y, 30, 30);
    
    
  }



}
 
