//
//  PawnPiece.swift
//  MacChess
//
//  Created by Josef Hansson-Karakoca on 23/09/16.
//  Copyright © 2016 Josef Hansson-Karakoca. All rights reserved.
//

import Foundation

class Pawn: ChessPiece {
    
    override func possibleMoves() -> [BoardPosition]{
        
        var possibleMoves:[BoardPosition] = []
        
        //TODO: Possible twosteps in First Postion
        //TODO: Turn into Queen on last row
        
        var forward = direction.up
        
        if self.colorOfPiece == PieceColor.black{
            forward = direction.down
        }
        
        
        if let move = ChessMoves.moveNsteps(position: self.position, directions: [forward]){
            if GameBoard().pieceOnPosion(position: move) == nil {
                possibleMoves.append(move)
            }
        }
        if let move = ChessMoves.moveNsteps(position: self.position, directions: [forward, .right]){
            if(GameBoard().isEnemyPiece(colorOfPiece: self.colorOfPiece, position: move)){
                possibleMoves.append(move)
            }
        }
        if let move = ChessMoves.moveNsteps(position: self.position, directions: [forward, .left]){
            if(GameBoard().isEnemyPiece(colorOfPiece: self.colorOfPiece, position: move)){
                possibleMoves.append(move)
            }
        }
        return possibleMoves
    }
    
    override init(typeOfPiece:PieceType, colorOfPiece:PieceColor, position:BoardPosition){
        super.init(typeOfPiece: typeOfPiece, colorOfPiece: colorOfPiece, position: position)
    }
}
