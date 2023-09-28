//
//  LearnViewController.swift
//
//

import Foundation
import UIKit
import SpriteKit

class LearnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //to identify the cell
    let cellIdentifier = "myLearnCell"
    //to access the model
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //returning number of elements
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.myModel.getLearnItems().count
    }
    
    //returning the cell for table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! TableCellController
        let learnItems = appDelegate.myModel.getLearnItems()
        
        //data for each row
        cell.myTitle.text = learnItems[indexPath.row].getItemName()
        cell.myDescription.text = learnItems[indexPath.row].getItemDescription()
        cell.myImage.image = learnItems[indexPath.row].getImage()
        
        //reurnt the cell with data
        return cell
    }


}
