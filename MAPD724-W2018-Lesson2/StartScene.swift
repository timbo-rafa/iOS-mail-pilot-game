
import SpriteKit

class StartScene: SKScene {

    override func didMove(to view: SKView) {
        print("Start Scene!")
        
        //let welcomeLabel: SKLabelNode = self.childNode(withName: "welcomeLabel") as! SKLabelNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let scene = GameScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit // make sure the game fits
            
            // Present the scene
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1.0))
        }
    }
}
