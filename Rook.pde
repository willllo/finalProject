public class Rook extends ChessPiece {
  public Rook(int x, int y, boolean what, ChessPiece[][] board) {
    super(x,y,what,board);
  }
  int typeOfPiece() {
    return 2;}
PImage whiteImage = loadImage("whiteRook.png");
PImage blackImage = loadImage("blackRook.png");
   void drawPiece() {
   if (getCol()) {
     whiteImage.resize(75,75);
     image(whiteImage,getX(),getY());
   }
     else {
       blackImage.resize(75,75);
     image(blackImage,getX(),getY());
     }
   }
  void showViable() {
        int[][] temp = this.findViable();
        for (int i = 0; i < temp.length; i++) {
            for (int j = 0; j < temp[i].length; j++) {
                if (temp[i][j] == 1) {
                    fill(#FFFF00);
                    square(i * 600 / 8, j * 600 / 8, 600 / 8);
                }
            }
        }
    }
   int[][] findViable() {
   int[][] output = new int[8][8];
   int x = getX() / (600 / 8);
   int y = getY() / (600 / 8);
   boolean up = true;
   boolean down = true;
   boolean right = true;
   boolean left = true;
   for (int i = y - 1; i >= 0; i--) {
       if (board[i][x] != null) {
         if (isValidCapture(x,i) && up) {output[x][i] = 1;}
       up = false;
   }
       if (up) {
       output[x][i] = 1;}
   }
   for (int j = y + 1; j < 8; j++) {
       if (board[j][x] != null) {
         if (isValidCapture(x,j) && down) {output[x][j] = 1;}
       down = false;
   }
       if (down) {
       output[x][j] = 1;}
   }
   for (int k = x - 1; k >= 0; k--) {
     if (board[y][k] != null) {
       if (isValidCapture(k,y) && left) {output[k][y] = 1;}
       left = false;
     }
     if (left) {
     output[k][y] = 1;}
   }
   for (int l = x +1; l < 8; l++) {
     if (board[y][l] != null) {
       if (isValidCapture(l,y) && right) {output[l][y] = 1;}
       right = false;
     }
     if (right) {
     output[l][y] = 1;}
   }
  output[x][y] = 0;
  return output;
  
   }
   boolean isValidCapture(int newRow, int newCol) {
    return newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8 && board[newCol][newRow] != null && board[newCol][newRow].getCol() != this.getCol();
  }
  
  String toString() {
    return getCol()+"Rook";
  }
}
