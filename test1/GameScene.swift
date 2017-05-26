import SpriteKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    let player = Player()
    let manager = EncounterManager()
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.backgroundColor = .white
        self.addChild(player)
        manager.addEncounters(scene: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        
        if let touch = touches.first?.location(in: self) {
            player.position = touch
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { player.position = t.location(in: self) }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let dotBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask == 0b1 {
            dotBody = contact.bodyB
        } else {
            dotBody = contact.bodyA
        }
        
        if let dot = dotBody.node as? Dot {
            print("About to set dot position...")
//            dot.move() // this way works
            dot.position.x = 10000 // can't move it this way
        }
    }
}


/*
 
 import SpriteKit
 class GameScene: SKScene, SKPhysicsContactDelegate {
 let player = Player()
 let manager = EncounterManager()
 
 override func didMove(to view: SKView) {
 self.physicsWorld.contactDelegate = self
 self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
 self.backgroundColor = .white
 self.addChild(player)
 manager.addEncounters(scene: self)
 }
 
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 if let touch = touches.first?.location(in: self) {
 player.position = touch
 }
 }
 
 override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
 for t in touches { player.position = t.location(in: self) }
 }
 
 func move(node: SKNode) {
 let collected = SKAction.run {
 node.position.x = 10000
 }
 self.run(collected)
 }
 
 func didBegin(_ contact: SKPhysicsContact) {
 let dotBody: SKPhysicsBody
 if contact.bodyA.categoryBitMask == 0b1 {
 dotBody = contact.bodyB
 } else {
 dotBody = contact.bodyA
 }
 
 if let dot = dotBody.node as? Dot {
 print("About to set dot position...")
 move(node: dot) // this works too
 //            dot.move() // this way works
 //            dot.position.x = 10000 // can't move it this way
 }
 }
 }

 */
