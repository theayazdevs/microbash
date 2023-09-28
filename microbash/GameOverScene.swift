//
//  GameOverScene.swift
//
//

import SpriteKit

//managing the gameOver scene
class GameOverScene : SKScene {
    //gameOver label with text
    let gameOverText = SKLabelNode(text: "          GAME OVER!\nTouch Anywhere To Restart ...")
    //images to be shown randomly
    var fruitFacts = ["FruitFacts1", "FruitFacts2", "FruitFacts3", "FruitFacts4"]

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //game over text label
        gameOverText.position = CGPoint(x: size.width/2, y: (size.height/2)+200)
        gameOverText.fontSize = 30
        gameOverText.numberOfLines = 0
        gameOverText.fontColor = .white
        gameOverText.color = .red
        gameOverText.horizontalAlignmentMode = .center
        addChild(gameOverText)
        
        //to show some information images on game over scene
        guard let info = fruitFacts.randomElement() else {return}
        let infoSprite = SKSpriteNode(imageNamed: info)
        infoSprite.size = CGSize(width: 400, height: 500)
        infoSprite.position = CGPoint(x: size.width/2, y: (size.height/2)-100)
        addChild(infoSprite)
    }
    //when player touches on the screen, Restart game
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let scene = GameScene(size: size)
        //take to the scene
        view?.presentScene(scene)
    }
}

