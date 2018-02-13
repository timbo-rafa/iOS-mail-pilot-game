import SpriteKit

class Label: SKLabelNode {
    // Constructors
    init(labelString: String, position:CGPoint, fontSize: CGFloat, fontName: String, fontColor: SKColor, isCentered:Bool) {
        super.init()
        self.text = labelString
        self.position = position
        self.fontSize = fontSize
        self.fontName = fontName
        self.fontColor = fontColor
        
        if (isCentered) {
            self.position = position
        }
        else {
            self.position.x = position.x + self.frame.width * 0.5
            self.position.y = position.y + self.frame.width * 0.5
        }
        self.zPosition = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
