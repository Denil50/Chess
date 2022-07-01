//
//  ChessEngine.swift
//  Chess
//
//  Created by Apple on 23.06.2022.
//

import Foundation

struct ChessEngine {
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        if fromCol == toCol && fromRow == toRow {
            return
        }
        
        guard let candidate = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        pieces.remove(candidate)
        pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: candidate.imageName))
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieces {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        return nil
    }

    mutating func initializeGame() {
        pieces.removeAll()
        
        pieces.insert(ChessPiece(col: 0, row: 0, imageName: "Rook-black"))
        pieces.insert(ChessPiece(col: 7, row: 0, imageName: "Rook-black"))
        pieces.insert(ChessPiece(col: 0, row: 7, imageName: "Rook-white"))
        pieces.insert(ChessPiece(col: 7, row: 7, imageName: "Rook-white"))
        pieces.insert(ChessPiece(col: 1, row: 0, imageName: "Knight-black"))
        pieces.insert(ChessPiece(col: 6, row: 0, imageName: "Knight-black"))
        pieces.insert(ChessPiece(col: 1, row: 7, imageName: "Knight-white"))
        pieces.insert(ChessPiece(col: 6, row: 7, imageName: "Knight-white"))
        pieces.insert(ChessPiece(col: 2, row: 0, imageName: "Bishop-black"))
        pieces.insert(ChessPiece(col: 5, row: 0, imageName: "Bishop-black"))
        pieces.insert(ChessPiece(col: 2, row: 7, imageName: "Bishop-white"))
        pieces.insert(ChessPiece(col: 5, row: 7, imageName: "Bishop-white"))
        pieces.insert(ChessPiece(col: 3, row: 0, imageName: "Queen-black"))
        pieces.insert(ChessPiece(col: 3, row: 7, imageName: "Queen-white"))
        pieces.insert(ChessPiece(col: 4, row: 0, imageName: "King-black"))
        pieces.insert(ChessPiece(col: 4, row: 7, imageName: "King-white"))
        pieces.insert(ChessPiece(col: 0, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 1, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 2, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 3, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 4, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 5, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 6, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 7, row: 1, imageName: "Pawn-black"))
        pieces.insert(ChessPiece(col: 0, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 1, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 2, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 3, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 4, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 5, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 6, row: 6, imageName: "Pawn-white"))
        pieces.insert(ChessPiece(col: 7, row: 6, imageName: "Pawn-white"))
    }
}



