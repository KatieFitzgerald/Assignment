class Pos
{
  
  float xPos;
  float yPos;
  
  Pos(String posXY)
  {
    String[] col2 = posXY.split(",");
    
    xPos = Float.parseFloat(col2[0]);
    yPos = Float.parseFloat(col2[1]);
  
  }

}

