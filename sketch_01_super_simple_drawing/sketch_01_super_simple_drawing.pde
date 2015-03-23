//first we set up our window
void setup(){
  size(500, 400);               //set the width and height of our window in pixels
}


//then we start drawing
void draw(){
  background(127);              //set background colour to grey
  
  stroke(0);                    //set stroke to black
  fill(255);                    //set fill to white
  ellipse(250, 200, 40, 40);    //draw an ellipse in the middle of the screen
  
  stroke(255, 0, 0);            //set stroke colour to red
  fill(0, 0, 255);              //set fill to blue
  rect(250, 200, 40, 40);       //draw a rectangle in the middle of the screen.
                                //notice the first two arguments specify the rectangles top left corner
}
