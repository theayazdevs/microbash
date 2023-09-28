//
//  TableCellController.swift
//
//

import UIKit

//custom table cell controller
class TableCellController: UITableViewCell {
    //referenece to the UI label
    @IBOutlet weak var myDescription: UILabel!
    //referenece to the UI label
    @IBOutlet weak var myTitle: UILabel!
    //referenece to the UI Image
    @IBOutlet weak var myImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    //to set any custom behaviour of the cell
    override func setSelected(_ selected: Bool, animated: Bool) {
        //
    }
}
