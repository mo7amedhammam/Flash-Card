//
//  ProfieTVCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit

class ProfieTVCell: UITableViewCell {

    @IBOutlet weak var MainViewOutlet: UIView!
    
    @IBOutlet weak var IVprofile: UIImageView!
    @IBOutlet weak var LaName: UILabel!
    @IBOutlet weak var LaTime: UILabel!
    @IBOutlet weak var ProfileMoreBuOutlet: UIButton!
    
    @IBOutlet weak var cardViewOut: UIView!

    
    @IBOutlet weak var LaFrontDesc: UILabel!
    @IBOutlet weak var IVFront: UIImageView!
    
    @IBOutlet weak var BtnMore: UIButton!
    @IBOutlet weak var BtnStar: UIButton!
    @IBOutlet weak var BtnLove: UIButton!
    @IBOutlet weak var BtnFlip: UIButton!
    @IBOutlet weak var LaNumLove: UILabel!
    
    
    var delegate : ProtocoalProfileButtons!
    var indexx = 0
    
    
    
    
    
//    var clicked = 0
//    var didStar : () -> () = {}
//    var didDelete : () -> () = {}
//
//    @IBAction func ProfileStarBtn(_ sender: Any) {
//        if clicked == 0 {
//            clicked = 1
//            didStar()
//            ProfileStarBuOutlet.isSelected = true
//        }else{
//            ProfileStarBuOutlet.isSelected = false
//            clicked = 0
//        }
//    }
//
//    @IBAction func BuMoreOptions(_ sender: Any) {
////        delegate?.MoreButtonAction(with: title2)
//        didDelete()
//    }
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        BtnMore.addTarget(self, action: #selector(self.BUMore(_:)), for: .touchUpInside)
        BtnStar.addTarget(self, action: #selector(self.BUStar(_:)), for: .touchUpInside)
        BtnLove.addTarget(self, action: #selector(self.BULove(_:)), for: .touchUpInside)
        BtnFlip.addTarget(self, action: #selector(self.BUFlip(_:)), for: .touchUpInside)


        
        
    }
    
    
    @IBAction func BUMore(_ sender: Any) {
        delegate.More(index: indexx)
    }
    
    
    @IBAction func BUStar(_ sender: Any) {
        delegate.Star(index: indexx , button: BtnStar)
    }
    
    @IBAction func BULove(_ sender: Any) {
        delegate.Love(index: indexx , button: BtnLove , LCount : LaNumLove)
    }
    
    @IBAction func BUFlip(_ sender: Any) {
        delegate.Flip(index: indexx , view: cardViewOut , lable : LaFrontDesc  , image : IVFront)
    }
    
    
//    @IBAction func flipCardViewBtnPressed(_ sender: Any) {
//        flipAnimation()
//    }
//
//    var isFlipped = false
//    func flipAnimation()
//    {
//        if (!isFlipped){
//            UIView.transition(with: cardViewOut, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//            IVFront.image = UIImage(named: "ststistics")
//            isFlipped = true
//        }else{
//            UIView.transition(with: cardViewOut, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
//            IVFront.image = UIImage(named: "ME")
//            isFlipped = false
//        }
//    }

    
    
}


protocol ProtocoalProfileButtons {
    func More (index : Int )
    func Star (index : Int , button : UIButton)
    func Love (index : Int , button : UIButton , LCount : UILabel)
    func Flip (index : Int , view : UIView , lable : UILabel , image : UIImageView)

}
