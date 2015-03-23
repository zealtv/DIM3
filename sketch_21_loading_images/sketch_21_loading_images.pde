PImage seahorseImg;
PShape starSvg;

void setup()
{
  size(800, 800);
  //seahorseImg = loadImage("seahorse.png");                          //load from data folder
  seahorseImg = requestImage("http://zeal.co/mimparty/Seahorse.png"); //load from web
  
  starSvg = loadShape("star.svg");
  
  
  imageMode(CENTER);  // can be CORNER, CORNERS or CENTER
  shapeMode(CENTER);
  
  starSvg.disableStyle();  //overide SVGs style
  
  strokeWeight(5);
  stroke(255);
  fill(0, 0);
}

void draw()
{ 
  background(0);
  
  
  //draw a bunch of star SVGs
  for(int i = 1; i < 7; i++)
  {
    pushMatrix();
    translate(width/2, height/2);
    scale(i);
    shape(starSvg, 0, 0, 100, 100);
    popMatrix();
  }
  
  //draw a seahorse
  pushMatrix();
  translate(mouseX, mouseY);
  image(seahorseImg, 0, 0);
  popMatrix();
  
}
