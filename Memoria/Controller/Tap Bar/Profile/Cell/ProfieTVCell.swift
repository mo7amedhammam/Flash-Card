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
    @IBAction func ProfileStarBtn(_ sender: Any) {
        if clicked == 0 {
            clicked = 1
            ProfileStarBuOutlet.isSelected = true
        }else{
            ProfileStarBuOutlet.isSelected = false
            clicked = 0

        }

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setCardView(view: MainViewOutlet)
        setRoundedView(roundedView: profileImageOutlet)
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
    
    


func setRoundedView (roundedView:UIView) {
    let saveCenter = roundedView.center
    let newFrame:CGRect = CGRect(origin: CGPoint(x: roundedView.frame.origin.x,y :roundedView.frame.origin.y), size: CGSize(width: roundedView.frame.size.width, height: roundedView.frame.size.height))
    roundedView.layer.cornerRadius = roundedView.frame.height/2
    roundedView.frame = newFrame;
    roundedView.center = saveCenter
    roundedView.clipsToBounds = true
    }

func setCardView(view : UIView){

        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0);
    view.layer.cornerRadius = 2;
    view.layer.shadowRadius = 2;
    view.layer.shadowOpacity = 0.5;

    }
    
    
    
    
}
