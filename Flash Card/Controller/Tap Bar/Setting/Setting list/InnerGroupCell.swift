//
//  InnerGroupCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 18/04/2021.
//

import UIKit

class InnerGroupCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var cardViewOut: UIView!
    @IBOutlet weak var postImageOut: UIImageView!
    @IBAction func flipCardViewBtnPressed(_ sender: Any) {
        flipAnimation()
    }
    
    var isFlipped = false
    func flipAnimation()
    {
        if (!isFlipped){
            UIView.transition(with: cardViewOut, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            postImageOut.image = UIImage(named: "ststistics")
            isFlipped = true
        }else{
            UIView.transition(with: cardViewOut, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
            postImageOut.image = UIImage(named: "ME")
            isFlipped = false
        }
    }
    
    @IBOutlet weak var ExclaimBuOutlet: UIButton!
    @IBOutlet weak var StarBuOutlet: UIButton!
    
    var clicked = 0
    var clicked1 = 0
    
    @IBAction func BuExclaim(_ sender: Any) {
        if clicked == 0 {
            clicked = 1
            ExclaimBuOutlet.isSelected = true
        }else{
            ExclaimBuOutlet.isSelected = false
            clicked = 0
        }
    }
    
    @IBAction func BuStar(_ sender: Any) {
        if clicked1 == 0 {
            clicked1 = 1
            StarBuOutlet.isSelected = true
        }else{
            StarBuOutlet.isSelected = false
            clicked1 = 0
        }
        
    }
    
    
}
