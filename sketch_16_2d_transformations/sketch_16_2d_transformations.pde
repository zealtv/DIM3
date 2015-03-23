float r;

void setup()
{
  size(800,800);
  background(0);
  stroke(255);
  fill(0);
  rectMode(CENTER);
  strokeWeight(10);
  
  
  r = PI/4;
  //or:
  //r = radians(45);
}


void draw()
{
  background(0);  
  
  pushMatrix();                      //save our current(un-transformed) transformation matrix
  translate(width/2, height/2);      //move our origin to the center of the canvas
  rotate(r);                         //rotate by r radians
  scale(3.0);                        //scale by 3
  rect(0, 0,  100, 100);  
  
  pushMatrix();                      //transformations can be nested
  rotate(r);                         //rotate again ( this causes the x axis to now be vertical
  rect(0,0,100,100);
  popMatrix();                       //undo our last rotation
  
  popMatrix();                       //return to our un-transformed matrix

  rect(width/2, height/4,  100, 100);
}
