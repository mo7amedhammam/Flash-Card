//
//  ProfieTVCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit

class ProfieTVCell: UITableViewCell {

    @IBOutlet weak var MainViewOutlet: UIView!
    
    @IBOutlet weak var profileImageOutlet: UIImageView!
    @IBOutlet weak var profileNameLaOutlet: UILabel!
    @IBOutlet weak var PostTimeLaOutlet: UILabel!
    @IBOutlet weak var ProfileMoreBuOutlet: UIButton!
    
    @IBOutlet weak var profilePostTextOutlet: UILabel!
    @IBOutlet weak var ProfilePostImageOutlet: UIImageView!
    @IBOutlet weak var ProfileStarBuOutlet: UIButton!
    
    
    var clicked = 0
    var didStar : () -> () = {}
    var didDelete : () -> () = {}

    @IBAction func ProfileStarBtn(_ sender: Any) {
        if clicked == 0 {
            clicked = 1
            didStar()
            ProfileStarBuOutlet.isSelected = true
        }else{
            ProfileStarBuOutlet.isSelected = false
            clicked = 0
        }
    }
    
    @IBAction func BuMoreOptions(_ sender: Any) {
//        delegate?.MoreButtonAction(with: title2)
        didDelete()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var cardViewOut: UIView!
    
    @IBAction func flipCardViewBtnPressed(_ sender: Any) {
        flipAnimation()
    }
    
    var isFlipped = false
    func flipAnimation()
    {
        if (!isFlipped){
            UIView.transition(with: cardViewOut, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            ProfilePostImageOutlet.image = UIImage(named: "ststistics")
            isFlipped = true
        }else{
            UIView.transition(with: cardViewOut, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
            ProfilePostImageOutlet.image = UIImage(named: "ME")
            isFlipped = false
        }
    }

    
    
}
