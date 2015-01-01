//
//  GameScene.swift
//  BreakoutGame
//
//  Created by Brandon Richey on 12/31/14.
//  Copyright (c) 2014 Brandon Richey. All rights reserved.
//

import SpriteKit

let BallCategoryName = "ball"
let PaddleCategoryName = "paddle"
let BlockCategoryName = "block"
let BlockNodeCategoryName = "blockNode"

class GameScene: SKScene {
    var isFingerOnPaddle = false
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        let ball = childNodeWithName(BallCategoryName) as SKSpriteNode
        ball.physicsBody!.applyImpulse(CGVectorMake(10, -10))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var touch = touches.anyObject() as UITouch!
        var touchLocation = touch.locationInNode(self)
        
        if let body = physicsWorld.bodyAtPoint(touchLocation) {
            if body.node!.name == PaddleCategoryName {
                println("Began touch on paddle")
                isFingerOnPaddle = true
            }
        }
    }
}
