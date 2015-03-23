//USING TIME AS AN INPUT TO CONTROL POSITION

float posX, posY;
boolean trails = true;
float speed = 0.001;
float distance = 100.0;


//PLAY WITH THESE MODES
int modeX = 4;        //0 = off
int modeY = 2;        //1 = modulus
                      //2 = sin()
                      //3 = cos()
                      //4 = wrap around screen


void setup()
{
  size(800, 800);
  background(0);
  fill(255);
  noStroke();
  
}

void draw()
{ 
  float inputVal = millis() * speed;
  
  posX = calculatePos(inputVal, 'x');
  posY = calculatePos(inputVal, 'y');
  
  
  drawBG();
  
  pushMatrix();
  
  centerDrawing();      //here we adjust the point to drawform depending on the mode 
  
  pushMatrix();
  translate(posX, posY);
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  popMatrix();
}



void drawBG()
{
  /* here we push the style on to the style stack
   * so we can change alpha trail settings
   * without changing our other draw settings */
  if(trails)
  {
    pushStyle();
    noStroke();
    fill(0, 15);
    rect(0, 0, width, height);
    popStyle();
  }
  else
  {
    background(0);
  }
}


void centerDrawing()
{
  if(modeX != 4) translate(width/2, 0);      //draw from the center of X if x mode is not "wrap"
  if(modeY != 4) translate(0, height/2);     //draw from the center of Y if y mode is not "wrap"
}



float calculatePos(float input, char component)
{
  float output = 0.0;
  int mode = 0;
  
  //get mode from global variables
  if(component == 'x') mode = modeX;
  if(component == 'y') mode = modeY;
  
  //calculate position using mode's particular method
  switch(mode)
  {
    case(0):
    break;
    
    case(1):
    output = input % 1.0;
    break;
    
    case(2):
    output = sin(input);
    break;
    
    case(3):
    output = cos(input);
    break;
    
    //wrapping around the screen is more complicated as we need to 
    //read the current position value.  
    //modulus is used to wrap the value from edge to edge. 
    case(4):
    if(component == 'x')
    {
      output = posX + 1/(speed*distance*10);
      output %= width;
      return output;
    }
    
    if(component == 'y')
    {
      output = posY + 1/(speed*distance*10);
      output %= height;
      return output;
    }
    
  }
  
  output *= distance;
  return output;
}
