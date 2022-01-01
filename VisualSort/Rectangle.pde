class Rectangle{
  int id;
  float h = random(rHeight*0.75);
  color c;
  float widthTmp;
  float heightTmp;
  float xTemp;
  float yTemp;
  
  float dest = -1;
      
  Rectangle(int i){
    id =i;
    widthTmp = rWidth/arraySize;
    heightTmp = rHeight-h;
    xTemp = (rWidth/arraySize*id)+(width*0.1);
    yTemp = rHeight-heightTmp+(0.1*height);
    c = color(255,255,255);
  }
  
  public void drawRectangle(){
    rect(xTemp,yTemp,widthTmp,heightTmp);
  }
}
