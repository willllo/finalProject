public class ChessPiece {
    private int xPos, yPos;
    private boolean col;
    private ChessPiece[][] board;
    public ChessPiece(int x, int y, boolean what, ChessPiece[][] board1) {
        xPos = x * 600 / 8;
        yPos = y * 600 / 8;
        col = what;
        board = board1;
    }

    
    public ChessPiece() {
        xPos = 0;
        yPos = 0;
        col = true;
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
    void setX(int newX) {
        xPos = newX;
    }
    void setY(int newY) {
        yPos = newY;
    }
    boolean getCol() {
    return col;}
    void drawPiece() {
        circle(xPos, yPos, 25);
        fill(0x0000FF);
    }
    
    void showViable() {}
    
    int[][] findViable() {
        int[][] output = new int[1][1];
        return output;
    }
    ChessPiece[][] getBoard(){
    return board;}
    void move(int x, int y) {}
}
