//
//  HowToPlayScene.swift
//
//

import Foundation
import SpriteKit

class HowToPlayScene: SKScene {
    
    //variable for scroll view
    var theScrollView: UIScrollView!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //background color
        //backgroundColor = .white
        
        //setting background image
        //let backgroundTexture = SKTexture(imageNamed: "helpBack.png")
        let backgroundTexture = SKTexture(imageNamed: "backHelp.png")
        let backgroundNode = SKSpriteNode(texture: backgroundTexture, size: self.size)
        backgroundNode.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        //opacity
        backgroundNode.alpha = 0.3
        addChild(backgroundNode)
        
        //setting the scroll view
        theScrollView = UIScrollView(frame: view.bounds)
        view.addSubview(theScrollView)
        
        //setting the top fixed label
        let heading = UILabel(frame: CGRect(x: size.width/2, y:0, width: theScrollView.frame.width-20, height: 40))
        heading.font = UIFont.boldSystemFont(ofSize: 30)
        heading.text = " How To Play? "
        heading.textAlignment = .center
        heading.textColor = .white
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.layer.zPosition = 1
        heading.backgroundColor = UIColor.systemGreen
        heading.layer.cornerRadius = 10
        heading.layer.masksToBounds = true
        theScrollView.addSubview(heading)
        //activating contraints for the label within view
        NSLayoutConstraint.activate([
            //align center by X-axis
            heading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //place the label at top of the view
            heading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        //instructions with images, 1
        //label
        let headingOne = UILabel(frame: CGRect(x: 10, y: 50, width: theScrollView.frame.width-20, height: 200))
        headingOne.font = UIFont.boldSystemFont(ofSize: 24)
        headingOne.text = "1) Save the Human:\nYou can move the human on the screen by touch and dragging your finger around the screen, You have to avoid touching the viruses to save the human from infections"
        headingOne.numberOfLines = 0
        headingOne.textColor = .white
        theScrollView.addSubview(headingOne)
        //image
        let imageOne = UIImageView(frame: CGRect(x: 10, y: 250, width: theScrollView.frame.width-20, height: 500))
        imageOne.image = UIImage(named: "help1")
        theScrollView.addSubview(imageOne)
        
        //instructions with images, 2
        //label
        let headingTwo = UILabel(frame: CGRect(x: 10, y: 750, width: theScrollView.frame.width-20, height: 200))
        headingTwo.font = UIFont.boldSystemFont(ofSize: 24)
        headingTwo.text = "2) Get score:\nTo earn score you have to eat fruits, as fruits and healthy foods boost human's immunity and increase survival"
        headingTwo.numberOfLines = 0
        headingTwo.textColor = .white
        theScrollView.addSubview(headingTwo)
        //image
        let imageTwo = UIImageView(frame: CGRect(x: 10, y: 950, width: theScrollView.frame.width-20, height: 500))
        imageTwo.image = UIImage(named: "help2")
        theScrollView.addSubview(imageTwo)
        let imageTwoB = UIImageView(frame: CGRect(x: 10, y: 1450, width: theScrollView.frame.width-20, height: 500))
        imageTwoB.image = UIImage(named: "help3")
        theScrollView.addSubview(imageTwoB)
        
        //instructions with images, 3
        //label
        let headingThree = UILabel(frame: CGRect(x: 10, y: 1920, width: theScrollView.frame.width-20, height: 200))
        headingThree.font = UIFont.boldSystemFont(ofSize: 24)
        headingThree.text = "3) Restart:\nWhen the human gets infected then GameOver screen appears. Click anywhere to restart the game."
        headingThree.numberOfLines = 0
        headingThree.textColor = .white
        theScrollView.addSubview(headingThree)
        //image
        let imageThree = UIImageView(frame: CGRect(x: 10, y: 2100, width: theScrollView.frame.width-20, height: 500))
        imageThree.image = UIImage(named: "help4")
        theScrollView.addSubview(imageThree)
        
        //specifing the width and height of the scrollable content in scroll view
        theScrollView.contentSize = CGSize(width: theScrollView.frame.width, height: imageThree.frame.maxY+10)
    
    }
}
