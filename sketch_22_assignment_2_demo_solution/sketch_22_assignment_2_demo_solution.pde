XML feed;
String cityName;
int currentTemp;
String sunriseString, sunsetString;
int[] temps = new int[5];
String[] description = new String[5];
String[] days = new String[5];
int[] colors = new int[5];
XML[] forecastFeed;
int selectionIndex = -1;
boolean debug = false;


void setup()
{

  //load melbourne weather data from yahoo ( https://developer.yahoo.com/weather/ )
  feed = loadXML( "http://weather.yahooapis.com/forecastrss?w=55864247&u=c" );

  //save the feed locally for debugging and reference
  saveXML( feed, "feed.xml" );

  //load data from XML feed into variables
  loadData();


  size( 800, 800, P3D );
  background( 30 );
  strokeWeight ( 5 );
  sphereDetail( 4 );  
  textSize( 60 );
  textAlign( CENTER, CENTER );
}


void draw()
{

  checkSelection( mouseX );
  if( debug ) println( selectionIndex );



  background( 20 );
  float breathe = sin( millis()/800.0 ) * 0.1;
  
  int b = (int)random(25) + 230;
  ambientLight( 20, 20, 20 );
  



  //MOVING LIGHT
  pushMatrix();
  float xpos = cos( millis() / 800.0 ) * ( width * 0.9 ) / 2.0;
  translate( width * 0.5 + xpos, height * 0.6, -200.0 );
  pointLight(  b, b, b, 0, 0, 0.0 );
  fill( b, b, 0, 80 );
  if( debug ) sphere( 40 );
  popMatrix();


  //highlight light
  pushMatrix();
  translate( width / 5 * ( selectionIndex + 0.5 ), height * 0.5, 200.0 );
  pointLight( b * 10.0, b * 10.0, b * 10.0, 0, 0, 0.0 );
  fill( b, b, 0, 80 );
  if( debug ) sphere( 40 );
  popMatrix();


  for( int i = 0; i < 5; i++ )
  {
    pushMatrix();
    
    translate( i * (width * 0.2) + 80.0, height * 0.5 + 90.0, -10.0 );
    int yScale = (int) map(temps[i], 15, 21, 1, 4 );
    pushMatrix();
    scale( 1.0, yScale + abs(breathe), 1.0 );
    translate( 0.0, -1.0/(float)temps[i] * 1500.0, 0.0 );

    colorMode(HSB, 15, 100, 100, 100 );


    if( selectionIndex != i ) noStroke();

    //BOX COLOR
    fill( temps[i] - 5, 80, 50, 100 );
    box( 100.0 );
    colorMode(RGB, 255, 255, 255, 255 );
    popMatrix();

    fill( 255, 255, 255 );
    stroke( b, b, b );


    colorMode( HSB, 15, 100, 100, 100 );

    //TEXT COLOR
    fill( ( temps[i]  - 7) % 15, 50, 80, 100 );

    translate( 0.0, 150.0 );
    translate( 0.0, - ( yScale * 100)/2 - 30, 60.0 + breathe * 100.0 );
    text( "" + temps[i], 0.0, 0.0 );

    translate( 0.0, 50.0, 0.0 );
    textSize( 40 );
    text( forecastFeed[i].getString( "day" ).toUpperCase(), 0.0, 0.0 );
    colorMode( RGB, 255, 255, 255, 255 );
    popMatrix();

  }

  //WEATHER DESCRIPTION
  pushMatrix();
  pushStyle();
  translate( width * 0.5, 30.0, 0.0 );
  noLights();

  if( selectionIndex >= 0 ) 
  {
    colorMode( HSB, 15, 100, 100, 100 );
    fill( ( temps[selectionIndex]  - 7) % 15, 50, 80, 100 );
    text( description[selectionIndex], 0.0, 0.0 );
    colorMode( RGB, 255, 255, 255, 255 );
  }
  popStyle();
  popMatrix();


  


}


void loadData()
{
  println( "loading data..." );

  //find location attribute
  XML locationFeed = feed.getChild( "channel" ).getChild( "yweather:location" );
  //different way to do it:
  XML conditionFeed = feed.getChild( "channel/item/yweather:condition" );
  XML astroFeed = feed.getChild( "channel/yweather:astronomy" );

  forecastFeed = feed.getChild( "channel/item" ).getChildren( "yweather:forecast" );

  for( int i = 0; i < forecastFeed.length; i++ )
  {
    temps[i] = forecastFeed[i].getInt( "high" );
    println( temps[i] );

    description[i] = forecastFeed[i].getString( "text" );
    println( description[i] );    
  }



  cityName = locationFeed.getString( "city" );
  println( "City name = " + cityName );

  currentTemp = conditionFeed.getInt( "temp" );
  println( "Temp = " + currentTemp );

  sunsetString = astroFeed.getString( "sunset" );
  println( "sunset = " + sunsetString );  


  sunriseString = astroFeed.getString( "sunrise" );
  println( "sunrise = " + sunriseString );  

}

void checkSelection( int input )
{


  for( int i = 0; i < 5; i++ )
  {
    if( input > ( i ) * width / 5 ) selectionIndex = i;    
  }

}As
