//
//  AllPeopleCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 07/04/2021.
//

import UIKit

class AllPeopleCell: UITableViewCell {

    @IBOutlet weak var MainViewOutlet: UIView!
    @IBOutlet weak var IVPerson: UIImageView!
    @IBOutlet weak var LaName: UILabel!
    @IBOutlet weak var LaJob: UILabel!
    
    @IBOutlet weak var btnFollow: UIButton!
    var index = 0
    var delegate : FollowProtocoalAllPeople!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        btnFollow.addTarget(self, action: #selector(self.BUFollow(_:)), for: .touchUpInside)

    }
    
    
    @IBAction func BUFollow(_ sender: Any) {
        delegate.Follow(index: index, Button: btnFollow)
        
    }
    
}

protocol FollowProtocoalAllPeople {
    func Follow (index : Int , Button : UIButton)
}
