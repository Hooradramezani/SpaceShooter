
//
//  GameScene.swift
//  Space Shooter
//
//  Created by MacBook Pro on 10/17/16.
//  Copyright © 2016 Northitco. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    var starfield:SKEmitterNode!
    var player:SKSpriteNode!
    var scoreLable:SKLabelNode!
    var scorePlus:SKLabelNode!
    let healthLine = SKShapeNode()
    var healthLineLogo = SKSpriteNode()
    
    
    var score:Int = 0
    var Time = 0
    var healthCount = 300
    
    var bulltRespons:Double!
    var giftRespons:Double!
    var stoneandalienRespons:TimeInterval!
    var bulletspeed:Double!
    var giftspeed:Double!
    var stoneandalienspeed:Double!
    var healthboxTimerspeed:Double!
    
    let coins = UserDefaults.standard
    let highScore = UserDefaults.standard
    
    var gameTimer:Timer!
    var bulltTimer:Timer!
    var updateTimer:Timer!
    var stoneTimer:Timer!
    var giftTimer:Timer!
    var healTimer:Timer!
    var showhealTimer:Timer!
    var levelTimer:Timer!
    
    var lastPosition:CGFloat!
    
    var possibleAliens = ["uFo3","Stone_4","uFo5","uFo6","Stone_2","uFo2","Stone_3","uFo4","Stone_5","uFo1","Stone_6","Stone_7","Stone_8","uFo7"]
    var possibleGift = ["DiamondBlue","DiamondRed","coin2","Coin","special"]
    
    struct PhysicsCategory {
        
        static let player : UInt32 = 0x3
        static let bullet : UInt32 = 0x2
        static let gift : UInt32 = 0x0
        static let enemy : UInt32 = 0x1
    }
    
    
    override func didMove(to view: SKView) {
        
        bulltRespons = 0.63
        giftRespons = 5.1
        stoneandalienRespons = 1.9
        bulletspeed = 2.8
        giftspeed = 5.1
        stoneandalienspeed = 5.0
        healthboxTimerspeed = 5.5
        
        // self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        // Background
        starfield = SKEmitterNode(fileNamed: "StarField")
        starfield.position = CGPoint(x: self.frame.size.height / 2 , y: self.frame.size.height / 2)
        starfield.advanceSimulationTime(8)
        self.addChild(starfield)
        starfield.zPosition = -1
        
        // Player Charecter
        player = SKSpriteNode(imageNamed: "Charecter")
        player.position = CGPoint(x: self.frame.size.width / 2 , y: 250)
        player.name = "player"
        player.physicsBody?.isDynamic = true
        
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.enemy | PhysicsCategory.gift
        player.physicsBody?.collisionBitMask =  0 | 1
        player.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(player)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy:0)
        self.physicsWorld.contactDelegate = self
        
        
        // Score Lable
        
        scoreLable = SKLabelNode(text: "Score : \(score)")
        scoreLable.fontName = "Damascus"
        scoreLable.position = CGPoint(x: self.frame.size.width - 370, y: self.size.height * 0.96 )
        scoreLable.fontColor = UIColor.white
        scoreLable.fontSize = 56
        self.addChild(scoreLable)
        
        // Draw health
        healthLine.path = UIBezierPath(roundedRect: CGRect(x: -128, y: -10, width: healthCount, height: 25), cornerRadius: 10).cgPath
        healthLine.position = CGPoint(x: 340 , y: self.size.height * 0.96)
        healthLine.fillColor = UIColor.green
        healthLine.strokeColor = UIColor.white
        healthLine.lineWidth = 4
        addChild(healthLine)
        
        // Health Line Logo
        healthLineLogo = SKSpriteNode(imageNamed: "first-aid-kit")
        healthLineLogo.position = CGPoint(x: 565 , y: self.size.height * 0.965)
        healthLineLogo.size = CGSize(width: 40 , height: 37)
        //  healthLineLogo.zPosition =
        addChild(healthLineLogo)
        
        
        // Timer
        gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
        
        giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
        
        bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
        
        showhealTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(health), userInfo: nil, repeats: true)
        
        healTimer = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(healthNode), userInfo: nil, repeats: true)
        
        
        levelTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(gameTimers), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func gameTimers() {
        print(Time)
        Time += 1
        if Time == 9 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.53
            giftRespons = 4.1
            stoneandalienRespons = 1.8
            bulletspeed = 2.2
            giftspeed = 4.1
            stoneandalienspeed = 4.0
            healthboxTimerspeed = 5.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
            
        }else if Time == 17 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.40
            giftRespons = 3.1
            stoneandalienRespons = 1.3
            bulletspeed = 2.0
            giftspeed = 3.1
            stoneandalienspeed = 3.0
            healthboxTimerspeed = 4.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
            
            
        }else if Time == 29 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.30
            giftRespons = 2.1
            stoneandalienRespons = 0.9
            bulletspeed = 1.8
            giftspeed = 2.1
            stoneandalienspeed = 2.3
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
            
        }else if Time == 39 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.30
            giftRespons = 1.6
            stoneandalienRespons = 0.6
            bulletspeed = 1.4
            giftspeed = 1.6
            stoneandalienspeed = 2.2
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
            
        }else if Time == 64 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.20
            giftRespons = 1.6
            stoneandalienRespons = 0.45
            bulletspeed = 1.2
            giftspeed = 1.6
            stoneandalienspeed = 2.0
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
            
        }else if Time == 90 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.15
            giftRespons = 1.3
            stoneandalienRespons = 0.35
            bulletspeed = 0.9
            giftspeed = 1.3
            stoneandalienspeed = 1.9
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
            
        }else if Time == 150 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.13
            giftRespons = 1.3
            stoneandalienRespons = 0.30
            bulletspeed = 0.9
            giftspeed = 1.3
            stoneandalienspeed = 1.7
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
        }else if Time == 190 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.11
            giftRespons = 1.3
            stoneandalienRespons = 0.20
            bulletspeed = 0.8
            giftspeed = 1.3
            stoneandalienspeed = 1.6
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
        }
        if Time == 260 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.10
            giftRespons = 1.3
            stoneandalienRespons = 0.15
            bulletspeed = 0.8
            giftspeed = 1.3
            stoneandalienspeed = 1.5
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
            
        }
        if Time == 340 {
            
            gameTimer.invalidate()
            giftTimer.invalidate()
            bulltTimer.invalidate()
            
            bulltRespons = 0.10
            giftRespons = 1.3
            stoneandalienRespons = 0.10
            bulletspeed = 0.7
            giftspeed = 1.3
            stoneandalienspeed = 1.3
            healthboxTimerspeed = 3.5
            
            gameTimer = Timer.scheduledTimer(timeInterval: TimeInterval(stoneandalienRespons), target: self, selector: #selector(addAlien), userInfo: nil, repeats: true)
            
            giftTimer = Timer.scheduledTimer(timeInterval: giftRespons, target: self, selector: #selector(addgift), userInfo: nil, repeats: true)
            
            bulltTimer = Timer.scheduledTimer(timeInterval: bulltRespons, target: self, selector: #selector(fireTorbido), userInfo: nil, repeats: true)
        }
    }
    
    // Check Health
    
    @objc func health()  {
        
        healthCount -= 1
        healthLine.path = UIBezierPath(roundedRect: CGRect(x: -128, y: -10, width: healthCount, height: 30), cornerRadius: 10).cgPath
        if healthCount == 0 {
            healthLine.removeFromParent()
            runGameOver()
        }
    }
    
    // Add Health Box
    @objc func healthNode()  {
        
        let healthBox = SKSpriteNode(imageNamed: "first-aid-kit")
        let position = creatPosition()
        healthBox.name = "Health"
        healthBox.position = CGPoint(x: position, y: self.frame.size.height + healthBox.size.height)
        healthBox.physicsBody = SKPhysicsBody(rectangleOf: healthBox.size)
        healthBox.physicsBody?.isDynamic = true
        healthBox.size = CGSize(width: 90, height: 90)
        
        healthBox.physicsBody?.categoryBitMask = PhysicsCategory.gift
        healthBox.physicsBody?.contactTestBitMask = PhysicsCategory.player
        healthBox.physicsBody?.collisionBitMask = 1
        healthBox.zPosition = 2
        
        self.addChild(healthBox)
        
        let animationDuriation:TimeInterval = TimeInterval(healthboxTimerspeed)
        var actionArray  = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x:position, y:-healthBox.size.height), duration: animationDuriation))
        actionArray.append(SKAction.removeFromParent())
        healthBox.run(SKAction.sequence(actionArray))
        
    }
    
    // Creat Alien
    @objc func addAlien() {
        
        possibleAliens = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleAliens) as! [String]
        let alien = SKSpriteNode(imageNamed: possibleAliens[0])
        alien.name = possibleAliens[0]
        let position = creatPosition()
        
        
        alien.position = CGPoint(x: position, y: self.frame.size.height + alien.size.height )
        alien.physicsBody?.isDynamic = true
        
        alien.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        alien.physicsBody?.contactTestBitMask = PhysicsCategory.bullet | PhysicsCategory.player
        alien.physicsBody?.collisionBitMask = 0
        // alien.size = CGSize(width: 140, height: 140)
        alien.physicsBody = SKPhysicsBody(rectangleOf: alien.size )
        
        self.addChild(alien)
        
        let animationDuriation:TimeInterval = TimeInterval(stoneandalienspeed)
        var actionArray  = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x:position, y:-alien.size.height), duration: animationDuriation))
        actionArray.append(SKAction.removeFromParent())
        alien.run(SKAction.sequence(actionArray))
        
        let spin = SKAction.rotate(byAngle: CGFloat.pi, duration: 2)
        let spinForever = SKAction.repeatForever(spin)
        alien.run(spinForever)
    }
    
    
    
    @objc func addgift() {
        
        possibleGift = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleGift) as! [String]
        let gift = SKSpriteNode(imageNamed: possibleGift[0])
        
        let position = creatPosition()
        
        gift.name = possibleGift[0]
        gift.position = CGPoint(x: position, y: self.frame.size.height + gift.size.height)
        gift.physicsBody = SKPhysicsBody(rectangleOf: gift.size)
        gift.physicsBody?.isDynamic = true
        gift.size = CGSize(width: 50, height: 50)
        
        gift.physicsBody?.categoryBitMask = PhysicsCategory.gift
        gift.physicsBody?.contactTestBitMask = PhysicsCategory.player
        gift.physicsBody?.collisionBitMask = 1
        gift.zPosition = 2
        
        self.addChild(gift)
        
        let animationDuriation:TimeInterval = giftspeed
        var actionArray  = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x:position, y: -gift.size.height), duration: animationDuriation))
        actionArray.append(SKAction.removeFromParent())
        gift.run(SKAction.sequence(actionArray))
    }
    
    
    
    
    
    // Creat Normal Bullt
    
    @objc func fireTorbido(){
        
        //self.run(SKAction.playSoundFileNamed("", waitForCompletion: false))
        let torpedoNode = SKSpriteNode(imageNamed: "bullet_red")
        torpedoNode.name = "bullet"
        torpedoNode.position = player.position
        torpedoNode.position.y += 5
        torpedoNode.physicsBody = SKPhysicsBody(circleOfRadius: torpedoNode.size.width / 2)
        torpedoNode.physicsBody?.isDynamic = false
        torpedoNode.physicsBody?.categoryBitMask = PhysicsCategory.bullet
        torpedoNode.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        torpedoNode.physicsBody?.collisionBitMask = PhysicsCategory.enemy
        //        torpedoNode.physicsBody?.affectedByGravity = true
        torpedoNode.physicsBody?.usesPreciseCollisionDetection = false
        self.addChild(torpedoNode)
        
        
        let animationDuriation:TimeInterval = bulletspeed
        var actionArray  = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x:player.position.x  , y: self.frame.size.height - 10), duration: animationDuriation))
        actionArray.append(SKAction.removeFromParent())
        torpedoNode.run(SKAction.sequence(actionArray))
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody:SKPhysicsBody
        var secondBody:SKPhysicsBody
        
        if contact.bodyA.categoryBitMask == 4294967295 && contact.bodyB.categoryBitMask == 2 ||  contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 4294967295
        {
            
            //            print("enemy Vs bullt")
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            torpedoDidCollideWithAlien(torpedoNode : secondBody.node as! SKSpriteNode, alienNode: firstBody.node as! SKSpriteNode)
            //            print(firstBody.categoryBitMask)
            //            print(secondBody.categoryBitMask)
            //
            //            print("---------------")
        }
        
        
        if (contact.bodyA.categoryBitMask == 4294967295) && (contact.bodyB.categoryBitMask == 3)
        {
            
            //           print("Alien Vs player")
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            //            print(firstBody.categoryBitMask)
            //            print(secondBody.categoryBitMask)
            playerDidCollideWithAlien(playerNode: secondBody.node as! SKSpriteNode, StoneNode: firstBody.node as! SKSpriteNode)
            
            //            print("---------Finish--------")
        }
        
        if (contact.bodyA.categoryBitMask == 0) && (contact.bodyB.categoryBitMask == 3)
        {
            
            //            print("Gift  Vs player")
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            //            print(firstBody.categoryBitMask)
            //            print(secondBody.categoryBitMask)
            //            print("--------Gift---------")
            PlayerDidCollideWithgift(Player: secondBody.node as! SKSpriteNode, Gift: firstBody.node as! SKSpriteNode)
        }
    }
    
    
    // Bullet Vs Alien
    
    func torpedoDidCollideWithAlien(torpedoNode:SKSpriteNode , alienNode : SKSpriteNode) {
        
        if (alienNode.name == "Stone_0") || (alienNode.name == "Stone_1") || (alienNode.name == "Stone_2") || (alienNode.name == "Stone_3") || (alienNode.name == "Stone_4") || (alienNode.name == "Stone_5") || (alienNode.name == "Stone_6") || (alienNode.name == "Stone_7") || (alienNode.name == "Stone_8") || (alienNode.name == "Stone_9") || (alienNode.name == "Stone_10")
        {
            //            print(alienNode.name)
            bulltDidCollideWithstone(bulltNode: torpedoNode, StoneNode: alienNode)
        }
        else if (alienNode.name == "uFo1") || (alienNode.name == "uFo2") || (alienNode.name == "uFo3") || (alienNode.name == "uFo4") || (alienNode.name == "uFo5") || (alienNode.name == "uFo6") || (alienNode.name == "uFo7")
        {
            let explosion = SKEmitterNode(fileNamed: "MyParticleExplotion")
            explosion?.position = alienNode.position
            self.addChild(explosion!)
            //  self.run(SKAction.playSoundFileNamed("", waitForCompletion: false))
            torpedoNode.removeFromParent()
            alienNode.removeFromParent()
            self.run(SKAction.wait(forDuration: 0.3)) {
                explosion?.removeFromParent()
            }
            score += 1
            scoreLable.text = "Score : \(score)"
            animateScore(scoe: 1)
        }
    }
    
    
    // Bullet VS Stone
    
    func bulltDidCollideWithstone(bulltNode:SKSpriteNode , StoneNode : SKSpriteNode) {
        
        func bulltStoneRemove () {
            let explosion = SKEmitterNode(fileNamed: "MyParticleExplotion")
            explosion?.position = StoneNode.position
            self.addChild(explosion!)
            // self.run(SKAction.playSoundFileNamed("", waitForCompletion: false))
            bulltNode.removeFromParent()
            StoneNode.removeFromParent()
            self.run(SKAction.wait(forDuration: 0.3)) {
                explosion?.removeFromParent()
            }
            
            animateScore(scoe: 5)
            score += 5
            scoreLable.text = "Score : \(score)"
        }
        func bulltRemove () {
            let explosion = SKEmitterNode(fileNamed: "MyParticleExplotion")
            explosion?.position = StoneNode.position
            self.addChild(explosion!)
            // self.run(SKAction.playSoundFileNamed("", waitForCompletion: false))
            bulltNode.removeFromParent()
            self.run(SKAction.wait(forDuration: 0.3)) {
                explosion?.removeFromParent()
            }
            
        }
        
        if StoneNode.name == "Stone_10" {
            StoneNode.name = "Stone_9"
            bulltRemove()
        }
        else if StoneNode.name == "Stone_9" {
            StoneNode.name = "Stone_8"
            bulltRemove()
        }
        else if StoneNode.name == "Stone_8" {
            StoneNode.name = "Stone_7"
            bulltRemove()
        }else if StoneNode.name == "Stone_7" {
            StoneNode.name = "Stone_6"
            bulltRemove()
        }else if StoneNode.name == "Stone_6" {
            StoneNode.name = "Stone_5"
            bulltRemove()
        }else if StoneNode.name == "Stone_5" {
            StoneNode.name = "Stone_4"
            bulltRemove()
        }else if StoneNode.name == "Stone_4"{
            StoneNode.name = "Stone_3"
            bulltRemove()
        }else if StoneNode.name == "Stone_3"{
            StoneNode.name = "Stone_2"
            bulltRemove()
        }else if StoneNode.name == "Stone_2"{
            StoneNode.name = "Stone_1"
            bulltRemove()
        }else if StoneNode.name == "Stone_1"{
            StoneNode.name = "Stone_0"
            bulltRemove()
        }else if StoneNode.name == "Stone_0"{
            bulltStoneRemove()
        }
    }
    
    
    func PlayerDidCollideWithgift(Player:SKSpriteNode , Gift : SKSpriteNode) {
        
        //        print(Gift.name)
        
        if Gift.name == "Health" {
            
            if healthCount > 199 {
                healthCount = 300
            }else {
                healthCount += 120
            }
        }
        if Gift.name == "DiamondBlue" {
            score += 3
            scoreLable.text = "Score : \(score)"
            animateScore(scoe: 3)
            
        }
        if Gift.name == "DiamondRed" {
            score += 2
            scoreLable.text = "Score : \(score)"
            animateScore(scoe: 2)
            
        }
        if Gift.name == "coin2" {
            
            var coinPlus = coins.integer(forKey: "coin")
            coinPlus += 1
            coins.set(coinPlus, forKey: "coin")
            
        }
        if Gift.name == "Coin" {
            
            var coinPlus = coins.integer(forKey: "coin")
            coinPlus += 1
            coins.set(coinPlus, forKey: "coin")
            
        }
        if Gift.name == "special" {
            score += 10
            scoreLable.text = "Score : \(score)"
            animateScore(scoe: 8)
            
        }
        
        //  self.run(SKAction.playSoundFileNamed("", waitForCompletion: false))
        Gift.removeFromParent()
        
    }
    
    
    
    // Player With Alien Game Over
    
    func playerDidCollideWithAlien(playerNode:SKSpriteNode , StoneNode : SKSpriteNode) {
        
        let explosion = SKEmitterNode(fileNamed: "MyParticleExplotion2")
        explosion?.position = StoneNode.position
        self.addChild(explosion!)
        // self.run(SKAction.playSoundFileNamed("", waitForCompletion: false))
        playerNode.removeFromParent()
        self.run(SKAction.wait(forDuration: 0.3)) {
            explosion?.removeFromParent()
        }
        runGameOver()
    }
    
    // Creat Position
    
    func creatPosition() -> CGFloat {
        
        let randomAlienPosition = GKRandomDistribution(lowestValue: 300, highestValue: Int(self.frame.size.width - 300))
        let position =  CGFloat(randomAlienPosition.nextInt())
        return position
        
    }
    
    func animateScore(scoe: Int) {
        
        // Add a label for the score that slowly floats up.
        let scoreLabels = SKLabelNode(fontNamed: "GillSans-BoldItalic")
        scoreLabels.fontSize = 56
        scoreLabels.fontColor = UIColor.green
        scoreLabels.text = " +\(scoe)"
        scoreLabels.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2 )
        scoreLabels.zPosition = 300
        self.addChild(scoreLabels)
        
        let moveAction = SKAction.move(by: CGVector(dx: 5, dy: 60), duration: 0.7)
        moveAction.timingMode = .easeIn
        scoreLabels.run(SKAction.sequence([moveAction, SKAction.removeFromParent()]))
    }
    
    func animateLevel(level: Int) {
        
        // Add a label for the score that slowly floats up.
        let levelLabels = SKLabelNode(fontNamed: "GillSans-BoldItalic")
        levelLabels.fontSize = 86
        levelLabels.fontColor = UIColor.blue
        levelLabels.text = " Upgrate Level to +\(level)"
        levelLabels.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2 )
        levelLabels.zPosition = 300
        self.addChild(levelLabels)
        
        let moveAction = SKAction.move(by: CGVector(dx: 0, dy: 0), duration: 0.8)
        moveAction.timingMode = .easeIn
        levelLabels.run(SKAction.sequence([moveAction, SKAction.removeFromParent()]))
    }
    
    func runGameOver()  {
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSave")
        if score > highScoreNumber {
            highScoreNumber = score
            defaults.set(highScoreNumber, forKey: "highScoreSave")
        }
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.8)
        self.view?.presentScene(sceneToMoveTo,transition: sceneTransition)
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let location  = touch.location(in: self)
            player.position.x = location.x
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches {
            let location  = touch.location(in: self)
            player.position.x = location.x
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
