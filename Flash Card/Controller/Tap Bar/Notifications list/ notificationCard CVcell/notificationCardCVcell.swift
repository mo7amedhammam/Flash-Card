//
//  notificationCardCVcell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 10/05/2021.
//

import UIKit

class notificationCardCVcell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    @IBOutlet weak var StarBuOutlet: UIButton!
    var clicked1 = 0
    @IBAction func starBtnPressed(_ sender: Any) {
        if clicked1 == 0 {
            clicked1 = 1
            StarBuOutlet.isSelected = true
        }else{
            StarBuOutlet.isSelected = false
            clicked1 = 0
            
        }
        
    }
    
    
    @IBOutlet weak var CardViewOut: CardView!
    
    @IBOutlet weak var cardImageOut: UIImageView!
    @IBAction func FlipCardBtnPressed(_ sender: Any) {
        flipAnimation()
    }
    
    var isFlipped = false
    func flipAnimation()
    {
        if (!isFlipped){
            UIView.transition(with: CardViewOut, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            cardImageOut.image = UIImage(named: "ststistics")
            isFlipped = true
        }else{
            UIView.transition(with: CardViewOut, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
            cardImageOut.image = UIImage(named: "ME")
            isFlipped = false
        }
    }
    
    
    
}
