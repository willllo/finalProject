public class King extends ChessPiece {
    public King(int x, int y, boolean what, ChessPiece[][] board) {
        super(x, y, what, board);
    }

    int typeOfPiece() {
        return 6;
    }
PImage whiteImage = loadImage("whiteKing.png");
PImage blackImage = loadImage("blackKing.png");
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
         if (x - 1 >= 0 && y - 1 >= 0) {
           if (board[y-1][x-1] != null) {
             if (isValidCapture1(x-1,y-1)) {
             output[x-1][y-1] = 1;}}
             if (board[y-1][x-1] == null) {
             output[x-1][y-1] = 1;}
         }
         if (y - 1 >= 0) {
           if (board[y-1][x] != null) {
             if (isValidCapture1(x,y-1)) {
             output[x][y-1] = 1;}}
             if (board[y-1][x] == null) {
             output[x][y-1] = 1;}
         }
         if (x + 1 < 8 && y - 1 >= 0) {
           if (board[y-1][x+1] != null) {
             if (isValidCapture1(x+1,y-1)) {
             output[x+1][y-1] = 1;}}
             if (board[y-1][x+1] == null) {
             output[x+1][y-1] = 1;}
         }
         if (x + 1 < 8) {
           if (board[y][x+1] != null) {
             if (isValidCapture1(x+1,y)) {
             output[x+1][y] = 1;}}
             if (board[y][x+1] == null) {
             output[x+1][y] = 1;}
         }
         if (y + 1 < 8) {
           if (board[y+1][x] != null) {
             if (isValidCapture1(x,y+1)) {
             output[x][y+1] = 1;}}
             if (board[y+1][x] == null) {
             output[x][y+1] = 1;}
         }
         if (x - 1 >= 0 && y + 1 < 8) {
           if (board[y+1][x-1] != null) {
             if (isValidCapture1(x-1,y+1)) {
             output[x-1][y+1] = 1;}}
             if (board[y+1][x-1] == null) {
             output[x-1][y+1] = 1;}
         }
         if (x - 1 >= 0) {
           if (board[y][x-1] != null) {
             if (isValidCapture1(x-1,y)) {
             output[x-1][y] = 1;}}
             if (board[y][x-1] == null) {
             output[x-1][y] = 1;}
         }
         if (x + 1 < 8 && y + 1 < 8) {
           if (board[y+1][x+1] != null) {
             if (isValidCapture1(x+1,y+1)) {
             output[x+1][y+1] = 1;}}
             if (board[y+1][x+1] == null) {
             output[x+1][y+1] = 1;}
         }
         for (int i = 0; i < board.length; i++) {
           for (int j = 0; j < board.length; j++) {
             if (board[i][j] != null && board[i][j].getCol() != this.getCol() && board[i][j].typeOfPiece() != 6) {
                 for (int k = 0; k < board.length; k++) {
                   for (int l = 0; l < board.length; l++) {
                     if (board[i][j].typeOfPiece() == 1) {
                       if (board[i][j].getCol()) {
                         if (i - 1 >= 0) {
                           if (j - 1 >= 0) {
                         output[j-1][i-1] = 0;}
                         if (j + 1 < 8) {
                         output[j+1][i-1] = 0;}
                       }}
                       else {
                         if (i + 1 < 8) {
                           if (j - 1 >= 0) {
                         output[j-1][i+1] = 0;}
                         if (j + 1 < 8) {
                         output[j+1][i+1] = 0;}
                       }}
                     }
                    else if (board[i][j].findViable()[k][l] == 1) {
                     output[k][l] = 0;}
                   }}
                
               
             }
           }
         }
           output[x][y] = 0;
          return output;
        
    }
    boolean isValidCapture1(int newRow, int newCol) {
    if (newRow < 0 || newRow >= 8 || newCol < 0 || newCol >= 8) {
        return false;
    }
    
    if (board[newCol][newRow] == null || board[newCol][newRow].getCol() == this.getCol()) {
        return false;
    }

    
     for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board.length; j++) {
            if (board[i][j] != null && board[i][j].getCol() != this.getCol() && board[i][j].typeOfPiece() != 6) {
                if (board[i][j].findViable()[newCol][newRow] == 1) {
                    return false;
                }
            }
        }
    }
    

    return true;
}

  String toString() {
    return getCol()+"King";
  }

}
