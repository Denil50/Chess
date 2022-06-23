//
//  ViewController.swift
//  Chess
//
//  Created by Apple on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    
    
    var chessEngine: ChessEngine = ChessEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
    }


}

