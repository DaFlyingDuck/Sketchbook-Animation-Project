// Taiki Shickele 
// Sketchbook Solar System Vector Animation Project
//September 25 2020

// Make Jupiter, Perturbation Code, Collsion with sun for comet, possibly moon, better planet textures, music

//declare objects

Body animation;

void setup(){
  
  size(800, 600, P2D);
  smooth();
  frameRate(100);
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
  
  // MERCURY
  PVector Mercury_location;
  PVector Mercury_velocity;
  PVector Mercury_centri_accel;
  PVector Mercury_random_accel;
  
  // VENUS
  PVector Venus_location;
  PVector Venus_velocity;
  PVector Venus_centri_accel;
  PVector Venus_random_accel;
  
  // EARTH
  PVector Earth_location;
  PVector Earth_velocity;
  PVector Earth_centri_accel;
  PVector Earth_random_accel;
  
  // SUN
  PVector Sun_location;
  PVector Sun_velocity;
  PVector Sun_random_accel;
  
  // COMET 
  PVector Comet_location;
  PVector Comet_velocity;
  PVector Comet_centri_accel;
  PVector Comet_random_accel;
  
  
  
  Body() { //initialize values for orbital bodies
    
    Mercury_location = new PVector(0, 50);
    Mercury_velocity = new PVector(0.45, 0);
    Mercury_centri_accel = new PVector(0, 0.00405);
    Mercury_random_accel = new PVector(0, 0);
    
    Venus_location = new PVector(0, 105);
    Venus_velocity = new PVector(0.63, 0);
    Venus_centri_accel = new PVector(0, 0.00378);
    Venus_random_accel = new PVector(0, 0);
    
    Earth_location = new PVector(0, 150);
    Earth_velocity = new PVector(0.75, 0);
    Earth_centri_accel = new PVector(0, 0.00375);
    Earth_random_accel = new PVector(0, 0);
    
    Sun_location = new PVector(0, 0);
    Sun_velocity = new PVector(0, 0);
    Sun_random_accel = new PVector(0, 0);

    Comet_location = new PVector(800, 525);
    Comet_velocity = new PVector(0, 0);
    
    PVector v_comet = new PVector(200, -350); // setting the intial velocity of the comet towards the solar system
    PVector dir3 = PVector.sub(v_comet, Comet_location);
    dir3.normalize();
    dir3.mult(0.5);
    
    Comet_velocity = dir3;
    
    Comet_centri_accel = new PVector(0, 0);
    Comet_random_accel = new PVector(0, 0);
    
  }
  
  void update_values() {
    
    PVector dir = PVector.sub(Sun_location, Mercury_location); // find vector pointing towards Sun
    dir.normalize();
    dir.mult(0.00405); //set centripetal acceleration to constant
    
    Mercury_centri_accel = dir; //set centripetal acceleration to sun
    
    Mercury_velocity.add(Mercury_centri_accel);
    Mercury_location.add(Mercury_velocity);
    //===================================================================
    
    
    PVector dir1 = PVector.sub(Sun_location, Venus_location); // find vector pointing towards Sun
    dir1.normalize();
    dir1.mult(0.00378); //set centripetal acceleration to constant
    
    Venus_centri_accel = dir1; //set centripetal acceleration to sun
    
    Venus_velocity.add(Venus_centri_accel);
    Venus_location.add(Venus_velocity);
    //===================================================================
    
    
    PVector dir2 = PVector.sub(Sun_location, Earth_location); // find vector pointing towards Sun
    dir2.normalize();
    dir2.mult(0.00375); //set centripetal acceleration to constant
    
    Earth_centri_accel = dir2; //set centripetal acceleration to sun
    
    Earth_velocity.add(Earth_centri_accel);
    Earth_location.add(Earth_velocity);
    //===================================================================

    //Sun stuff
    
    //===================================================================
    
    PVector dir3 = PVector.sub(Sun_location, Comet_location); // find vector pointing towards Sun
    
    if (dir3.mag() < 400) {
      dir3.normalize();
      dir3.mult(0.003); //set centripetal acceleration to constant
      Comet_centri_accel = dir3; //set centripetal acceleration to sun
      
    } else if (dir3.mag() < 800) {
      dir3.normalize();
      dir3.mult(0.0015);
      Comet_centri_accel = dir3;
      
    } else {
      dir3.normalize();
      dir3.mult(0.0005);
      Comet_centri_accel = dir3;
    }
    
    Comet_velocity.add(Comet_centri_accel);
    Comet_location.add(Comet_velocity);
    //==================================================================
    
    
    
  }
  
  
  void display() {
    
    noStroke();
    
    fill(173, 138, 10); // mercury (brown/grey)
    ellipse(Mercury_location.x, Mercury_location.y, 7.5, 7.5);
    
    fill(191, 151, 10); // venus (brown/grey)
    ellipse(Venus_location.x, Venus_location.y, 13, 13);
    
    fill(53, 155, 14); // earth (green)
    ellipse(Earth_location.x, Earth_location.y, 15, 15);
    
    fill(255, 196, 0); // sun (yellow)
    ellipse(Sun_location.x, Sun_location.y, 40, 40);
    
    fill(140); // comet (gray)
    ellipse(Comet_location.x, Comet_location.y, 10, 10);
    
    
  }



}
