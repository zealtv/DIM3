BufferedReader reader;
String line;
boolean finishedLoading = false;
int colorShift = 0;
int currentPos = 0;

void setup()
{
  size(800, 800);
 background(90); 
  reader = createReader("data.txt");
  fill(0, 0);
  strokeWeight(10);
  colorMode(HSB, 360, 100, 100);
  stroke(0, 100, 100);
  textAlign(CENTER);
  
}

void draw()
{
  
  if(!finishedLoading)
  {
    
    try
    {
      line = reader.readLine();
    }
    catch(IOException e)
    {
      e.printStackTrace();
      line = null;
    }
    
    
    if(line == null)
    {
      finishedLoading = true;
    }
    else
    {
      String[] pieces = split(line, TAB);
      drawCircle(pieces[0], Integer.parseInt(pieces[1]));
    }
  }
}


void drawCircle(String name, int score)
{
  stroke(colorShift, 100, 100);
  
  pushMatrix();
  
  translate((currentPos + 1) * width/4, height/2);
  fill(0, 0);
  ellipse(0, 0, score*10, score*10);
  
  translate(0, height/4);
  fill(colorShift, 100, 100);
  text(name, 0, 0);
  
  popMatrix();
  
  currentPos++;
  colorShift += 360/3;
}
