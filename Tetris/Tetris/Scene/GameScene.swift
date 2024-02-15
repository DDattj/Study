//
//  GameScene.swift
//  Tetris
//
//  Created by 이시안 on 1/31/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var leftButton : LeftButton?
    var rightButton : RightButton?
    var rotationButton : RotateButton?
    var downButton : DownButton?
    var stopButton : StopButton?
    var updateTime = 0.0
    override func didMove(to view: SKView) {
        Variables.scene = self
        _ = BackGround()
        _ = BrickGenerator()
        
        leftButton = LeftButton()
        rightButton = RightButton()
        rotationButton = RotateButton()
        downButton = DownButton()
        stopButton = StopButton()
        checkBrick()
    }
        
        func checkBrick(){
            let arrays = Variables.backarrys
            for item in arrays{
                print(item)
            }
        }
    override func update(_ currentTime: TimeInterval) {
        if updateTime == 0{
        updateTime = currentTime
        }
        if currentTime - updateTime > 1 {
            updateTime = currentTime
            if !Variables.isPaused{
                downButton?.brickDown()
            }
        }
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

            let touch = touches.first
            let location = touch?.location(in: self)
            let node = nodes(at: location!)
            for item in node{
                if item.name == "left"{
                    leftButton?.brickMoveLeft()
                }
                if item.name == "right"{
                    rightButton?.brickMoveRight()
                }
                if item.name == "rotation"{
                    rotationButton?.brickRotation()
                }
                if item.name == "down"{
                    while(downButton?.isBrickDownable())! {
                        downButton?.brickDown()
                    }
                }
                if item.name == "stop"{
                    stopButton?.brickStop()
                    }
                }
            }
        }
