
import SpriteKit
import GameplayKit

class Island: GameObject {
    // constructor
    init() {
        // initialize the object with an image
        super.init(imageString: "island", initialScale:1.0)
        Start()
    }
    
    override func Start() {
        //how fast the island is gonna go down
        self.zPosition = 1
        self.Reset()
        self.dy = 5.0
    }
    
    override func Reset() {
        //change 700 to screenHeight
        self.position.y = 700 + self.height!;
        let randomX:Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfwidth!)
        self.position.x = CGFloat(randomX)
    }
    
    override func CheckBounds() {
        if (self.position.y < ( 0 - self.height!)) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.dy!
        self.CheckBounds()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
