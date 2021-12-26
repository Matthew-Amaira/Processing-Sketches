ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
final int id = (int)random(bubbles.size()-1);

 
void setup(){
  size(800,600);
  for(int i=0;i<100;i++){
    
    Bubble b = new Bubble(random(width),height,random(120),random(10)/3,random(10)/3,/*0=rect,else=circle */1);
    bubbles.add(b);
  }
}

void draw(){
  //background(#CB3200);
  background(bubbles.get(id).getColor());
  fill(#FF8000);
  noStroke();
  for(Bubble b: bubbles){
    b.displayBubble();
    b.ascendBubble();
    b.swingBubble();
  }
}

void mousePressed(){
  bubbles.get(id).setActivate(true);
}
