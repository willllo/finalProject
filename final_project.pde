ChessPiece[][] board = new ChessPiece[8][8];
int boardSize = 600;
color teamOne = color(255,204,0);
color teamTwo = color(204,255,0);
Pawn test2;
ChessPiece selectedPiece = null;  
int selectedRow = -1;
int selectedCol = -1;
void setup() {
  size(800, 600);
  background(125);
  int squareSize = boardSize / 8;
  
  
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[0].length; j++) {
      if ((i + j) % 2 == 0) {
        fill(255);
      } else {
        fill(0);
      }
      square(i * squareSize, j * squareSize, squareSize);
      
    }
  }
  Pawn test2 = new Pawn(7,7, false);
  board[7][7] = test2;
}

void draw() {
  Pawn test2 = new Pawn(7,7, true);
  test2.drawPiece();
  Pawn test1 = new Pawn(1,3, false);
  test1.drawPiece();
  board[7][7] = test2;
  board[1][3] = test1;
}

void mousePressed() {
  System.out.println ("Stuff's happening");
  int squareSize = boardSize / 8;
  int col = mouseX / squareSize;
  int row = mouseY / squareSize;
  
  if (selectedPiece == null) {
    if (board[row][col] != null) {
      selectedPiece = board[row][col];
      selectedRow = row;
      selectedCol = col;
      selectedPiece.showViable();}
  }
}
 

  

//void viableMoves(ChessPiece[][] board, int x, int y) {
 //     board[x][y].
//      
//  }
//}
