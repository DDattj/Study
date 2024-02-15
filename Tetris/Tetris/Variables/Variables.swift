//
//  Variables.swift
//  Tetris
//
//  Created by 이시안 on 1/31/24.
//

import Foundation
import SpriteKit
struct Variables {
    static var backarrys = [[Int]]()
    static var scene = SKScene()
    static var brickValue = Brick().bricks()
    static var dx = 4
    static var dy = 2
    static let gab = 4
    static var startPoint = CGPoint()
    static var brickArrays = Array<CGPoint>()
    static var brickNode = Array<SKSpriteNode>()
    static var blockedArrays = Array<SKSpriteNode>()
    static var isPaused = false
}
