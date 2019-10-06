
//  MainMenu.swift
//  Space Shooter
//
//  Created by MacBook Pro on 10/27/16.
//  Copyright © 2016 Northitco. All rights reserved.
//


import Foundation
import SpriteKit

class MainMenuScene : SKScene {
    
    var starfieldbk:SKEmitterNode!
    
    
    
    let clickSound = SKAction.playSoundFileNamed("beep22.mp3", waitForCompletion: false)
    
    let coins = UserDefaults.standard
    
    let startLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    let infoLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    let charLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    let highScore = SKLabelNode(fontNamed: "AmericanTypewriter")
    
    
    
    
    
    override func didMove(to view: SKView) {
        
        // self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        print(coins.integer(forKey: "coin"))
        
        
        starfieldbk = SKEmitterNode(fileNamed: "StarField")
        starfieldbk.position = CGPoint(x: self.frame.size.height / 2 , y: self.frame.size.height / 2)
        starfieldbk.advanceSimulationTime(8)
        starfieldbk.zPosition = -1
        self.addChild(starfieldbk)
        
        
        
        let gametittle2 = SKLabelNode(fontNamed: "Damascus")
        gametittle2.text = "Space Ship 2016"
        gametittle2.fontSize = 40
        gametittle2.fontColor = SKColor.gray
        gametittle2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.95)
        gametittle2.zPosition = 1
        self.addChild(gametittle2)
        
        //        let tittleLable1 = SKLabelNode(fontNamed: "AmericanTypewriter")
        //        tittleLable1.text = "Can You Tap The"
        //        tittleLable1.fontSize = 100
        //        tittleLable1.fontColor = SKColor.black
        //        tittleLable1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        //        tittleLable1.zPosition = 1
        //        self.addChild(tittleLable1)
        //
        //        let tittleLable11 = SKLabelNode(fontNamed: "AmericanTypewriter")
        //        tittleLable11.text = "Blue"
        //        tittleLable11.fontSize = 220
        //        tittleLable11.fontColor = SKColor.black
        //        tittleLable11.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        //        tittleLable11.zPosition = 1
        //        self.addChild(tittleLable11)
        
        startLable.text = "Play"
        startLable.fontSize = 110
        startLable.fontColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        startLable.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.65)
        startLable.zPosition = 1
        startLable.name = "startBtn"
        self.addChild(startLable)
        
        charLable.text = "Character & Bullet (Soon)"
        charLable.fontSize = 70
        charLable.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.55)
        charLable.zPosition = 1
        charLable.name = "info"
        charLable.fontColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.addChild(charLable)
        
        highScore.text = "High Score"
        highScore.fontSize = 100
        highScore.fontColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        highScore.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.45)
        highScore.zPosition = 1
        highScore.name = "info"
        self.addChild(highScore)
        
        infoLable.text = "About Us"
        infoLable.fontSize = 100
        infoLable.fontColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        infoLable.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.35)
        infoLable.zPosition = 1
        infoLable.name = "info"
        self.addChild(infoLable)
        
        let tittleLable21 = SKLabelNode(fontNamed: "Damascus")
        tittleLable21.text = "How many points can you get !"
        tittleLable21.fontSize = 50
        tittleLable21.fontColor = SKColor.white
        tittleLable21.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        tittleLable21.zPosition = 1
        self.addChild(tittleLable21)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches ){
            let location = touch.location(in: self)
            if self.atPoint(location) == self.startLable {
                //it will transits to the next scene
                let sceneToMoveTo  = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.3)
                self.view?.presentScene(sceneToMoveTo,transition: sceneTransition)
            }
            //            if self.atPoint(location) == self.charLable {
            //                //it will transits to the next scene
            //                let sceneToMoveTo  = character(size: self.size)
            //                sceneToMoveTo.scaleMode = self.scaleMode
            //                let sceneTransition = SKTransition.fade(withDuration: 0.3)
            //                self.view?.presentScene(sceneToMoveTo,transition: sceneTransition)
            //            }
            
            if self.atPoint(location) == self.infoLable {
                //it will transits to the next scene
                let sceneToMoveTo  = Aboutus(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.3)
                self.view?.presentScene(sceneToMoveTo,transition: sceneTransition)
            }
            if self.atPoint(location) == self.highScore {
                //it will transits to the next scene
                let sceneToMoveTo  = HighScoreScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.3)
                self.view?.presentScene(sceneToMoveTo,transition: sceneTransition)
            }
        }
        
    }
    
}
