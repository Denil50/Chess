//
//  BoardView.swift
//  Chess
//
//  Created by Apple on 22.06.2022.
//

import UIKit

class BoardView: UIView {

    let ratio: CGFloat = 0.95
    var coordinateX: CGFloat = -10
    var coordinateY: CGFloat = -10
    var sizeCell: CGFloat = -10
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    
    override func draw(_ rect: CGRect) {
        coordinateX = (bounds.width * (1 - ratio) / 2)
        coordinateY = (bounds.height * (1 - ratio) / 2)
        sizeCell = (bounds.width * ratio / 8)
        
        drawBoard()
        drawPieces()
    }
    
    func drawPieces() {
        for piece in shadowPieces {
            let piecesImage = UIImage(named: piece.imageName)
            piecesImage?.draw(in: (CGRect(x: coordinateX + (CGFloat(piece.col) * sizeCell),
                                          y: coordinateY + (CGFloat(piece.row) * sizeCell),
                                          width: sizeCell, height: sizeCell)))
        }
    }
//MARK: -Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        print(fingerLocation)
        
        let fromCol = Int((fingerLocation.x - coordinateX) / sizeCell)
        let fromRow = Int((fingerLocation.y - coordinateX) / sizeCell)
        print("FROMx: \(fromCol), y: \(fromRow)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol = Int((fingerLocation.x - coordinateX) / sizeCell)
        let toRow = Int((fingerLocation.y - coordinateX) / sizeCell)
        print("TOx: \(toCol), y: \(toRow)")
    }
    
    func drawBoard() {
        for row in 0..<4 {
            for col in 0..<4 {
                drawSquare(col:  col * 2, row: row * 2, color: UIColor.white)
                drawSquare(col: (col * 2) + 1, row: row * 2, color: UIColor.black)
                
                drawSquare(col:  col * 2, row: (row * 2) + 1, color: UIColor.black)
                drawSquare(col: (col * 2) + 1, row: (row * 2) + 1, color: UIColor.white)
            }
        }
    }

    func drawSquare(col: Int, row: Int, color: UIColor) {
        let path = UIBezierPath(rect: CGRect(x: coordinateX + (CGFloat(col) * sizeCell),
                                             y: coordinateY + (CGFloat(row) * sizeCell),
                                             width: sizeCell, height: sizeCell))
        color.setFill()
        path.fill()
    }

}
