//Use keys C, R, A and P to choose a mode
// C  contrast
// R  repition
// A  alignment
// P  proximity
//Use key X to toggle special active state



String  mode = "Contrast";
boolean active = false;

void setup()
{
 size(800, 800, P3D); 
 noStroke();
 rectMode(CENTER);
  
}

void draw()
{
   
  if(mode == "Contrast"){
    drawC();
  }
  
  if(mode == "Repetition"){
   drawR(); 
  }
  
  if(mode == "Alignment"){
   drawA(); 
  }
  
  if(mode == "Proximity"){
   drawP(); 
  }
  
  
}


//draw Contrast
void drawC()
{
  background(255);
  fill(255, 0, 255);
  rect(width/2, height/2, 750, 750, 50, 50, 50, 50);
  fill(255);
  if(active) fill(0, 255, 0);
  ellipse(width/2, height/2, 400, 400);
}


//draw Repetition
void drawR()
{
  background(255);
  
  for(int i = 0; i < 5; i++)
  {
    pushMatrix();
    translate(160 * (i - 2), 0, 0);
    fill(255, 0, 255);
    rect(width/2, height/2, 150, 150, 10, 10, 10, 10);
    fill(255);
    if(active && i == 1) fill(255, 0, 255);
    ellipse(width/2, height/2, 80, 80);
    popMatrix();
  }
 
}


//draw Alignment
void drawA()
{
  background(255);
  
  for(int i = 0; i < 8; i++)
  {
    pushMatrix();
    translate(80 * (i - 3.5), 300, 0);
    fill(255, 0, 255);
    rect(width/2, height/2, 75, 75, 10, 10, 10, 10);
    popMatrix();
    
    if(active){
      pushMatrix();
      translate(280, 80 * (i - 3.5) + 20, 0);
      fill(80);
      ellipse(width/2, height/2, 40, 40);
      popMatrix();  
    }
    
    
  }

}


//draw Proximity
void drawP()
{
  background(255);
  fill(255, 0, 255);
  rect(75, 75, 75, 75, 10, 10, 10, 10);
  rect(160, 75, 75, 75, 10, 10, 10, 10);
  rect(75, 160, 75, 75, 10, 10, 10, 10);
  
  if(active)
  {
    fill(80);
    ellipse(width - 75, height - 75, 75, 75);
    ellipse(width - 160, height - 75, 75, 75);
    ellipse(width - 75, height - 160, 75, 75);    
  }
}




//Key checking and mode control
void keyPressed()
{
 if(key == 'x')
 {
   active = !active;
   println("active = " + active); 
 }
 
 if(key == 'c')
 {
   active = false;
   mode = "Contrast";
   println(mode); 
 }
 
 if(key == 'r')
 {
   active = false;
   mode = "Repetition";
   println(mode); 
 }
 
 if(key == 'a')
 {
   active = false;
   mode = "Alignment";
   println(mode); 
 }
 
 if(key == 'p')
 {
   active = false;
   mode = "Proximity";
   println(mode); 
 }
}
