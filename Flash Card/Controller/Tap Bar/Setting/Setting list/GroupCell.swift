//
//  GroupCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 14/04/2021.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var MaingroupCellView: UIView!
    @IBOutlet weak var GroupImageOutlet: UIImageView!
    @IBOutlet weak var GroupNameLaOut: UILabel!
    @IBOutlet weak var GroupUpdateTimeLaOut: UILabel!

    @IBAction func JionGroupBtn(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
