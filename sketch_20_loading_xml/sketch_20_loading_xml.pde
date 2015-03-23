XML xml;
void setup()
{
 size(800, 800);
 xml = loadXML("http://www.bom.gov.au/fwo/IDZ00059.warnings_vic.xml");
 noLoop();
 background(0);
}

void draw()
{
  XML children[] = xml.getChildren();
  
  for(int i = 0; i < children.length; i ++)
  {
    text(children[i].getContent(), 0, 10 * i);
  }
}
