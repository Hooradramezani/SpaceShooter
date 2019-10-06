//
//  GameOverScene.swift
//  Space Shooter
//
//  Created by MacBook Pro on 10/27/16.
//  Copyright © 2016 Northitco. All rights reserved.
//
import Foundation
import SpriteKit

var starfieldbk1:SKEmitterNode!

class HighScoreScene : SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("beep22.mp3", waitForCompletion: false)
    let playGameOversoundEffect2 = SKAction.playSoundFileNamed("gameover.wav", waitForCompletion: false)
    let startLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    let infoLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    
    override func didMove(to view: SKView) {
        
        // self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //  self.run(playGameOversoundEffect2)
        
        starfieldbk1 = SKEmitterNode(fileNamed: "StarField")
        starfieldbk1.position = CGPoint(x: self.frame.size.height / 2 , y: self.frame.size.height / 2)
        starfieldbk1.advanceSimulationTime(8)
        starfieldbk1.zPosition = -1
        self.addChild(starfieldbk1)
        
        
        let gametittle2 = SKLabelNode(fontNamed: "Damascus")
        gametittle2.text = "Space Ship 2016"
        gametittle2.fontSize = 40
        gametittle2.fontColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        gametittle2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.95)
        gametittle2.zPosition = 1
        self.addChild(gametittle2)
        
        let defaults = UserDefaults()
        let highScoreNumber = defaults.integer(forKey: "highScoreSave")
        
        let tittleLable1 = SKLabelNode(fontNamed: "AmericanTypewriter")
        tittleLable1.text = "Your High Score "
        tittleLable1.fontSize = 100
        tittleLable1.fontColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        tittleLable1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.60)
        tittleLable1.zPosition = 1
        self.addChild(tittleLable1)
        
        let tittleLable11 = SKLabelNode(fontNamed: "AmericanTypewriter")
        tittleLable11.text = "\(highScoreNumber)"
        tittleLable11.fontSize = 180
        tittleLable11.fontColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        tittleLable11.position = CGPoint(x: self.size.width/2, y: self.size.height*0.48)
        tittleLable11.zPosition = 1
        self.addChild(tittleLable11)
        
        //        startLable.text = "Restart"
        //        startLable.fontSize = 150
        //        startLable.fontColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        //        startLable.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.45)
        //        startLable.zPosition = 1
        //        startLable.name = "startBtn"
        //        self.addChild(startLable)
        
        
        infoLable.text = "Exit"
        infoLable.fontSize = 120
        infoLable.fontColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        infoLable.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.05)
        infoLable.zPosition = 1
        infoLable.name = "info"
        self.addChild(infoLable)
        
        //        let tittleLable21 = SKLabelNode(fontNamed: "Damascus")
        //        tittleLable21.text = "Tap The Exit To Back Try Again !"
        //        tittleLable21.fontSize = 50
        //        tittleLable21.fontColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //        tittleLable21.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        //        tittleLable21.zPosition = 1
        //        self.addChild(tittleLable21)
        
        
        //        let defaults = NSUserDefaults()
        //        var highScoreNumber = defaults.integerForKey("highScoreSave")
        
        //        if scoreNumber > highScoreNumber {
        //            highScoreNumber = scoreNumber
        //            defaults.setInteger(highScoreNumber, forKey: "highScoreSave")
        //        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches){
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
