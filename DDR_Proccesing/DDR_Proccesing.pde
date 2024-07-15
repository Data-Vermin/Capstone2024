import netP5.*;
import oscP5.*;
import processing.video.*;

Movie movie;
OscP5 oscP5;

int curentIn;
PImage image;
boolean glitch = false;
int timer = 0; 
color [] colors2 = {#ffff00, #00ff00, #00ffff, #ff00ff, #ff007f, #000000, #FFFFFF};

void setup() {
  fullScreen();
  movie = new Movie(this, "Destruction.mp4");
  movie.loop();
  
  //image(image, 0, 0, width, height);
  
  strokeWeight(2);
  noSmooth();
    
    // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this, 9001);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  float mt = movie.time();
  if(mt >15){
    movie.jump(0);
  }
  //background(0,0,0,0.01);
  timer ++;
  if(timer > 30){
    glitch = false;
  }
  if(glitch == true){
    for(int i = 0; i < 10; i++){
      drawGlitchy();
    }
  } else {
      image(movie, 0, 0, width, height);
  }
}

void drawGlitchy(){
 
  int x = int(random(movie.width));
  int y = int(random(movie.height));

  
  int lineSize = 5;
  float r = random(1);
  float c = random(7);
  fill(colors2[int(c)], random(127) + 127);
  noStroke();
  
  if(r < 0.5){
    rect(x - lineSize / 2, y, random(55), random(45));
  }else {
    rect(x, y - lineSize / 2, random(55), random(45));
  } 
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" data: "+theOscMessage.get(0).intValue());
  curentIn = theOscMessage.get(0).intValue();
  if(curentIn < 11){
    glitch = true;
    timer = 0;    
  }
}
