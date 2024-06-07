public class Queen extends ChessPiece {
    public Queen(int x, int y, boolean what, ChessPiece[][] board) {
        super(x, y, what, board);
    }

    int typeOfPiece() {
        return 5;
    }

    void drawPiece() {
        if (getCol()) {
            fill(#FF0000);
        } else {
            fill(#0000ff);
        }
        rect(getX(), getY(), 100, 100);
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
   boolean upLeft = true;
        boolean upRight = true;
        boolean downLeft = true;
        boolean downRight = true;
        int up1 = y;
        int left1 = x;
        int up2 = y;
        int right1 = x;
        int down1 = y;
        int left2 = x;
        int down2 = y;
        int right2 = x;
        while (downRight) {
          down2++;
          right2++;
          if (down2 > 7 || right2 > 7) {
          downRight = false;
        break;}
          if (board[down2][right2] != null) {
            if (isValidCapture(right2, down2)) {
            output[right2][down2] = 1;}
            downRight = false;
          }
          if (downRight) {
          output[right2][down2] = 1;}
        }
        
        while (downLeft) {
          down1++;
          left2--;
          if (down1 > 7 || left2 < 0) {
          downLeft = false;
        break;}
          if (board[down1][left2] != null) {
          if (isValidCapture(left2, down1)) {output[left2][down1] = 1;}
          downLeft = false;}
          if (downLeft) {
          output[left2][down1] = 1;
        }}
        
        
        while (upRight) {
            up2--;
            right1++;
            if (up2 < 0 || right1 > 7) {
            upRight = false;
            break;}
            if (board[up2][right1] != null) {
              if (isValidCapture(right1, up2)) {output[right1][up2] = 1;}
            upRight = false;
            }
            if (upRight) {output[right1][up2] = 1;}
        }
        
        while (upLeft) {
             up1--;
             left1--;
             if (up1 < 0 || left1 < 0) {
                 upLeft = false;
                 break;
             }
             if (board[up1][left1] != null) {
               if (isValidCapture(left1,up1)) {output[left1][up1] = 1;}
               upLeft = false;
             }
             if (upLeft) {
             output[left1][up1] = 1;
             }
        
        }
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
    void move(int xNew, int yNew) {
      System.out.println (this.findViable()[xNew][yNew]);
         setX(xNew * 600 /8);
         setY(yNew * 600 / 8);
       drawPiece();
    }

}
