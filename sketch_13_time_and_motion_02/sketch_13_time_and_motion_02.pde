void setup() {
  size(800, 800);
  background(0);
  noStroke();
}

void draw()
{
  float distance = 100;
  float speed =0.001;
  float time = millis() * speed;          //here we create an input value by scaling time
                                          // with our speed variable
  
  float xPos = sin(time) * distance;
  float yPos = cos(time) * distance;    
  
  
  drawBG();

  translate(width/2, height/2);      //draw from the center of the screen
  fill(255);
  ellipse(xPos, yPos, 20, 20);
}


void drawBG()
{
  fill(0, 15);
  rect(0, 0, width, height);
}
