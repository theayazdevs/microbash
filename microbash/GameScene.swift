//
//  GameScene.swift
//
//

import Foundation
import SpriteKit

//managing the game
class GameScene: SKScene, SKPhysicsContactDelegate {
    //to store screenBounds
    var maxY = 0.0
    var maxX = 0.0
    var minY = 0.0
    var minX = 0.0
    //human which is the player
    let human = SKSpriteNode(imageNamed: "human.png")
    //various viruses
    var viruses = ["virus1", "virus2", "virus3", "virus4"]
    //various fruits
    var fruits = ["apple","orange","strawberry","bananas"]
    //object categories, for the purpose of collision detection
    let humanCategory:UInt32 = 0x1 << 0
    let virusCategeory:UInt32 = 0x1 << 1
    let fruitsCategory:UInt32 = 0x1 << 2
    //score label
    var scoreLbl: SKLabelNode!
    //to count number of viruses created
    var virusCount = 0
    //to store and update the score value
    var score = 0 {
        didSet{
            scoreLbl.text = "Score: \(score)"
        }
    }
    // to set the game timer
    var timerGame: Timer?
    
    override func didMove(to view: SKView) {
        //getting screen bounds
        let screenBounds = UIScreen.main.bounds
        //top side of screen
        maxY = screenBounds.maxY
        //right side of screen
        maxX = screenBounds.maxX
        //bottom side of screen
        minY = screenBounds.minY
        //left side of screen
        minX = screenBounds.minX
        
        //setting background color of the view
        //backgroundColor = .gray
        
        //setting background image
        let backgroundTexture = SKTexture(imageNamed: "gameBack.png")
        let backgroundNode = SKSpriteNode(texture: backgroundTexture, size: self.size)
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        addChild(backgroundNode)
        
        //setting the human player
        human.position = CGPoint(x: 100, y: 380)
        human.size = CGSize(width: 50, height: 80)
        human.physicsBody = SKPhysicsBody(texture: human.texture!, size: human.size)
        human.physicsBody?.categoryBitMask = humanCategory
        human.physicsBody?.contactTestBitMask = virusCategeory | fruitsCategory
        human.physicsBody?.isDynamic = false
        addChild(human)
        
        //setting score labe at the top of the screen
        scoreLbl = SKLabelNode(fontNamed: "Helvetica-Bold")
        //scoreLbl.position = CGPoint(x: frame.midX, y: frame.maxY - (frame.maxY/10))
        scoreLbl.position = CGPoint(x: (size.width/2)+50, y: maxY-100)
        scoreLbl.fontColor = .white
        scoreLbl.text = "Score: \(score)"
        scoreLbl.horizontalAlignmentMode = .right
        scoreLbl.zPosition = 1
        scoreLbl.alpha = 0.9
        addChild(scoreLbl)
        
        //intitial score
        score = 0
        
        //setting physics world with zero gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)

        //to handle contacts between the physics bodies on the scene
        physicsWorld.contactDelegate = self
        
        //pinch gesture recognizer for resizing the human size
        let pinchRecognizer = UIPinchGestureRecognizer(
            target: self, action: #selector(humanSizePinch(_sender:))
        )
        self.view!.addGestureRecognizer(pinchRecognizer)
        
        //creating the game timer and starting spawing fruits and viruses
        timerGame = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(spawnGameObjects), userInfo: nil, repeats: true)
    }
    
    //method to generate viruses and fruits
    @objc func spawnGameObjects() {
        //optional binding to get random viruses, return will be called if randomElement returns nil
        guard let virus = viruses.randomElement() else {return}
        guard let fruit = fruits.randomElement() else {return}
        //print(virus)
        //print(fruit)
        //creating virus elements
        let virusSprite = SKSpriteNode(imageNamed: virus)
        virusSprite.size = CGSize(width: 150, height: 150)
        let randomY = CGFloat.random(in: (minY+50)...(size.height+50))
        virusSprite.position = CGPoint(x: 800, y: randomY)
        virusSprite.physicsBody = SKPhysicsBody(texture: virusSprite.texture!, size: virusSprite.size)
        virusSprite.physicsBody?.categoryBitMask = virusCategeory
        virusSprite.physicsBody?.contactTestBitMask = humanCategory
        virusSprite.physicsBody?.collisionBitMask = 0
        //speed per second with velocity, -x towards the left
        virusSprite.physicsBody?.velocity = CGVector(dx: -200, dy: 0)
        //to cause the virus to spin around its z-axis
        virusSprite.physicsBody?.angularVelocity = 5
        virusSprite.physicsBody?.linearDamping = 0
        virusSprite.physicsBody?.angularDamping = 0
        addChild(virusSprite)
        
        //creating fruit elements
        let fruitSprite = SKSpriteNode(imageNamed: fruit)
        fruitSprite.size = CGSize(width: 80, height: 80)
        let randomYF = CGFloat.random(in: (minY+50)...(size.height+50))
        fruitSprite.position = CGPoint(x: 800, y: randomYF)
        fruitSprite.physicsBody = SKPhysicsBody(texture: fruitSprite.texture!, size: fruitSprite.size)
        fruitSprite.physicsBody?.categoryBitMask = fruitsCategory
        fruitSprite.physicsBody?.contactTestBitMask = humanCategory
        fruitSprite.physicsBody?.collisionBitMask = 0
        //speed per second with velocity, -x towards the left
        fruitSprite.physicsBody?.velocity = CGVector(dx: -100, dy: 0)
        //to cause the fruit to spin around its z-axis
        fruitSprite.physicsBody?.angularVelocity = 3
        fruitSprite.physicsBody?.linearDamping = 0
        fruitSprite.physicsBody?.angularDamping = 0
        addChild(fruitSprite)
        
        //to keep count of the virus created
        virusCount += 1
        //print(virusCount)
        
        //to make game challenging over time
        //when 5 viruses, invalidate the current timer, start a new one with reduced time interval
        if virusCount % 5 == 0 {
            //stopping the current timer
            timerGame?.invalidate()
            //minumum interval between viruses is 0.9, if timer nil then default is 1.0
            let newGenerator = max(0.9, timerGame?.timeInterval ?? 1.0 - 0.1)
            //starting the new timer
            timerGame = Timer.scheduledTimer(timeInterval: newGenerator, target: self, selector: #selector(spawnGameObjects), userInfo: nil, repeats: true)
        }
        
    }
    
    //removing nodes that go outside the screen bounds
    override func update(_ currentTime: TimeInterval) {
         for node in children{
             if node.position.x < minX || node.position.y < minY || node.position.y > maxY {
                 node.removeFromParent()
             }
         }
         
     }
    
    //method to handle pinch to resize human character
    @objc func humanSizePinch(_sender: UIPinchGestureRecognizer){
        switch _sender.state {
        case .began, .changed:
            //scale the human based on the pinch gesture scale
            let scale = _sender.scale
            let newScale = max(0.5, min(5.0, human.xScale * scale))
            human.setScale(newScale)
            _sender.scale = 1.0
            default: break
        }
    }
    
    //to track the movement of the player finger
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let userTouch = touches.first else {return}
        let touchLocation = userTouch.location(in: self)

        //setting the tocuh area for the human to move
        if touchLocation.y > maxY - 100 {
            //ignore the touch
            return
        }
        if touchLocation.y < 20 {
            //ignore the touch
            return
        }
        if touchLocation.x < 20 {
            //ignore the touch
            return
        }
        if touchLocation.x > maxX - 20 {
            //ignore the touch
            return
        }
        //take human to the moved to touch location
        human.position = touchLocation
    }
    
    //method to run at game over
    func gameIsOver(){
        //image to show
        let humanInfected = SKSpriteNode(imageNamed: "skeleton.png")
        humanInfected.size = CGSize(width: 100, height: 200)
        humanInfected.position = human.position
        addChild(humanInfected)
        human.removeFromParent()
        //moving score label at gameOver
        let scoreMove = SKAction.move(to: CGPoint(x: (human.position.x)+150, y: human.position.y), duration: 1.0 )
        //let scoreMove = SKAction.move(to: CGPoint(x: (scoreLbl.position.x)+20, y: (scoreLbl.position.y)-200), duration: 1.0 )
        let scoreScale = SKAction.scale(by: 1.0, duration: 2.0)
        let scoreGroup = SKAction.group([scoreMove,scoreScale])
        scoreLbl.run(scoreGroup)
        //stopping the timer
        timerGame?.invalidate()
        let gameOverScene = GameOverScene(size: size)
        //present the gameOver scene
        //self.view?.presentScene(gameOverScene)
        //show the game over scene with a delay of 3
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.view?.presentScene(gameOverScene)
        }
    }
    
    //to handle the contact between two physical bodies
    func didBegin(_ contact: SKPhysicsContact) {
        //handle human to virus contact
        if contact.bodyA.categoryBitMask == humanCategory && contact.bodyB.categoryBitMask == virusCategeory {
            //print("hit virus")
            gameIsOver()
            //handle human to fruit contact
        } else if  contact.bodyA.categoryBitMask == humanCategory && contact.bodyB.categoryBitMask == fruitsCategory {
            //print("fruit hit")
            //remove fruit hit from screen
            contact.bodyB.node?.removeFromParent()
            //add score and update
            score += 1
            scoreLbl.text = "Score: \(score)"
        }
    }

}
