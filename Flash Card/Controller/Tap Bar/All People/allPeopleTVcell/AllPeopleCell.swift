//
//  AllPeopleCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 07/04/2021.
//

import UIKit

class AllPeopleCell: UITableViewCell {

    @IBOutlet weak var MainViewOutlet: UIView!
    @IBOutlet weak var ImageOutlet: UIImageView!
    @IBOutlet weak var NameLaOutlet: UILabel!
    @IBOutlet weak var JobLaOutlet: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
