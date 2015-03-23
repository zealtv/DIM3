void setup()
{
  size(800, 800, P3D);
  strokeCap(PROJECT);
  
}

void draw()
{
  background(0);
  
  lights();   //create default lights
  pointLight(150, 200, 200,0.0, 0.0, 0.0);   //create an additional point light

  //draw transparent cube faces
  fill(120, 150);
  noStroke();
  pushMatrix();
  translate(width * 0.5, height * 0.5, 0.0);
  rotateZ(millis()/900.0);
  rotateX(millis()/800.0);
  rotateY(millis()/1000.0);
  hint(DISABLE_DEPTH_TEST);   //this is a GL call used to make transparency 
                              //and blending work as expected
  box(200);
  popMatrix();
  hint(ENABLE_DEPTH_TEST);

  //draw cube edges
  noFill();
  strokeWeight(10);
  stroke(0, 255, 255);
  pushMatrix();
  translate(width * 0.5, height * 0.5, 0.0);
  rotateZ(millis()/900.0);
  rotateX(millis()/800.0);
  rotateY(millis()/1000.0);
  box(200);
  popMatrix();




  
  noStroke();
  
  //draw spheres
  fill(255, 0, 255);
  pushMatrix();
  translate(width * 0.5, height * 0.5);
  rotateZ(-millis()/1000.0);
  translate(width *0.3, height * 0.3);
  sphereDetail(10);
  sphere(30);
  popMatrix();

  fill(255, 255, 0);
  pushMatrix();
  translate(width * 0.5, height * 0.5);
  rotateX(-millis()/800.0);
  translate(width *0.0, height * 0.25, height * 0.25);
  sphereDetail(10);
  sphere(30);
  popMatrix();
  
}
