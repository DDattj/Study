//
//  BackGround.swift
//  Tetris
//
//  Created by 이시안 on 1/31/24.
//

import Foundation
import SpriteKit

class BackGround {

    let row = 11
    let col = 21
    let brickSize = Variables.brickValue.brickSize
    let gab = Variables.gab
    let scene = Variables.scene
    
    init() {
        Variables.backarrys = Array(repeating: Array(repeating: 0, count: row), count: col)
        let xValue = ((Int(scene.frame.width) - row * brickSize) + brickSize) / 2
        Variables.startPoint = CGPoint(x: xValue, y: 80)
        bg()
    }
    
    func bg(){
        for i in 0..<row{
            Variables.backarrys[col-1][i] = 2
            Variables.scene.addChild(wall(x: i, y: col-1))
        }
        for i in 0..<col-1{
            Variables.backarrys[i][0] = 2
            Variables.scene.addChild(wall(x: 0, y: i))
        }
        for i in 0..<col-1{
            Variables.backarrys[i][row-1] = 2
            Variables.scene.addChild(wall(x: row-1, y: i))
        }
        for i in 0..<row{
            Variables.backarrys[0][i] = 2
            Variables.scene.addChild(wall(x: i, y: 0))
        }
    }
    func wall(x: Int , y: Int) -> SKSpriteNode{
        let brick = SKSpriteNode()
        brick.size = CGSize(width: brickSize - gab, height: brickSize - gab)
        brick.color = .white
        brick.name = "wall"
        brick.zPosition = 1
        let xValue = x * brickSize + Int(Variables.startPoint.x)
        let yValue = y * brickSize + Int(Variables.startPoint.y)
        brick.position = CGPoint(x: xValue, y: -yValue)
        
        return brick
    }
}
