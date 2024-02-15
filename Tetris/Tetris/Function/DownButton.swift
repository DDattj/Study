//
//  DownButton.swift
//  Tetris
//
//  Created by 이시안 on 2/6/24.
//

import Foundation
import SpriteKit

class DownButton {
    let btn = SKSpriteNode()
    
    init() {
        setupButton()
    }
    
    private func setupButton() {
        btn.texture = SKTexture(imageNamed: "down_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "down"
        btn.zPosition = 1
        
        let point1 = Int(Variables.scene.frame.width) / 2
        let point2 = -50
        let xValue = (point1 - point2) / 2
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height) + 50)
        
        Variables.scene.addChild(btn)
    }
    
    func anim() {
        var textures = [SKTexture]()
        var action = SKAction()
        for i in 1...15 {
            let name = "down_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    func brickDown() {
        if isBrickDownable() {
            possibleDown()
            anim()
        } else {
            impossibleDown()
        }
    }
    
    func isBrickDownable() -> Bool {
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            if Variables.backarrys[y + 1][x] == 2 {
                return false
            }
        }
        return true
    }
    
    private func possibleDown() {
        Variables.dy += 1
        var action = SKAction()
        for (i, item) in Variables.brickArrays.enumerated() {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            Variables.backarrys[y - 1][x] -= 1
            Variables.backarrys[y][x] += 1
            action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.1)
            Variables.brickNode[i].run(action)
        }
    }
    
    private func impossibleDown() {
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backarrys[y][x] = 2
            
            let blocked = SKSpriteNode()
            blocked.color = .gray
            blocked.size = CGSize(width: Variables.brickValue.brickSize - Variables.gab, height: Variables.brickValue.brickSize - Variables.gab)
            blocked.name = "blocked"
            
            let xValue = x * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            blocked.position = CGPoint(x: xValue, y: -yValue)
            
            Variables.scene.addChild(blocked)
            Variables.blockedArrays.append(blocked)
        }
        
        for item in Variables.brickNode {
            item.removeFromParent()
        }
        
        checkDelete()
    }
    
    private func checkDelete() {
        var set = Set<Int>()
        for item in Variables.brickArrays {
            let y = Int(item.y) + Variables.dy
            set.insert(y)
        }
        for y in set.sorted() {
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            if !Variables.backarrys[y].contains(0) {
                Variables.backarrys.remove(at: y)
                Variables.backarrys.insert([2, 0, 0, 0, 0, 0, 0, 0, 0, 2], at: 1)
                
                for item in Variables.blockedArrays {
                    if Int(item.position.y) == -yValue {
                        if let removeItem = Variables.blockedArrays.firstIndex(of: item) {
                            Variables.blockedArrays.remove(at: removeItem)
                            var action = SKAction()
                            action = SKAction.fadeOut(withDuration: 0.1)
                            item.run(action) {
                                item.removeFromParent()
                            }
                        }
                    }
                    if Int(item.position.y) > -yValue {
                        var action = SKAction()
                        action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.5)
                        item.run(action)
                    }
                }
            }
        }
        if isGameOver(deadLine: Variables.dy){
            _ = BrickGenerator()
        }
    }
    func isGameOver(deadLine : Int) ->Bool{
        if deadLine > 2 {
            return true
        } else {
            if let scene = GameOver(fileNamed: "GameOver"){
                let transition = SKTransition.moveIn(with: .right, duration: 1)
                Variables.scene.view?.presentScene(scene , transition: transition)
            }
            return false
        }
    }
}
