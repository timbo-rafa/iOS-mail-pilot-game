import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

class GameStartScene: SKScene {
    
    //Game Variables
    var oceanSprite: Ocean?
    var gameOverLabel: Label?
    var pressAnyKeyLabel: Label?
    
    override func didMove(to view: SKView) {
        // add ocean
        self.oceanSprite = Ocean()
        self.addChild(self.oceanSprite!)
        
        // add Game Over Label
        self.gameOverLabel = Label(labelString: "Mail Pilot", position: CGPoint(x: frame.width * 0.5, y: frame.height * 0.5), fontSize: 60.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: true)
        
        self.pressAnyKeyLabel = Label(labelString: "Press Any Key To Start", position: CGPoint(x: frame.width * 0.5, y: (frame.height * 0.5) - 50.0), fontSize: 25.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: true)
        self.addChild(pressAnyKeyLabel!)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
        ScoreManager.Lives = 5
        ScoreManager.Score = 0
        
        if let view = self.view {
            if let scene = GameScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFit // make sure the game fits
                view.presentScene(scene)
            }
        }
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
    }
}
