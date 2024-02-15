//
//  LeftButton.swift
//  Tetris
//
//  Created by 이시안 on 2/5/24.
//

import Foundation
import SpriteKit

class LeftButton {
    let btn = SKSpriteNode()
    init() {
        
        btn.texture = SKTexture(imageNamed: "left_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "left"
        btn.zPosition = 1
        btn.position = CGPoint(x: 50, y: -Int(Variables.scene.frame.height) + 50)
        Variables.scene.addChild(btn)
    }
    func anim(){
        var textures = Array<SKTexture>()
        for i in 1...15{
            let name = "left_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    func brickMoveLeft(){
        if isMovale(){
            Variables.dx -= 1
            var action = SKAction()
            for (i , item) in Variables.brickArrays.enumerated(){
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                
                Variables.backarrys[y][x + 1] -= 1
                Variables.backarrys[y][x] += 1
                action = SKAction.moveBy(x: -CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                Variables.brickNode[i].run(action)
            }
            anim()
        }
        
        func isMovale() ->Bool{
            
            for item in Variables.brickArrays{
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                if Variables.backarrys[y][x - 1] == 2{
                    return false
                }
            }
            return true
        }
    }
}
