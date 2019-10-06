//
//  GameOverScene.swift
//  Space Shooter
//
//  Created by MacBook Pro on 10/27/16.
//  Copyright © 2016 Northitco. All rights reserved.
//
import Foundation
import SpriteKit

class character : SKScene {
    
    var starfieldbk:SKEmitterNode!
    
    var char1 : SKNode!
    var char2 : SKSpriteNode!
    var char3 : SKSpriteNode!
    var char4 : SKSpriteNode!
    var char5 : SKSpriteNode!
    var char6 : SKSpriteNode!
    
    
    
    let clickSound = SKAction.playSoundFileNamed("beep22.mp3", waitForCompletion: false)
    let playGameOversoundEffect2 = SKAction.playSoundFileNamed("gameover.wav", waitForCompletion: false)
    let startLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    let infoLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    
    override func didMove(to view: SKView) {
        
        // self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        //  self.run(playGameOversoundEffect2)
        //        char1 = SKNode()
        //        char1.position = CGPoint(x: self.frame.size.height / 2 , y: self.frame.size.height / 2)
        //        char1.zPosition = 1
        //        self.addChild(char1)
        
        
        
        
        let tittleLable1 = SKLabelNode(fontNamed: "AmericanTypewriter")
        tittleLable1.text = "Space Ship"
        tittleLable1.fontSize = 100
        tittleLable1.fontColor = SKColor.black
        tittleLable1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        tittleLable1.zPosition = 1
        self.addChild(tittleLable1)
        
        let tittleLable11 = SKLabelNode(fontNamed: "AmericanTypewriter")
        tittleLable11.text = "Game Over"
        tittleLable11.fontSize = 220
        tittleLable11.fontColor = SKColor.black
        tittleLable11.position = CGPoint(x: self.size.width/2, y: self.size.height*0.62)
        tittleLable11.zPosition = 1
        self.addChild(tittleLable11)
        
        startLable.text = "Restart"
        startLable.fontSize = 150
        startLable.fontColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        startLable.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.45)
        startLable.zPosition = 1
        startLable.name = "startBtn"
        self.addChild(startLable)
        
        
        infoLable.text = "Exit"
        infoLable.fontSize = 120
        infoLable.fontColor = SKColor.black
        infoLable.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.34)
        infoLable.zPosition = 1
        infoLable.name = "info"
        self.addChild(infoLable)
        
        let tittleLable21 = SKLabelNode(fontNamed: "Damascus")
        tittleLable21.text = "Tap The Blue Button Not The Red !"
        tittleLable21.fontSize = 50
        tittleLable21.fontColor = SKColor.black
        tittleLable21.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        tittleLable21.zPosition = 1
        self.addChild(tittleLable21)
        
        
        //        let defaults = NSUserDefaults()
        //        var highScoreNumber = defaults.integerForKey("highScoreSave")
        
        //        if scoreNumber > highScoreNumber {
        //            highScoreNumber = scoreNumber
        //            defaults.setInteger(highScoreNumber, forKey: "highScoreSave")
        //        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches ){
            let location = touch.location(in: self)
            if self.atPoint(location) == self.startLable {
                //it will transits to the next scene
                let sceneMoveTo = GameScene(size : self.size)
                sceneMoveTo.scaleMode = self.scaleMode
                let sceneTransiton = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneMoveTo,transition: sceneTransiton)
            }
            
            if self.atPoint(location) == self.infoLable {
                //it will transits to the next scene
                let sceneMoveTo = MainMenuScene(size : self.size)
                sceneMoveTo.scaleMode = self.scaleMode
                let sceneTransiton = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneMoveTo,transition: sceneTransiton)
            }
        }
        
    }
}
