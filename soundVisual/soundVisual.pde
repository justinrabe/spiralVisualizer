//MUSIC  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer song;
 
int m = 500;
float r = 0;
float theta = 0;
 
//MAIN SETUP
void setup () {
  size(800,800);
  noCursor();
  smooth();
  background (0);
  frameRate(24);
 
  minim = new Minim(this);
  song = minim.loadFile(dataPath("song.mp3"));    
  song.play();
  println(song.bufferSize());
}
 
void draw () {
 
  background(0);
  stroke(255);
  translate(width/2, height/2);
  // BufferSize is 1024
  for(int i = 0; i < song.bufferSize() - 1; i++) { 
    float x = i * sin(radians(i)) / 4;
    float y = i * cos(radians(i)) / 4;
    
    float x2 = i * sin(radians(i)) / 3;
    float y2 = i * cos(radians(i)) / 3;
    
    float x3 = i * sin(radians(i)) / 2;
    float y3 = i * cos(radians(i)) / 2;
   
    noStroke();
    fill(255);
    ellipse(x, y, song.left.get(i)*30, song.left.get(i)*30);
    fill(#ff0000);
    ellipse(x2, y2, song.right.get(i)*30, song.right.get(i)*30);
    fill(#00ff00);
    ellipse(x3, y3, song.right.get(i)*30, song.right.get(i)*30);
  }
  
}
