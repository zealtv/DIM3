int numShapes = 4;          //define a global variable to control the number of shapes drawn

void setup()
{
  size(1000, 300);
  background(0);
  noStroke();
  rectMode(CENTER);
}


void draw()
{
  background(0);  
 
  int count =  0;
 
  while(count < numShapes)
  {
    int x = (count * width/numShapes) + width/(numShapes * 2); 
    //define the shapes x position as a function of numShapes and count
    
    if(count == 2)
    {
      ellipse(x, height/2, width/10, width /10);       //draw a circle on the third iteration (count == 2) 
    }
    else
    {
      rect(x, height/2, width/10, width /10);          //else draw a rectangle
    }
    
    count++; 
  }
  
  numShapes = mouseX/100;      //use mouseX position to vary the number of shapes drawn                            
  
}
