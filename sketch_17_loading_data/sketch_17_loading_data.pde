BufferedReader reader;
String line;
boolean finishedLoading = false;

void setup()
{
  size(800, 800); 
  reader = createReader("data.txt");
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
      for(int i = 0; i < pieces.length; i++)
      {
        print(pieces[i]);
        print(" ::: ");
      }
      println();
    }
  }
  
  
  
  
}
