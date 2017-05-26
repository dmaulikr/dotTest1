import SpriteKit
class Dot : SKSpriteNode {
    let dotTex = SKTexture(imageNamed: "dot")
    init() {
        super.init(texture: dotTex, color: .clear, size: dotTex.size())
        self.name = "dot"
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.categoryBitMask = 0b1 << 1
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = 0b1
    }
    
    func move() {
        let collected = SKAction.run {
            self.position.x = 10000
        }
        self.run(collected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
