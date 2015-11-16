class TEA
{
  //fields
  String flavour;
  float popularity;

  
  
  //Constructor
  TEA(String line)
  {
    String[] col = line.split(",");
    
    flavour = col[0];
    popularity = Float.parseFloat(col[1]);
  }
  
}

