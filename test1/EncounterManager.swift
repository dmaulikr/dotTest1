import SpriteKit
class EncounterManager {
    let encounterNames:[String] = [
        "Encounter1",
        "Encounter2",
        "Encounter3"
    ]
    var encounters:[SKNode] = []
    var activeEncounters:[SKNode] = []
    
    init() {
        for encounterFileName in encounterNames {
            // Create a new node for the encounter:
            let encounterNode = SKNode()
            // Load this scene file into a SKScene instance:
            if let encounterScene = SKScene(fileNamed:
                encounterFileName) {
                // Loop through each child node in the SKScene
                for child in encounterScene.children {
                    // Create a copy of the scene's child node
                    // to add to our encounter node:
                    let copyOfNode = type(of: child).init()
                    // Save the scene node's position to the copy:
                    copyOfNode.position = child.position
                    // Save the scene node's name to the copy:
                    copyOfNode.name = child.name
                    // Add the copy to our encounter node:
                    encounterNode.addChild(copyOfNode)
                }
            }
            // Add the populated encounter node to the array:
            encounters.append(encounterNode)
        }
    }
    
    // pick a random encounter, add it to the scene
    func addEncounters(scene:SKNode) {
        let encounterCount = UInt32(encounters.count)
        let encounterRoll = Int(arc4random_uniform(encounterCount))
        if encounters.count > 0 {
            let selectedEncounter = encounters.remove(at: encounterRoll)
            activeEncounters.append(selectedEncounter)
            scene.addChild(selectedEncounter)
        } else {
            print("Ran out of encounters.")
        }
    }
}
