//
//  HowToPlayViewController.swift
//
//

import Foundation
import UIKit
import SpriteKit

class HowToPlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scene = HowToPlayScene(size: view.bounds.size)
        let skView = view as! SKView
        scene.scaleMode = .resizeFill
        //present the scene
        skView.presentScene(scene)
    }


}
