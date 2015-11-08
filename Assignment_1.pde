void setup()
{ 
    size (500, 500);
    background(0);

}   

void drawBars(ArrayList<Float> teaData, ArrayList<String> countryData)
{
      background(0);
      
      float border = width * 0.1f;
      
      float windowRange = (width - (border * 2.0f));
      float dataRange = 80.0f;  
      float barWidth = windowRange / (float) countryData.size();
      
      drawAxis(teaData, countryData, 10, 10, dataRange, border, windowRange); 
      
      float scale = windowRange / dataRange;
      stroke(0, 255, 255);
      
      for (int i = 0 ; i < teaData.size(); i ++)
      {
        float x = border + (i * barWidth);
        float y = border + (teaData.get(i) * scale);
      
       rect(x, height - border, barWidth - 1, -y);
       
      }

}

void drawAxis(ArrayList<Float> teaData, ArrayList<String> countryData, int horizIntervals, int verticalIntervals, float vertDataRange, float border, float windowRange)
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

void drawBars(ArrayList<Float> teaData)
{
    float barW = width / (float) teaData.size();
    
    for( int i =0; i < teaData.size(); i++)
    {
        stroke(0);
        fill(255);
        float x = i *barW;
        rect(x, height, barW, -teaData.get(i));
        
     }

}



void draw()
{ 
  
 String[] tea = loadStrings("tea.csv"); // Load each line into a String array
 ArrayList<Float> teaData = new ArrayList<Float>(); // Create an arraylist
 
  for(String s:tea )
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    teaData.add(f);
  } 


   String[] country = loadStrings("Countries.csv"); // Load each line into a String array
   ArrayList<String> countryData = new ArrayList<String>(); // Create an arraylist
 
   for(String c:country )
  {

    countryData.add(c);
  } 
 
 
  drawBars(teaData, countryData);
}
 


