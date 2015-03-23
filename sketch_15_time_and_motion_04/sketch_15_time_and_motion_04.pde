void setup() {
  size(800, 800);
  background(0);
  rectMode(CENTER);
  stroke(255);
  strokeWeight(10);
  fill(0, 0);
}

void draw()
{
  float rotAmount = PI/3;
  float rotation = 0;
  float time = millis() * 0.001;              //here we create an input value by scaling time
  
  //try uncommenting these lines
  
  
  rotation = sin(time) * rotAmount;           //using sin()
  //rotation = cos(time) * rotAmount;         //using cos()
  //rotation = time % 1.0 * rotAmount;        //using modulus 
  
  
  background(0);

  translate(width/2, height/2);               //draw and rotate from the center of the screen
  rotate(rotation);
  rect(0, 0, 300, 300);
}
