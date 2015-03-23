int radius = 30;

void setup()
{
  size(200, 600);
  colorMode(HSB, 360, 100, 100);              //set colour to HSB so we can cycle hue
  noStroke();
  noLoop();
  
}

void draw()
{
  background(0, 0, 100);
  for(int i = 0; i < 360; i ++)               //loop between 0 and 360 
  {
   int yPos = (int)map(i, 0, 360, 0, height); //calculate yPos by remapping 0-360 to 0-height 
   fill(i, 100, 100);                         //set our colour using i
   ellipse(width/2,  yPos, radius, radius);   //draw an ellipse
  }

}
