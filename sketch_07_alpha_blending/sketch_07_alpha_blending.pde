int radius = 400;
int quarterR;
int halfH;
int halfW;
int alpha = 127;

void setup()
{
  size(800, 800);
  background(255);
  noStroke();
  noLoop();
  
  quarterR = radius/4;
  halfH = height/2;
  halfW = width/2;
  
}


void draw(){
  background(255);
  
  fill(255, 0, 0, alpha);
  ellipse(halfW - quarterR, halfH + quarterR, radius, radius);
  
  fill(0, 255, 0, alpha);
  ellipse(halfW + quarterR, halfH + quarterR, radius, radius);
  
  fill(0, 0, 255, alpha);
  ellipse(halfW, halfH - quarterR, radius, radius);
}
