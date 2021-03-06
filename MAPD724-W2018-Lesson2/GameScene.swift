//
//  GameScene.swift
//  MAPD724-W2018-Lesson2
//
//  Created by Student on 2018-01-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //Game Variables
    var oceanSprite: Ocean?
    var planeSprite: Plane?
    var islandSprite: Island?
    //var cloudSprite: Cloud?
    var cloudSprites: [Cloud] = []
    var livesLabel: Label?
    var scoreLabel: Label?
    
    override func didMove(to view: SKView) {
        print("GameScene.didMove")
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add ocean
        self.oceanSprite = Ocean()
        self.addChild(self.oceanSprite!)
        
        //add island
        self.islandSprite = Island()
        self.addChild(self.islandSprite!)
        
        // add plane
        self.planeSprite = Plane()
        self.planeSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50.0)
        self.addChild(self.planeSprite!)
       
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // add clouds
        for index in 0...2 {
            let cloud: Cloud = Cloud()
            cloudSprites.append(cloud)
            self.addChild(cloudSprites[index])
        }
        
        //add a label
        
        livesLabel = Label(labelString: "Lives: 5", position: CGPoint(x: 20.0, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(livesLabel!)
        
        scoreLabel = Label(labelString: "Score: 99999", position: CGPoint(x: frame.width * 0.45, y:frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(scoreLabel!)
        
        //preload sounds
        do {
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds {
                let path:String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        } catch {
            
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // where the magic happens
    // Called before each frame is rendered
    override func update(_ currentTime: TimeInterval) {
        self.oceanSprite?.Update()
        self.planeSprite?.Update()
        self.islandSprite?.Update()
        
        CollisionManager.CheckCollision(scene: self, object1: planeSprite!, object2: islandSprite!)
        
        for cloud in cloudSprites {
            cloud.Update()
            
            CollisionManager.CheckCollision(scene: self, object1: planeSprite!, object2: cloud)
        }
        
        if (ScoreManager.Lives > 0) {
            //Update Labels
            livesLabel?.text = "Lives: \(ScoreManager.Lives)"
            scoreLabel?.text = "Score: \(ScoreManager.Score)"
        } else {
            if let view = self.view {
                if let scene = GameScene(fileNamed: "GameOverScene") {
                    scene.scaleMode = .aspectFit // make sure the game fits
                    view.presentScene(scene)
                }
            }
        }
    }
}
