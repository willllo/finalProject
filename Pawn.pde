public class Pawn extends ChessPiece {
    public Pawn(int x, int y, boolean what) {
        super(x, y, what);
    }

    int typeOfPiece() {
        return 1;
    }

    void drawPiece() {
        if (getCol()) {
            fill(#FF0000);
        } else {
            fill(#0000ff);
        }
        rect(getX(), getY(), 25, 25);
    }

    void showViable() {
        System.out.println("Stuff's happening");
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
            if (x + 1 <= 7 && y - 1 >= 0) {
                output[x + 1][y - 1] = 1;
            }
            if (x - 1 >= 0 && y - 1 >= 0) {
                output[x - 1][y - 1] = 1;
            }
        } else {
            if (x + 1 <= 7 && y + 1 <= 7) {
                output[x + 1][y + 1] = 1;
            }
            if (x - 1 >= 0 && y + 1 <= 7) {
                output[x - 1][y + 1] = 1;
            }
        }

        return output;
    }
    void move(int xNew, int yNew) {
          setX(xNew);
          setY(yNew);
       drawPiece();
    }

}
