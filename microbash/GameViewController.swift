//
//  GameViewController.swift
//
//

import Foundation
import UIKit
import SpriteKit

//For main game
class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }


}
