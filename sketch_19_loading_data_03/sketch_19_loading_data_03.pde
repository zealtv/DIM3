BufferedReader reader;
String line;
boolean finishedLoading = false;
int colorShift = 0;
int currentPos = 0;
ArrayList<Team> teams;
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
  
  teams = new ArrayList<Team>();
}

void draw()
{
  if(!finishedLoading)
  {
    loadData();
  }
  else
  {
    background(0);
    drawCircles();
  }

}


//Load our text data
void loadData()
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
      //pull out values from text file and store them in team objects
      //then store those objects in an arraylist
      String[] pieces = split(line, TAB);
      Team myTeam = new Team( pieces[0], Integer.parseInt(pieces[1]) );
      teams.add(myTeam);
    }
}


//Use the team array list to manipulate size of circles
void drawCircles()
{
  int colorShift = 0;
  int currentPos = 0;
  
  for(int i = 0; i < teams.size(); i++)
  {
  
    int score = teams.get(i).score;
    String name = teams.get(i).name;
    
    stroke(colorShift, 100, 100);
    
    pushMatrix();
    
    translate((currentPos + 1) * width/4, height/2);
    pushMatrix();
    scale(1*sin(millis()/1000.0));
    fill(0, 0);
    ellipse(0, 0, score*10, score*10);
    popMatrix();
    
    translate(0, height/4);
    fill(colorShift, 100, 100);
    text(name, 0, 0);
    
    popMatrix();
    
    currentPos++;
    colorShift += 360/3;
  }
}


//Here we create a team object to store associations 
//between team names scores
class Team
{
  String name;
  int score;
 
  Team(String n, int s)
  {
   name = n;
   score = s;
  }
}
