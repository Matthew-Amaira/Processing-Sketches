int arraySize = 30;
float Speed = 30;

Rectangle[] boxes = new Rectangle[arraySize];
float rWidth;
float rHeight;
int point = 0;

boolean swaps = false;

void setup(){
fullScreen();
rWidth  = (0.8*width);
rHeight = (0.8*height);

  for(int i=0;i<boxes.length;i++){
  boxes[i] = new Rectangle(i);
  }
}

void draw(){ 
  if(point<arraySize-1){
    background(200);
    fill(100);
    rect(width*0.1,height*0.1,rWidth,rHeight);
    fill(255);
    for(int i=0;i<arraySize;i++){
      fill(boxes[i].c);
      boxes[i].drawRectangle();
    }
    
    if(boxes[point].h < boxes[point+1].h){
      swaps = true;
      Rectangle t = boxes[point];
      //float tempHeight = boxes[point].h;
      if(boxes[point].xTemp < (0.1*width)+((point+1)*boxes[point].widthTmp)-1){
        boxes[point].xTemp += boxes[point].widthTmp/Speed;
      }else{
        //boxes[point].h = boxes[point+1].h;
        //boxes[point] = boxes[point+1];
      }
      if(boxes[point+1].xTemp > (0.1*width)+((point)*boxes[point].widthTmp)+1){
        boxes[point+1].xTemp -= boxes[point].widthTmp/Speed;
      }else{
        //boxes[point+1].h = tempHeight;
        boxes[point] = boxes[point+1];
        boxes[point+1] = t;

      }
      
    }else{
      point++;
    }
    
  }else{
    if(!swaps){
      noLoop();
    }
    point=0;
    swaps = false;
  }
}
