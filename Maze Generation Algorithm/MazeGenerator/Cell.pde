class Cell{
  public int x;
  public int y;
  
  public boolean visited;
  
  public boolean CELL_PATH_N;
  public boolean CELL_PATH_E;
  public boolean CELL_PATH_S;
  public boolean CELL_PATH_W;

  
  //Constructor
  public Cell(int x1,int y1,boolean v){
    visited = v;
    x = x1;
    y = y1;
    
    CELL_PATH_N = false;
    CELL_PATH_E = false;
    CELL_PATH_S = false;
    CELL_PATH_W = false;
  }
}
