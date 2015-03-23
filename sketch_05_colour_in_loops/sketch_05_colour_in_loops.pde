void setup()
{
  size(800, 300);
  background(0);
  noLoop();          //only draw a single frame
  noStroke();
  rectMode(CENTER);  //specify rectangle coordinates from the center
}


void draw()
{ 
  int count =  0; 
  while(count < 4)
  {
    int x = (count * 200) + 100; 

    int myColor = (int)map(count, 0, 4, 50, 255);  //here we're remapping a value of 0 - 3 to 50 - 255
    //notice that as the map function returns a float we need to 
    //cast the value to an int in order to store it in myColour
    fill(myColor, myColor/2, 255);                //use myColour to vary colour through out the loop

    rect(x, height/2, width/10, width /10);       //draw the rectangle
     
    count++; 
  }
  
}
