import SpriteKit

class Plane: GameObject {

    // constructor
    init() {
        super.init(imageString: "plane", initialScale: 1.0)
        Start()
        
    }
    
    override func CheckBounds() {
        //right boundary
        if (self.position.x > screenSize.width - self.halfwidth!) {
            self.position.x = screenSize.width - self.halfwidth!
        }
        
        //left boundary
        if (self.position.x < self.halfwidth!) {
            self.position.x = self.halfwidth!
        }
    }
    
    override func Start() {
        
    }
    
    override func Update() {
        self.CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint) {
        self.position = newPos
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
