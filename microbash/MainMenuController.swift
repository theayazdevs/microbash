//
//  MainMenuController.swift
//
//

import Foundation
import UIKit
import SpriteKit

class MainMenuController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scene = MainMenuScene(size: view.bounds.size)
        let skView = view as! SKView
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }


}
