public class King extends ChessPiece {
    public King(int x, int y, boolean what, ChessPiece[][] board) {
        super(x, y, what, board);
    }

    int typeOfPiece() {
        return 6;
    }

    void drawPiece() {
        if (getCol()) {
            fill(#FF0000);
        } else {
            fill(#0000ff);
        }
        rect(getX(), getY(), 35, 25);
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
             if (isValidCapture(x-1,y-1)) {
             output[x-1][y-1] = 1;}}
             if (board[y-1][x-1] == null) {
             output[x-1][y-1] = 1;}
         }
         if (y - 1 >= 0) {
           if (board[y-1][x] != null) {
             if (isValidCapture(x,y-1)) {
             output[x][y-1] = 1;}}
             if (board[y-1][x] == null) {
             output[x][y-1] = 1;}
         }
         if (x + 1 < 8 && y - 1 >= 0) {
           if (board[y-1][x+1] != null) {
             if (isValidCapture(x+1,y-1)) {
             output[x+1][y-1] = 1;}}
             if (board[y-1][x+1] == null) {
             output[x+1][y-1] = 1;}
         }
         if (x + 1 < 8) {
           if (board[y][x+1] != null) {
             if (isValidCapture(x+1,y)) {
             output[x+1][y] = 1;}}
             if (board[y][x+1] == null) {
             output[x+1][y] = 1;}
         }
         if (y + 1 < 8) {
           if (board[y+1][x] != null) {
             if (isValidCapture(x,y+1)) {
             output[x][y+1] = 1;}}
             if (board[y+1][x] == null) {
             output[x][y+1] = 1;}
         }
         if (x - 1 >= 0 && y + 1 < 8) {
           if (board[y+1][x-1] != null) {
             if (isValidCapture(x-1,y+1)) {
             output[x-1][y+1] = 1;}}
             if (board[y+1][x-1] == null) {
             output[x-1][y+1] = 1;}
         }
         if (x - 1 >= 0) {
           if (board[y][x-1] != null) {
             if (isValidCapture(x-1,y)) {
             output[x-1][y] = 1;}}
             if (board[y][x-1] == null) {
             output[x-1][y] = 1;}
         }
         if (x + 1 < 8 && y + 1 < 8) {
           if (board[y+1][x+1] != null) {
             if (isValidCapture(x+1,y+1)) {
             output[x+1][y+1] = 1;}}
             if (board[y+1][x+1] == null) {
             output[x+1][y+1] = 1;}
         }
          return output;
        
    }
    boolean isValidCapture(int newRow, int newCol) {
    return newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8 && board[newCol][newRow] != null && board[newCol][newRow].getCol() != this.getCol();
  }
    void move(int xNew, int yNew) {
      System.out.println (this.findViable()[xNew][yNew]);
         setX(xNew * 600 /8);
         setY(yNew * 600 / 8);
       drawPiece();
    }

}
