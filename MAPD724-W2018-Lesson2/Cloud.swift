

import SpriteKit
import GameplayKit

class Cloud: GameObject {
    // constructor
    init() {
        // initialize the object with an image
        super.init(imageString: "cloud", initialScale:1.0)
        Start()
    }
    
    override func Start() {
        //how fast the island is gonna go down
        self.setScale(0.6)
        self.width = (texture?.size().width)! * self.scale!
        self.height = (texture?.size().height)! * self.scale!
        self.halfwidth = self.width! * 0.5
        self.halfheight = self.height! * 0.5
        
        self.zPosition = 3
        self.Reset()
        self.dy = 5.0
    }
    
    
    // Tom said be careful (?)
    //override func setScale(_ scale: CGFloat)
    
    
    override func Reset() {
        //change 700 to screenHeight
        self.position.y = 700 + self.height!;
        let randomX:Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfwidth!)
        self.position.x = CGFloat(randomX)
        self.dy = CGFloat(((randomSource?.nextUniform())! * 5.0) + 5.0)
        self.dx = CGFloat(((randomSource?.nextUniform())! * -4.0) + 2.0)
    }
    
    override func CheckBounds() {
        if (self.position.y < ( 0 - self.height!)) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.position.x -= self.dx!
        self.CheckBounds()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
