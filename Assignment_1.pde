//global arrayLists
ArrayList<TEA> flavourData = new ArrayList<TEA>();
ArrayList<Float> teaData = new ArrayList<Float>(); // Create an arraylist
ArrayList<String> countryData = new ArrayList<String>(); // Create an arraylist

int mode;

void setup()
{ 
    size (500, 500);
    background(0);
    
    loadData();

} 

void loadData()
{ 
  
 String[] tea = loadStrings("tea.csv"); // Load each line into a String array
  for(String s:tea )
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    teaData.add(f);
  } 


   String[] country = loadStrings("Countries.csv"); // Load each line into a String array

   for(String c:country )
  {

    countryData.add(c);
  } 
  

  String[] lines = loadStrings("Flavours.csv");
  
  for(int i = 0; i < lines.length; i++)
  {
    
    //intialising constructor and passing string array
    TEA flavour_ = new TEA(lines[i]);
    //adding data into each element of arrayList gdp
    flavourData.add(flavour_); 
  }
}

void drawBars()
{
      background(0);
      
      float border = width * 0.1f;
      
      float windowRange = (width - (border * 2.0f));
      float dataRange = 80.0f;  
      float barWidth = windowRange / (float) countryData.size();
      
      drawAxis(10, 10, dataRange, border, windowRange); 
      
      float scale = windowRange / dataRange;
      stroke(0, 255, 255);
      
      for (int i = 0 ; i < teaData.size(); i ++)
      {
        float x = border + (i * barWidth);
        float y = border + (teaData.get(i) * scale);
      
       rect(x, height - border, barWidth - 1, -y);
       
      }

}

void drawAxis(int horizIntervals, int verticalIntervals, float vertDataRange, float border, float windowRange)
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
     text(countryData.get(i).substring(0, 3), x, textY);
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
      text((int)hAxisLabel, border - (tickSize * 2.0f), y);
    }
  
} 

void drawWords()
{  
   int j = 20;
  
  for (int i = 0 ; i < flavourData.size(); i ++)
  {
        j += 20; 
        
        float x = 200 + j;
        float y = 200 + j;
        
      //moving onto next element everytime loop iterates
       TEA flavour_ = flavourData.get(i);
   
        text(flavour_.flavour, x, y);
        textSize(flavour_.popularity);
    }
 }

 
void keyPressed() {
  // check which key was pressed and set the
  // draw mode accordingly.
  switch(key) 
  {
    case('0'): drawBars(); break;
    case('1'): drawWords(); break;
 
  }
}

