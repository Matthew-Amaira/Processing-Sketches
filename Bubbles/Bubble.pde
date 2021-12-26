class Bubble{
  static final color a = #000000;
  static final color b = #CB3200;
  boolean swap = false;
  
  private float centreX;
  private float centreY;
  
  private float size;
  
  private float speedX;
  private float speedY;
  
  private boolean activate;
  private boolean unactivate;
  
  private int shape;
  
  Bubble(float x, float y,float si, float spX, float spY, int shp){
    setCentreX(x);
    setCentreY(y);
    setSize(si);
    setXSpeed(spX);
    setYSpeed(spY);
    setActivate(false);
    setShape(shp);
  }
  
  void displayBubble(){
    if(shape==0)
      rect(centreX-size/2,centreY-size/2,size,size);
    else
      ellipse(centreX,centreY,size,size);
  }
  
  void ascendBubble(){
    if(centreY<0 || centreY > height){
      speedY *= -1;
    }
    setCentreY(centreY-speedY);
    
    activate();
  }
  
  void swingBubble(){
    if(centreX<0 || centreX>width){
      speedX *= -1;
    }
    setCentreX(centreX-speedX);
  }
 
  
  void activate(){
    if(size >= 2*width){
      swap = !swap;
      unactivate = true;
      activate = false;
    }
    if(size <= 1){
      unactivate = false;
      activate   = false;
      setSize(random(120));
      setXSpeed(random(10)/3);
      setYSpeed(random(10)/3);
    }
      
    if(activate){
      size += 5;
      speedX =0;
      speedY =0;
    }
      
    if(unactivate)
       size -= 5;
  }
  
  void setCentreX(float x){
    centreX = x;
  }
  
  void setCentreY(float y){
    centreY = y;
  }
  
  void setSize(float s){
    size = s;
  }
  
  void setXSpeed(float s){
    speedX = s;
  }
  
  void setYSpeed(float s){
    speedY = s;
  }
  
  void setActivate(boolean a){
    activate = a;
  }
  
  void setShape(int s){
    shape = s;
  }
  
  color getColor(){
    if(!swap)
    return a;
    else
    return b;
  }
}
