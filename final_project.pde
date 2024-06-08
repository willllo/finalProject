import java.util.Arrays;
ChessPiece[][] board = new ChessPiece[8][8];
int boardSize = 600;
color teamOne = color(255,204,0);
color teamTwo = color(204,255,0);
boolean teamGoing = true;
Pawn test2;
ChessPiece selectedPiece = null;  
int selectedRow = -1;
int selectedCol = -1;
int[][] attackingCheckViableMoves = new int[8][8];
int[] attackingCheckCoords = new int[2];

ArrayList<ChessPiece> defendingCheckPieces = new ArrayList<ChessPiece>();

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
  King RedKing = new King (4, 7, true, board);
  King BlueKing = new King (4,0, false, board);
  Knight RedKnight1 = new Knight(1,7, true, board);
  Knight RedKnight2 = new Knight(6,7,true,board);
  Bishop RedBishop2 = new Bishop(5, 7, true, board);
  Bishop RedBishop1 = new Bishop(2, 7, true, board);
  Bishop BlueBishop1 = new Bishop(5, 0, false, board);
  Bishop BlueBishop2 = new Bishop(2, 0, false, board);
  Knight BlueKnight1 = new Knight(1,0, false, board);
  Knight BlueKnight2 = new Knight(6,0, false, board);
  Rook RedFirst = new Rook(0, 7, true, board);
  Queen RedQueen = new Queen(3,7, true,board);
  Queen BlueQueen = new Queen(3,0, false, board);
  Rook RedSecond = new Rook(7, 7, true, board);
  Rook BlueFirst = new Rook(0,0, false, board);
  Rook BlueSecond = new Rook(7,0, false, board);
  Pawn Red1 = new Pawn(0,6, true, board);
  Pawn Red2 = new Pawn(1,6, true, board);
  Pawn Red3 = new Pawn(2,6, true, board);
  Pawn Red4 = new Pawn(3,6, true, board);
  Pawn Red5 = new Pawn(4,6, true, board);
  Pawn Red6 = new Pawn(5,6, true, board);
  Pawn Red7 = new Pawn(6,6, true, board);
  Pawn Red8 = new Pawn(7,6, true, board);
  Pawn Blue1 = new Pawn(0,1, false, board);
  Pawn Blue2 = new Pawn(1,1, false, board);
  Pawn Blue3 = new Pawn(2,1, false, board);
  Pawn Blue4 = new Pawn(3,1, false, board);
  Pawn Blue5 = new Pawn(4,1, false, board);
  Pawn Blue6 = new Pawn(5,1, false, board);
  Pawn Blue7 = new Pawn(6,1, false, board);
  Pawn Blue8 = new Pawn(7,1, false, board);
  board[0][2] = BlueBishop2;
  board[0][4] = BlueKing;
  board[0][3] = BlueQueen;
  board[0][1] = BlueKnight1;
  board[0][6] = BlueKnight2;
  board[0][5] = BlueBishop1;
  board[0][0] = BlueFirst;
  board[0][7] = BlueSecond;
  board[1][0] = Blue1;
  board[1][1] = Blue2;
  board[1][2] = Blue3;
  board[1][3] = Blue4;
  board[1][4] = Blue5;
  board[1][5] = Blue6;
  board[1][6] = Blue7;
  board[1][7] = Blue8;
  board[7][4] = RedKing;
  board[7][1] = RedKnight1;
  board[7][3] = RedQueen;
  board[7][6] = RedKnight2;
  board[7][5] = RedBishop2;
  board[7][2] = RedBishop1;
  board[7][0] = RedFirst;
  board[7][7] = RedSecond;
  board[6][0]= Red1;
  board[6][1] = Red2;
  board[6][2] = Red3;
  board[6][3] = Red4;
  board[6][4] = Red5;
  board[6][5] = Red6;
  board[6][6] = Red7;
  board[6][7] = Red8;
  
  drawBoard();

}

void draw() {
  fill (125);
  rect(600,0, 1000,1000);
  fill(0);
  if (teamGoing == true) {
  text ("White's Turn", 650, 75);}
  else {
  text ("Black's Turn", 650, 75);
  }
  if (isKingInCheck(true)) {
  text ("WHITE KING IN CHECK" , 650 ,150);
  }
  if (isKingInCheck(false)) {
  text ("BLACK KING IN CHECK", 650, 250);
  }
  if (isCheckMate(true)) {
  text ("White lost!", 650, 300);
  }
  if (isCheckMate(false)) {
   text("Black lost!", 650, 350);
  }
  
}
void drawBoard() {
    int squareSize = boardSize / 8;
    for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[0].length; j++) {
      if ((i + j) % 2 == 0) {
        fill(255);
      } else {
        fill(100);
      }
      square(i * squareSize, j * squareSize, squareSize);
      
    }
  }
  for (int a = 0; a < board.length; a++) {
    for (int b = 0; b < board.length; b++) {
      if (board[a][b] != null) {
        board[a][b].drawPiece();
      }
    }}

}
void mousePressed() {
  int squareSize = boardSize / 8;
  int col = mouseX / squareSize;
  int row = mouseY / squareSize;
  if (col > 8 || row > 8) {
    col = 9;
    row = 9;}
  if (selectedPiece == null && col < 8 && row < 8) {
    if (board[row][col] != null && board[row][col].getCol() == teamGoing) {
      selectedPiece = board[row][col];
      selectedRow = row;
      selectedCol = col;
      System.out.println (selectedPiece.typeOfPiece());
      
      if (isKingInCheck(teamGoing)) { 
          findDefendingCheckPieces(teamGoing);
          if (!isDefendingPiece(row, col) && board[row][col].typeOfPiece() != 6) {
            selectedPiece = null;
            selectedRow = 0;
            selectedCol = 0;
          } else {
            if (board[row][col].typeOfPiece() == 6) selectedPiece.showViable();
            else selectedPiece.showCheckViable();
          }
       }
       else if (selectedPiece != null) {
      selectedPiece.showViable();     
      
      }}
  }
  else {
    int[][] viableBoard = selectedPiece.findViable();
    if (isKingInCheck(teamGoing) && selectedPiece.typeOfPiece() != 6) {
      println("HELLO");
      viableBoard = selectedPiece.getCheckViableMoves();
    }
    if (viableBoard[col][row] == 1 && board[row][col] != selectedPiece) {
      
      board[selectedRow][selectedCol] = null;

      board[row][col] = selectedPiece;
      selectedPiece.move(col, row);
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
      drawBoard();
      System.out.println ("Is king in checkmate?:" + isCheckMate(!teamGoing));
      if (isCheckMate(!teamGoing)) {
        fill (#FFFF00);
        text("Game is over", 600, 200);
      }
      teamGoing = !teamGoing;
  //    fill (125);
   //   rect(600, 0, 200, 800);
    }
    else {
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
      drawBoard();
    }
  }
}
 
boolean isCheckMate(boolean team) {
    int kingRow = 0;
    int kingCol = 0;
    for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board[i].length; j++) {
          if (board[i][j] != null){
            if (board[i][j].typeOfPiece() == 6 && board[i][j].getCol() == team) {
                kingRow = i;
                kingCol = j;
            }
        }
    }}
    boolean kingHasNoMoves = true;
    for (int k = 0; k < board.length; k++) {
      for (int l = 0; l < board.length; l++) {
        if (board[kingRow][kingCol].findViable()[k][l] == 1) {
          kingHasNoMoves = false;
        }
      }
    }
    //System.out.println ("Is King in check?:" + isKingInCheck(team));
    //System.out.println ("Does king have no moves?:" + kingHasNoMoves);
    if (isKingInCheck(team) && kingHasNoMoves) {
    return true;}
    return false;
}
 
 
int[][] swapRowCol(int[][] input) {
     int[][] output = new int[input.length][input[0].length];
     for (int i = 0; i < output.length; i++) {
       for (int j = 0; j < output.length; j++) {
         output[i][j] = input[j][i];
       }}
     
     return output;
}
boolean isKingInCheck(boolean team) {  
    int kingRow = 0;
    int kingCol = 0;
    for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board[i].length; j++) {
          if (board[i][j] != null){
            if (board[i][j].typeOfPiece() == 6 && board[i][j].getCol() == team) {
                kingRow = i;
                kingCol = j;
            }
        }
    }}
    for (int i = 0; i < board.length; i++) {
        for (int j = 0; j < board[i].length; j++) {
            ChessPiece piece = board[i][j];
            if (piece != null && piece.getCol() != team) {
                int[][] viableMoves = piece.findViable();
                if (viableMoves[kingCol][kingRow] == 1) {
                    attackingCheckViableMoves = piece.findViable();
                    attackingCheckCoords[0] = piece.getBoardX();
                    attackingCheckCoords[1] = piece.getBoardY();
                    return true;
                }
            }
        }
    }
    return false;
}

void findDefendingCheckPieces(boolean team) {
  defendingCheckPieces.clear();
  for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
            ChessPiece piece = board[i][j];
            boolean inDefender = false;
            if (piece != null && piece.getCol() == team) {
                int[][] viableMoves = piece.findViable();
                int tempX = 0;
                int tempY = 0;
                for (int y_viable = 0; y_viable < board.length; y_viable++) {
                  for (int x_viable = 0; x_viable < board[0].length; x_viable++) {
                     if (viableMoves[y_viable][x_viable] == 1 && attackingCheckViableMoves[y_viable][x_viable] == 1) { //<>//
                       //print(y_viable + " " + x_viable + piece +  "|");
                       tempX = piece.getBoardX();
                       tempY = piece.getBoardY();
                       piece.simulateMove(y_viable, x_viable);
                       if (!isKingInCheck(teamGoing)) {
                         piece.getCheckViableMoves()[y_viable][x_viable] = 1;
                         defendingCheckPieces.add(piece);
                         inDefender = true;
                       }
                       board[x_viable][y_viable] = null;
                       piece.simulateMove(tempX, tempY);
                    }
                  }
                }
                if (piece.findViable()[attackingCheckCoords[0]][attackingCheckCoords[1]] == 1) {
                  piece.getCheckViableMoves()[attackingCheckCoords[0]][attackingCheckCoords[1]] = 1;
                  if (!inDefender) defendingCheckPieces.add(piece);  

              }
            }
        }
    }
}

boolean isDefendingPiece(int row, int col) {
  for (ChessPiece p: defendingCheckPieces) {
    if (board[row][col] == p) return true;
  }
  return false;
}

void printBoard() {
  for (ChessPiece[] i: board) {
    for (ChessPiece j: i) {
      print(j + " ");
    }
    print("\n");
  }
}

//void viableMoves(ChessPiece[][] board, int x, int y) {
 //     board[x][y].
//      
//  }
//}
