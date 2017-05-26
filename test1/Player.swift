import SpriteKit
class Player : SKSpriteNode {
    init() {
        super.init(texture: nil, color: .blue, size: CGSize(width: 78, height: 78))
        self.name = "player"
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 78, height: 78), center: CGPoint(x: 0.5, y: 0.5))
        self.physicsBody?.categoryBitMask = 0b1
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = 0b1 << 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
