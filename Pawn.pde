public class Pawn extends ChessPiece {
    public Pawn(int x, int y, boolean what, ChessPiece[][] board) {
        super(x, y, what, board);
    }

    int typeOfPiece() {
        return 1;
    }
PImage photoWhite = loadImage("whitePawn.png");
PImage photoBlack = loadImage("blackPawn.png");
    void drawPiece() {
        if (getCol()) {
            photoWhite.resize(75,75);
            image(photoWhite,getX(),getY());
         //   image(photoWhite, getX(),getY());
        } else {
            photoBlack.resize(75,75);
            image(photoBlack,getX(),getY());
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
        
        if (getCol()) {
            if (isValidCapture(x+1, y-1)) {
                output[x + 1][y - 1] = 1;
            }
            if (isValidCapture(x-1, y-1)) {
                output[x - 1][y - 1] = 1;
            }
            if (y - 1 >= 0 && this.getBoard()[y-1][x] == null) {
                if (y == 6 && board[y-2][x] == null) {
                  output[x][y-2] = 1;}  
                  output[x][y-1] = 1;
            }
        } else {
            if (isValidCapture(x+1, y+1)) {
                output[x + 1][y + 1] = 1;
            }  
            if (isValidCapture(x-1, y+1)) {
                output[x - 1][y + 1] = 1;
            }
            if (y + 1 <= 7 && this.getBoard()[y+1][x] == null) {
                if (y == 1 && board[y+2][x] == null) {
                  output[x][y+2] = 1;}  
                  output[x][y+1] = 1;
            }
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
