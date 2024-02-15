//
//  GameOver.swift
//  Tetris
//
//  Created by 이시안 on 2/14/24.
//

import Foundation
import SpriteKit

class GameOver: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location!)
        for item in node{
            if item.name == "Restart"{
                let scene = GameScene(size: view!.frame.size)
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                scene.anchorPoint = CGPoint(x: 0, y: 1)
                let transition = SKTransition.moveIn(with: .left, duration: 1)
                    // Present the scene
                    view!.presentScene(scene , transition: transition)
            }
        }
    }
}
