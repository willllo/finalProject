public class ChessPiece {
  private int xPos, yPos;
  private boolean col;
  private ChessPiece[][] board;
  private int[][] checkViableMoves;

  public ChessPiece(int x, int y, boolean what, ChessPiece[][] board1) {
    xPos = x * 600 / 8;
    yPos = y * 600 / 8;
    col = what;
    board = board1;
    checkViableMoves = new int[8][8];
  }


  public ChessPiece() {
    xPos = 0;
    yPos = 0;
    col = true;
    checkViableMoves = new int[8][8];
  }

  int typeOfPiece() {
    return 0;
  }

  int getX() {
    return xPos;
  }

  int getY() {
    return yPos;
  }
  
  int getBoardX() {
    return xPos * 8 / 600;
  }
  
  int getBoardY() {
    return yPos * 8 / 600;
  }
  
  void setX(int newX) {
    xPos = newX;
  }
  void setY(int newY) {
    yPos = newY;
  }
  boolean getCol() {
    return col;
  }
  void drawPiece() {
    circle(xPos, yPos, 25);
    fill(0x0000FF);
  }

  void showViable() {
  }
  
  void showCheckViable() {
        int[][] temp = this.checkViableMoves;
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
    int[][] output = new int[1][1];
    return output;
  }
  ChessPiece[][] getBoard() {
    return board;
  }

  void move(int xNew, int yNew) {
      System.out.println (this.findViable()[xNew][yNew]);
       setX(xNew * 600 /8);
       setY(yNew * 600 / 8);
     drawPiece();
  }

  void simulateMove(int xNew, int yNew) {
    board[getBoardY()][getBoardX()] = null;
    board[yNew][xNew] = this;
  }
  
  int[][] getCheckViableMoves() {
    return checkViableMoves;
  }
  
  String toString() {
    return col+"Chess Piece";
  }
}
