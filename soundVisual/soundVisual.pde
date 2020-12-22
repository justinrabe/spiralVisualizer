//MUSIC  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer song;
 
int m = 500;
float spin = 0.1;
 
//MAIN SETUP
void setup () {
  size(600,600);
  noCursor();
  smooth();
  background (0);
  frameRate(24);
 
  minim = new Minim(this);
  song = minim.loadFile(dataPath("lily.mp3"));    
  song.play();
  println(song.bufferSize());
}
 
void draw () {
 
  background(#1b262c);
  stroke(255);
  translate(width/2, height/2 + 25);
  // BufferSize is 1024
  for(int i = 0; i < song.bufferSize() - 1; i++) { 
    float x = i * sin(radians(i + spin)) / 4;
    float y = i * cos(radians(i + spin)) / 4;
    
    float x2 = i * sin(radians(i + spin)) / 3;
    float y2 = i * cos(radians(i + spin)) / 3;
    
    float x3 = i * sin(radians(i + spin)) / 2;
    float y3 = i * cos(radians(i + spin)) / 2;
   
    noStroke();
    fill(#0f4c75);
    ellipse(x, y, song.left.get(i)*30, song.left.get(i)*30);
    fill(#3282b8);
    ellipse(x2, y2, song.right.get(i)*30, song.right.get(i)*30);
    fill(#bbe1fa);
    ellipse(x3, y3, song.right.get(i)*30, song.right.get(i)*30);
  }
  spin+=0.1;
  
}
