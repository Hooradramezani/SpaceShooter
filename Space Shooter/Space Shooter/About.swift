//
//  About.swift
//  Space Shooter
//
//  Created by MacBook Pro on 10/27/16.
//  Copyright © 2016 Northitco. All rights reserved.
//


import Foundation
import SpriteKit

class Aboutus : SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("beep22.mp3", waitForCompletion: false)
    let backLable = SKLabelNode(fontNamed: "AmericanTypewriter")
    
    var starfield:SKEmitterNode!
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        starfieldbk = SKEmitterNode(fileNamed: "StarField")
        starfieldbk.position = CGPoint(x: self.frame.size.height / 2 , y: self.frame.size.height / 2)
        starfieldbk.advanceSimulationTime(8)
        starfieldbk.zPosition = -1
        self.addChild(starfieldbk)
        
        
        let gametittle2 = SKLabelNode(fontNamed: "Damascus")
        gametittle2.text = "Space Ship 2016"
        gametittle2.fontSize = 40
        gametittle2.fontColor = SKColor.gray
        gametittle2.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.95)
        gametittle2.zPosition = 1
        self.addChild(gametittle2)
        
        let tittleLable1 = SKLabelNode(fontNamed: "AmericanTypewriter")
        tittleLable1.text = "iOS Developer & UX | UI Designer"
        tittleLable1.fontSize = 70
        tittleLable1.fontColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tittleLable1.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.75)
        tittleLable1.zPosition = 1
        self.addChild(tittleLable1)
        
        let tittleLable11 = SKLabelNode(fontNamed: "AmericanTypewriter")
        tittleLable11.text = "Hoorad Ramezani"
        tittleLable11.fontSize = 90
        tittleLable11.fontColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tittleLable11.position = CGPoint(x: self.size.width/2, y: self.size.height*0.67)
        tittleLable11.zPosition = 1
        self.addChild(tittleLable11)
        
        let startLable2 = SKLabelNode(fontNamed: "AmericanTypewriter")
        startLable2.text = "Contact info "
        startLable2.fontSize = 70
        startLable2.fontColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        startLable2.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.55)
        startLable2.zPosition = 1
        self.addChild(startLable2)
        
        
        backLable.text = "Back"
        backLable.fontSize = 150
        backLable.fontColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        backLable.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.20)
        backLable.zPosition = 1
        backLable.name = "Back"
        self.addChild(backLable)
        
        
        let infoLable = SKLabelNode(fontNamed: "AmericanTypewriter")
        infoLable.text = "Hooradramezani@gmail.com"
        infoLable.fontSize = 70
        infoLable.fontColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        infoLable.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.47)
        infoLable.zPosition = 1
        self.addChild(infoLable)
        
        //        let tittleLable21 = SKLabelNode(fontNamed: "Damascus")
        //        tittleLable21.text = "Tap The Blue Button Not The Red !"
        //        tittleLable21.fontSize = 50
        //        tittleLable21.fontColor = SKColor.black
        //        tittleLable21.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        //        tittleLable21.zPosition = 1
        //        self.addChild(tittleLable21)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches ){
            let location = touch.location(in: self)
            if self.atPoint(location) == self.backLable {
                //it will transits to the next scene
                let sceneToMoveTo  = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.3)
                self.view?.presentScene(sceneToMoveTo,transition: sceneTransition)
            }
        }
        
        
    }
}



