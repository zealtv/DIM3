int alpha = 20;

void setup()
{
  size(800, 800);
  background(0);
  strokeWeight(20);
}


void draw()
{
  noStroke();
  fill(0, alpha);
  rect(0, 0, width, height);                  //here we are draw a semi-transparent recatangle over the whole screen
                                              //this partially erases the previous frame leaving motion trails
  
  stroke(255);
  line(mouseX, mouseY, pmouseX, pmouseY);
  
}
