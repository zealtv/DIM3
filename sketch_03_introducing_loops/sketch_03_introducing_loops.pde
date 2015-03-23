void setup()
{
  size(800, 300);
  background(0);
  noLoop();
  noStroke();
  rectMode(CENTER);
}


void draw()
{
  background(0);  
 
  int count =  0;
  while(count < 4)
  {
    int x = (count * 200) + 100;             //vary the rectangles x position as a function of count
    rect(x, height/2, width/10, width /10);    
     
    count++; 
  }
  
}
