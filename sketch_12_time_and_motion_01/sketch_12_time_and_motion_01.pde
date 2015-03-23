void setup() {
  size(800, 800);
  background(0);
  noStroke();
}

void draw()
{
  float distance = 100;
  float xPos = 0;
  float time = millis() * 0.001;          //here we create an input value by scaling time
  
  //try uncommenting these lines
  
  xPos = time % 1.0 * distance;          //using modulus
  //xPos = sin(time) * distance;         //using sin()
  //xPos = cos(time) * distance;         //using cos()
  
  
  drawBG();

  translate(width/2, height/2);      //draw from the center of the screen
  fill(255);
  ellipse(xPos, 0, 20, 20);
}


void drawBG()
{
  fill(0, 15);
  rect(0, 0, width, height);
}
