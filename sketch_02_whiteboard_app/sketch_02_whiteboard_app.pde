void setup() {
  size(800, 600);                   //create our window
  background(255);                  //set the background to white
  strokeWeight(5);                  //set stroke weight to 5 - this is the size of the pen
}



void draw() { 

  //MOUSE COMMANDS
  if (mousePressed)                          //check if mouse is pressed
  {
    line(mouseX, mouseY, pmouseX, pmouseY);  //draw a line from mouse current position to its previous position
  }



  //KEYBOARD COMMANDS
  if (keyPressed)                            //check if a key is pressed
  {
    if (key == 'z')                          //check if the key is 'z'
    {
      background(255);                       //erase the image by setting background to white
    } 

    if (key == 'e')                          //check if the key is 'e'
    {
      stroke(255, 0, 0);                           //set stroke to white
      strokeWeight(30);                      //set strokeWeight to 30 pixels
    }

    if (key == 'w')                          //check if the key is 'w'
    {
      stroke(0);                             //set stroke to black
      strokeWeight(5);                       //set stroke weight to 5 pixels
    }
  }
}
