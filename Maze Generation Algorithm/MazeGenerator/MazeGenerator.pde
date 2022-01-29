import java.util.Stack;
import java.util.Vector;

//Screen ratio aprx 4:7
int vAmount = 20;
int hAmount = 35;

float pathStroke = 20;

float speed = 2;

float pHeight;
float pWidth;

float visitedCells=0;
Vector<Integer> neighbours;
Stack<Cell> stack;
Cell[][] board;

final boolean VISITED = true;
int looper=0;

void setup(){
  fullScreen();
  background(0);
  noStroke();
  pHeight = height/vAmount;
  pWidth  = width/hAmount;
  
  
  stack = new Stack<Cell>();
  board = new Cell[hAmount][vAmount];
  for(int i=0;i<hAmount;i++){
    for(int j=0;j<vAmount;j++){
      board[i][j] = new Cell(i,j,!VISITED);
    }
  }
  //Starting with 0,0 as visited
  stack.push(new Cell(0,0,VISITED));
  board[0][0].visited = true;
  
  buildMaze();
}

void buildMaze(){
  //Maze Algorithm - Recursive Backtracking
  while(visitedCells < vAmount*hAmount-1){
    
    //Step 1:Create a set of the unvisted neighboors
    neighbours = new Vector<Integer>();
    
    //North Neighboor
    if(stack.peek().y > 0){
      if(!(board[stack.peek().x][stack.peek().y-1].visited)){
        neighbours.add(0);
      }
    }
    
    //East Neighboor
    if(stack.peek().x < hAmount-1){
      if(!(board[stack.peek().x+1][stack.peek().y].visited)){
        neighbours.add(1);
      }
    }
    
    //South Neighboor
    if(stack.peek().y < vAmount-1){
      if(!(board[stack.peek().x][stack.peek().y+1].visited)){
        neighbours.add(2);
      }
    }
    
    //West Neighboor
    if(stack.peek().x > 0){
      if(!(board[stack.peek().x-1][stack.peek().y].visited)){
        neighbours.add(3);
      }
    }
    
    //Are there any neighbours available?
    if(!neighbours.isEmpty()){
      //Choose one available neighbour at random
      System.out.println(neighbours.elementAt(0));
      int next_cell_dir = neighbours.elementAt((int) Math.round(Math.random()*(neighbours.size()-1)));
      
      //Create a path between the nighbour and the current cell.
      switch(next_cell_dir){
        case 0: //North
        board[stack.peek().x][stack.peek().y].CELL_PATH_N = true;
        board[stack.peek().x][stack.peek().y-1].CELL_PATH_S = true;
        stack.push(new Cell(stack.peek().x,stack.peek().y-1,VISITED)); // This cell is only used to store coords of current pos in stack
        break;
        
        case 1: //East
        board[stack.peek().x][stack.peek().y].CELL_PATH_E = true;
        board[stack.peek().x+1][stack.peek().y].CELL_PATH_W = true;
        stack.push(new Cell(stack.peek().x+1,stack.peek().y,VISITED));
        break;
        case 2: //South
        board[stack.peek().x][stack.peek().y].CELL_PATH_S = true;
        board[stack.peek().x][stack.peek().y+1].CELL_PATH_N = true;
        stack.push(new Cell(stack.peek().x,stack.peek().y+1,VISITED));
        break;
        case 3: //West
        board[stack.peek().x][stack.peek().y].CELL_PATH_W = true;
        board[stack.peek().x-1][stack.peek().y].CELL_PATH_E = true;
        stack.push(new Cell(stack.peek().x-1,stack.peek().y,VISITED));
        break;
        
      }
      
      //Set current cell as visited
        board[stack.peek().x][stack.peek().y].visited = true;
        visitedCells++;
        return;
    }else{
      stack.pop(); //Back tracking
    }
  }
  stack.push(new Cell(-1,-1,VISITED));
}

void draw(){
  looper++;
  if(looper%speed==0)
  buildMaze();
  noStroke();
  //translate(pathStroke/4,pathStroke/4);
  
  
  //Actually Draw the maze
  for(int x=0;x<hAmount;x++){
    for(int y=0;y<vAmount;y++){
      if(board[x][y].visited){
        fill(255);
      }else{
       fill(125,183,0);
      }
      
      //Colors the current pos
      if(x==stack.peek().x && y==stack.peek().y)
      fill(0);
      
      rect(x*pWidth,y*pHeight,pWidth-(pathStroke/2),pHeight-(pathStroke/2));
      
      
      if(board[x][y].CELL_PATH_N){
        rect(x*pWidth,y*pHeight,pWidth-(pathStroke/2),-pathStroke);
        //fill(255,0,0);
        //rect(x*pWidth,y*pHeight,10,10);
        //fill(255);
      }
      
      if(board[x][y].CELL_PATH_E){
         rect(x*pWidth,y*pHeight,pWidth,pHeight-pathStroke/2); 
         //fill(0,255,0);
         //rect(x*pWidth,y*pHeight,10,10);
         //fill(255);
      }
      
      
      if(board[x][y].CELL_PATH_S){
       rect(x*pWidth,y*pHeight,pWidth-(pathStroke/2),pHeight+pathStroke);
       //fill(0,0,255);
       //rect(x*pWidth,y*pHeight,10,10);
       //fill(255);
      }
      
      if(board[x][y].CELL_PATH_W){
        rect(x*pWidth,y*pHeight,-pathStroke/2,pHeight-pathStroke/2);
        //fill(0,200,200);
        //rect(x*pWidth,y*pHeight,10,10);
        //fill(255);
      }
    }
  }
}
