class Bubble{
  
  static final color a = #000000;
  static final color c = #CB3200;
  color b;
  boolean swap = false;
  
  private float centreX;
  private float centreY;
  
  private float size;
  float sizeMin;
  float sizeMax;
  boolean growORshrink;
  
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
    sizeMin = size/2;
    sizeMax = 2*size;
    
  }
  
  void displayBubble(){
    if(shape==0)
      rect(centreX-size/2,centreY-size/2,size,size);
    else{
      //ellipse(centreX,centreY,size,size);
      image(ball,centreX-size/2,centreY-size/2,size,size);
    }
      
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
    
    if(size >= 1.25*width){
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
      centreX = width/2;
      centreY = height/2;
      size += 5;
      speedX =0;
      speedY =0;
    }
      
    if(unactivate)
       size -= 5;
  }
  
  void oscillate(){
    if(size < sizeMax){
      growORshrink = true;
    }
    
    if(growORshrink){
      size++;
    }
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
  
  boolean getActivate(){
    return activate;
  }
  
  boolean getUnActivate(){
    return unactivate;
  }
  
  color getColor(){
    if(!swap)
    return a;
    else
    return b;
  }
}
