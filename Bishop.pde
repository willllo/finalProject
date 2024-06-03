public class Bishop extends ChessPiece {
    public Bishop(int x, int y, boolean what, ChessPiece[][] board) {
        super(x, y, what, board);
    }

    int typeOfPiece() {
        return 3;
    }

    void drawPiece() {
        if (getCol()) {
            fill(#FF0000);
        } else {
            fill(#0000ff);
        }
        rect(getX(), getY(), 50, 25);
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