import processing.video.*;
Movie movie;

PImage image;
boolean glitch = false;
int timer = 0; 
color [] colors2 = {#ffff00, #00ff00, #00ffff, #ff00ff, #ff007f, #000000, #FFFFFF};


void setup(){
  fullScreen();
  movie = new Movie(this, "Destruction.mp4");
  movie.loop();
  
  image = loadImage("Factory.jpg");
  image.resize(width, height);
  
  //image(image, 0, 0, width, height);
  //image(movie, 0, 0, width, height);
  
  strokeWeight(2);
  noSmooth();
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  float mt = movie.time();
  if(mt >15){
    movie.jump(0);
  }
  timer ++;
  if(timer > 50){
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

void keyReleased(){
    glitch = true;
    timer = 0;
}
