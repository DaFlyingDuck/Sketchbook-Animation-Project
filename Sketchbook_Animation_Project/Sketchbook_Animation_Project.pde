

// Taiki Shickele 
// Sketchbook Solar System Vector Animation Project
//September 25 2020

//Collsion with sun for comet, possibly moon, better planet textures,

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim; 
AudioPlayer song;

//declare variables
float t;


//declare objects

Body animation;

void setup(){
  
  size(800, 600, P2D);
  smooth();
  frameRate(100);
  background(0);
  translate(400, 300);
  
  minim = new Minim(this);
  song = minim.loadFile("Space_Background_Music.mp3");
  song.play();
  
  animation = new Body();
  
}

void draw() { 
  noStroke();
  fill(0);
  translate(400, 300);
  rect(-400, -300, 800, 600);
  
  t = t + 1; // 100tps
  //functions on class
  animation.update_values();
  animation.display();
  
}



class Body {
  
  // MERCURY
  PVector Mercury_location;
  PVector Mercury_velocity;
  PVector Mercury_centri_accel;
  PVector Mercury_perturbations;
  
  // VENUS
  PVector Venus_location;
  PVector Venus_velocity;
  PVector Venus_centri_accel;
  PVector Venus_perturbations;
  
  // EARTH
  PVector Earth_location;
  PVector Earth_velocity;
  PVector Earth_centri_accel;
  PVector Earth_perturbations;
  
  // SUN
  PVector Sun_location;
  PVector Sun_velocity;
  PVector Sun_perturbations;
  
  // COMET 
  PVector Comet_location;
  PVector Comet_velocity;
  PVector Comet_centri_accel;
  PVector Comet_perturbations;
  
  
  
  Body() { //initialize values for orbital bodies
    
    Mercury_location = new PVector(0, 96);
    Mercury_velocity = new PVector(0.6914, 0);
    Mercury_centri_accel = new PVector(0, 0.00497952);
    Mercury_perturbations = new PVector(0, 0);
    
    Venus_location = new PVector(0, 172);
    Venus_velocity = new PVector(0.846, 0);
    Venus_centri_accel = new PVector(0, 0.00416114);
    Venus_perturbations = new PVector(0, 0);
    
    Earth_location = new PVector(0, 250);
    Earth_velocity = new PVector(0.96, 0);
    Earth_centri_accel = new PVector(0, 0.0036864);
    Earth_perturbations = new PVector(0, 0);
    
    Sun_location = new PVector(0, 0);
    Sun_velocity = new PVector(0, 0);
    Sun_perturbations = new PVector(0, 0);

    Comet_location = new PVector(1050, 650);
    Comet_velocity = new PVector(0, 0);    
    Comet_centri_accel = new PVector(0, 0);
    Comet_perturbations = new PVector(0, 0);
    
  }
  
  void update_values() {
    
    //=========================================================================================================================================
    //               MERCURY
    
    PVector d_comet = PVector.sub(Comet_location, Mercury_location); // finds the vector pointing from the planet to the comet  
    
    if (d_comet.mag() < 50) {
      d_comet.normalize();
      d_comet.mult(0.002);
      Mercury_perturbations = d_comet;
      
      Mercury_velocity.add(Mercury_perturbations);
      
    } else if (d_comet.mag() < 125) {
      d_comet.normalize();
      d_comet.mult(0.001);
      Mercury_perturbations = d_comet;
      
      Mercury_velocity.add(Mercury_perturbations);
      
    } else if (d_comet.mag() < 200) {
      d_comet.normalize();
      d_comet.mult(0.0005);
      Mercury_perturbations = d_comet;
      
      Mercury_velocity.add(Mercury_perturbations);
      
    }
    
    
    // Centripetal Acceleration Code
    
    PVector dir = PVector.sub(Sun_location, Mercury_location); // find vector pointing towards Sun
    dir.normalize();
    dir.mult(0.00497952); //set centripetal acceleration to constant
    
    Mercury_centri_accel = dir; //set centripetal acceleration to sun
    
    Mercury_velocity.add(Mercury_centri_accel);
    Mercury_location.add(Mercury_velocity);
    //=============================================================================================================================================
    //              VENUS
     
    
    PVector d_comet1 = PVector.sub(Comet_location, Venus_location); // finds the vector pointing from the planet to the comet  
    
    if (d_comet1.mag() < 50) {
      d_comet1.normalize();
      d_comet1.mult(0.001);
      Venus_perturbations = d_comet1;
      
      Venus_velocity.add(Venus_perturbations);
      
    } else if (d_comet1.mag() < 125) {
      d_comet1.normalize();
      d_comet1.mult(0.0005);
      Venus_perturbations = d_comet1;
      
      Venus_velocity.add(Venus_perturbations);
      
    } else if (d_comet1.mag() < 200) {
      d_comet1.normalize();
      d_comet1.mult(0.0003);
      Venus_perturbations = d_comet1;
      
      Venus_velocity.add(Venus_perturbations);
      
    }
    
    
    PVector dir1 = PVector.sub(Sun_location, Venus_location); // find vector pointing towards Sun
    dir1.normalize();
    dir1.mult(0.00416114); //set centripetal acceleration to constant
    
    Venus_centri_accel = dir1; //set centripetal acceleration to sun
    
    Venus_velocity.add(Venus_centri_accel);
    Venus_location.add(Venus_velocity);
    //=============================================================================================================================================
    //              EARTH
    
    
    PVector d_comet2 = PVector.sub(Comet_location, Earth_location); // finds the vector pointing from the planet to the comet  
    
    if (d_comet2.mag() < 50) {
      d_comet2.normalize();
      d_comet2.mult(0.0008);
      Earth_perturbations = d_comet2;
      
      Earth_velocity.add(Earth_perturbations);
      
    } else if (d_comet2.mag() < 125) {
      d_comet2.normalize();
      d_comet2.mult(0.0005);
      Earth_perturbations = d_comet2;
      
      Earth_velocity.add(Earth_perturbations);
      
    } else if (d_comet2.mag() < 200) {
      d_comet2.normalize();
      d_comet2.mult(0.000125);
      Earth_perturbations = d_comet2;
      
      Earth_velocity.add(Earth_perturbations);
      
    }
    
    
    PVector dir2 = PVector.sub(Sun_location, Earth_location); // find vector pointing towards Sun
    dir2.normalize();
    dir2.mult(0.0036864); //set centripetal acceleration to constant
    
    Earth_centri_accel = dir2; //set centripetal acceleration to sun
    
    Earth_velocity.add(Earth_centri_accel);
    Earth_location.add(Earth_velocity);
    //==============================================================================================================================================
    //        SUN      

    
    PVector d_comet3 = PVector.sub(Comet_location, Sun_location); // finds the vector pointing from the planet to the comet  
    
    if (d_comet3.mag() < 50) {
      d_comet3.normalize();
      d_comet3.mult(0.00002);
      Sun_perturbations = d_comet3;
      
      Sun_velocity.add(Sun_perturbations);
      
    } else if (d_comet3.mag() < 125) {
      d_comet3.normalize();
      d_comet3.mult(0.00001);
      Sun_perturbations = d_comet3;
      
      Sun_velocity.add(Sun_perturbations);
      
    } else if (d_comet3.mag() < 200) {
      d_comet3.normalize();
      d_comet3.mult(0.000002);
      Sun_perturbations = d_comet3;
      
      Sun_velocity.add(Sun_perturbations);
      
    }
    
    
    Sun_location.add(Sun_velocity);
    
    //=================================================================================================================================================
    //                COMET
    
    if (t == 600) { // makes it so the comet's velocity is not set until 3secs in
    
      PVector v_comet = new PVector(250, -350); // setting the intial velocity of the comet towards the solar system
      PVector dir0 = PVector.sub(v_comet, Comet_location);
      dir0.normalize();
      dir0.mult(0.65); 
    
      Comet_velocity = dir0;
      
    }
    
    if (t >= 600) {
    
      PVector dir3 = PVector.sub(Sun_location, Comet_location); // find vector pointing towards Sun
    
      if (dir3.mag() < 300) {
        dir3.normalize();
        dir3.mult(0.012); //set centripetal acceleration to constant 0055
        Comet_centri_accel = dir3; //set centripetal acceleration to sun
      
      } else if (dir3.mag() < 600) {
        dir3.normalize();
        dir3.mult(0.002);
        Comet_centri_accel = dir3;
      
      } else {
        dir3.normalize();
        dir3.mult(0.0005);
        Comet_centri_accel = dir3;
      }
    
    }
    
    
    PVector d_comet4 = PVector.sub(Earth_location, Comet_location); // finds the vector pointing from the comet to Earth
    
    if (d_comet4.mag() < 50) {
      d_comet4.normalize();
      d_comet4.mult(0.02);
      Comet_perturbations = d_comet4;
      
      Comet_velocity.add(Comet_perturbations);
      
    } else if (d_comet4.mag() < 125) {
      d_comet4.normalize();
      d_comet4.mult(0.01);
      Comet_perturbations = d_comet4;
      
      Comet_velocity.add(Comet_perturbations);
      
    } else if (d_comet4.mag() < 200) {
      d_comet4.normalize();
      d_comet4.mult(0.005);
      Comet_perturbations = d_comet4;
      
      Comet_velocity.add(Comet_perturbations);
      
    }
    
    
    PVector d_comet5 = PVector.sub(Venus_location, Comet_location); // finds the vector pointing from the comet to Venus
    
    if (d_comet5.mag() < 50) {
      d_comet5.normalize();
      d_comet5.mult(0.0175);
      Comet_perturbations = d_comet5;
      
      Comet_velocity.add(Comet_perturbations);
      
    } else if (d_comet5.mag() < 125) {
      d_comet5.normalize();
      d_comet5.mult(0.0075);
      Comet_perturbations = d_comet5;
      
      Comet_velocity.add(Comet_perturbations);
      
    } else if (d_comet5.mag() < 200) {
      d_comet5.normalize();
      d_comet5.mult(0.0035);
      Comet_perturbations = d_comet5;
      
      Comet_velocity.add(Comet_perturbations);
      
    }
    
    
    PVector d_comet6 = PVector.sub(Mercury_location, Comet_location); // finds the vector pointing from the comet to Mercury
    
    if (d_comet6.mag() < 50) {
      d_comet6.normalize();
      d_comet6.mult(0.01);
      Comet_perturbations = d_comet6;
      
      Comet_velocity.add(Comet_perturbations);
      
    } else if (d_comet6.mag() < 125) {
      d_comet6.normalize();
      d_comet6.mult(0.005);
      Comet_perturbations = d_comet6;
      
      Comet_velocity.add(Comet_perturbations);
      
    } else if (d_comet6.mag() < 200) {
      d_comet6.normalize();
      d_comet6.mult(0.0025);
      Comet_perturbations = d_comet6;
      
      Comet_velocity.add(Comet_perturbations);
      
    }
   
    
    Comet_velocity.add(Comet_centri_accel);
    Comet_location.add(Comet_velocity);
    //================================================================================================================================================
    
    
    
  }
  
  
  void display() {
    
    fill(0);
    stroke(255);
    strokeWeight(1);
    ellipse(0, 0, 500, 500); 
    ellipse(0, 0, 344, 344);
    ellipse(0, 0, 192, 192);
    fill(255);
    ellipse(0, 0, 3, 3);

    
    
    
    noStroke();
    
    fill(155, 139, 119); // mercury (brown/grey)
    ellipse(Mercury_location.x, Mercury_location.y, 7.5, 7.5);
    
    fill(144, 113, 71); // venus (brown/grey)
    ellipse(Venus_location.x, Venus_location.y, 13, 13);
    
    fill(53, 155, 14); // earth (green)
    ellipse(Earth_location.x, Earth_location.y, 15, 15);
    
    fill(140); // comet (gray)
    ellipse(Comet_location.x, Comet_location.y, 10, 10);
    
    fill(255, 196, 0); // sun (yellow)
    ellipse(Sun_location.x, Sun_location.y, 40, 40);
    

    
  }



}
