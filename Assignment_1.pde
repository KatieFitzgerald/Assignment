//global arrayLists
ArrayList<TEA> flavourData = new ArrayList<TEA>();
ArrayList<Pos> xyPos = new ArrayList <Pos>();
ArrayList<Float> teaData = new ArrayList<Float>(); // Create an arraylist
ArrayList<String> countryData = new ArrayList<String>(); // Create an arraylist


//global variables
PImage steam;
float dim = 80.0;
float x;
Boolean mode;

//Control p5 
import controlP5.*;
ControlP5 cp5;


void setup()
{ 
    size (500, 500);
    background(0);
      
   loadData();
  
  //create buttons
  cp5 = new ControlP5(this);
  
  
  cp5.addButton("WordCloud")
     .setValue(0)
     .setPosition(290,30)
     .setSize(200,19);
     
      
  cp5.addButton("BarChart")
     .setValue(1)
     .setPosition(290,50)
     .setSize(200,19);

} 

//check if the buttons are pressed
public void controlEvent(ControlEvent theEvent)
{
     
  if (theEvent.isController())
  {
    if (theEvent.controller().getName() == "BarChart")
    {
      mode = false;
    }
    if (theEvent.controller().getName() == "WordCloud")
    {
      mode = true;
    }
  }
}


void loadData()
{ 
 //load bar chart data
 String[] tea = loadStrings("tea.csv"); // Load each line into a String array
  for(String s:tea )
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    teaData.add(f);
  } 

  //load bar chart countries
   String[] country = loadStrings("Countries.csv"); // Load each line into a String array

   for(String c:country )
  {

    countryData.add(c);
  } 
  
//load tea flavours for word cloud
  String[] lines = loadStrings("Flavours.csv");
  
  for(int i = 0; i < lines.length; i++)
  {
    
    //intialising constructor and passing string array
    TEA flavour_ = new TEA(lines[i]);
    //adding data into each element of arrayList gdp
    flavourData.add(flavour_); 
  }

//load positions for wordcloud
  String[] posXY = loadStrings("xyPos.csv");
  
  for(int i = 0; i < posXY.length; i++)
  {
    
    //intialising constructor and passing string array
    Pos position = new Pos(posXY[i]);
    //adding data into each element of arrayList gdp
    xyPos.add(position); 
  }
  
  //loud clouds
  steam = loadImage("steam.png");
}

void draw()
{
  background(0);

 if(mode == false)
 {
   drawBars();
 }
 else
 {
   drawWords();
 }
}


void drawBars()
{
      
      background(0);
      
      float border = width * 0.1f;
      
      float windowRange = (width - (border * 2.0f));
      float dataRange = 80.0f;  
      float barWidth = windowRange / (float) countryData.size();
      
      drawAxis(10, dataRange, border, windowRange); 
      
      float scale = windowRange / dataRange;
      
      for (int i = 0 ; i < teaData.size(); i ++)
      {
        float x = border + (i * barWidth);
        float y = border + (teaData.get(i) * scale);
      
       int rand = 20;
       rand = rand * i;
    
      stroke(0);
      fill(0, 100, rand);
      rect(x, height - border, barWidth - 1, -y);
       
      }
      
      textAlign(RIGHT, CENTER);  
      textSize(15);
      fill(255);
      text("Consumption of Tea per Capita", 250,30);
  
}

void drawAxis(int verticalIntervals, float vertDataRange, float border, float windowRange)
{
    stroke(200, 200, 200);
    fill(200, 200, 200);  
    
    // Draw the horizontal azis  
    line(border, height - border, width - border, height - border);
  
    float horizInterval =  windowRange / teaData.size();
    float tickSize = border * 0.1f;
    
      
    for (int i = 0 ; i < teaData.size() ; i ++)
    {   
     // Draw the ticks
     float x = border + (i * horizInterval);
      line(x, height - (border - tickSize), x, (height - border));
      
     float textY = height - (border * 0.5f);
     
     // Print the text 
     textAlign(CENTER, CENTER);
     textSize(15);
     fill(255);
     text(countryData.get(i).substring(0,3), x, textY);
    }
    
    // Draw the vertical axis
    line(border, border , border, height - border);
    
    float verticalDataGap = vertDataRange / verticalIntervals;
    
    float verticalWindowRange = height - (border * 2.0f);
    float verticalWindowGap = verticalWindowRange / verticalIntervals; 
    
    for (int i = 0 ; i <= verticalIntervals ; i ++)
    {
      float y = (height - border) - (i * verticalWindowGap);
      line(border - tickSize, y, border, y);
      float hAxisLabel = verticalDataGap * i;
          
      textAlign(RIGHT, CENTER);  
      textSize(10);
      fill(255);
      text((int)hAxisLabel, border - (tickSize * 2.0f), y);
    }
  
} 

void drawWords()
{  
    background(0);
    
      textAlign(RIGHT, CENTER);  
      textSize(15);
      fill(255);
      text("Popular Flavours of Tea", 200,30);
    
    //call cloud animation
    moveSteam();
  
  //loop to draw words for arrayList
  for (int i = 0 ; i < flavourData.size(); i ++)
  {
       int rand = 20;
       rand = rand * i;
    
      fill(0, 100, rand);

     //moving onto next element everytime loop iterates
       TEA flavour_ = flavourData.get(i);
       Pos position = xyPos.get(i);

        textSize(flavour_.popularity);
        text(flavour_.flavour, position.xPos, position.yPos);

  }
 
}
 
void moveSteam()
{
     x = x + 0.8;
     
       if (x > width + dim) 
        {
            x = -dim;
        } 
           
      image(steam, 100 + x, 0);
      image(steam, -100 - x, 0);
      image(steam, 100 + x, 200);
      image(steam, -100 - x, 200);
      
}