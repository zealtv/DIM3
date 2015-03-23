void setup()
{
  size(800, 800);
  background(255);
  strokeWeight(30);
  stroke(255);
  rectMode(CENTER);
  frameRate(10);
  //noLoop();
}


void draw()
{
  int gridSize = 6;
  int radius = height/gridSize;
  
  fill(255, 0, 0);
  
  for(int xStep = 0; xStep < gridSize; xStep++)                        //this loop steps from left to right
  {
    int xPos = (int)map(xStep, 0, gridSize, 0, width) + radius/2;
    
    for(int yStep = 0; yStep < gridSize; yStep++)                      //this loop steps from top to bottom
    {
      int yPos = (int)map(yStep, 0, gridSize, 0, height) + radius/2;  
      //try me
      //fill(random(127,255), 0, 0);
      rect(xPos, yPos, radius, radius);
    }
    
  }
  
  
  //SAVING OUR IMAGE!
  if(keyPressed)
  {
    save("myThing.png");
    println("saved my thing.png!");
  }
}
