float circleX;
float circleY;
float diameter =60;

float xSpeed=5;
float ySpeed=5;

float accelerate=0.1;

float lineX1;
float lineX2;

void setup(){
  size(800,600);
  background(#9B0E27);
  noCursor();
  circleX = random(width);
  circleY = 0;
}

void draw(){
  background(#9B0E27);
  
  //Bouncing Ball
  fill(255);
  noStroke();
  circle(circleX,circleY,diameter);
  circleX += xSpeed;
  circleY += ySpeed;
  
  if(circleX > width || circleX < 0){
    xSpeed *= -1;
  }
  if(circleY < 0){
    ySpeed *= -1;
  }
  
  //Moving Platform
  drawLine();
  if(touches()){
    ySpeed *= -(1 + accelerate);
    xSpeed *= (1 + accelerate/2);
  }
  
  //Game Over Check
  if(circleY > height){
    //Game Over
    exit();
  }
}

boolean touches(){
  boolean touches = circleY == 0.8*height-(diameter/2);
  touches = touches && (circleX >= lineX1 && circleX <= lineX2); 
  return touches;
}

void circle(float x, float y, float d){
  ellipse(x,y,d,d);
}

void drawLine(){
  stroke(0);
  strokeWeight(7);
  lineX1 = mouseX-100;
  lineX2 = mouseX+100;
  line(lineX1,0.8*height,lineX2,0.8*height);
}
