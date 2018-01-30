
import SpriteKit

class Ocean: GameObject {
    // constructor
    init() {
        // initialize the object with an image
        super.init(imageString: "ocean", initialScale:1.0)
        Start()
    }
    
    override func Start() {
        self.anchorPoint = CGPoint.zero
        //how fast the ocean is gonna go down
        self.dy = 5.0
    }
    
    override func Reset() {
        self.position = CGPoint.zero
    }
    
    override func CheckBounds() {
        if (self.position.y < -780) {
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
