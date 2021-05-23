//
//  AllPeopleTVCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 06/04/2021.
//

import UIKit


class AllCardsTVCell: UITableViewCell {
    
    @IBOutlet weak var cellMainVC: UIView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerLa: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusLa: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoLa: UILabel!
    @IBOutlet weak var StatusorImageV: UIView!
 
    
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellMainLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var PostLa: UILabel!
    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var StarBuOutlet: UIButton!
    @IBOutlet weak var ExclaimBuOutlet: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        headerImage.layer.cornerRadius = 50
//        cellImage.layer.cornerRadius = 25
        
//        StatusorImageV.addTapGesture(tapNumber: 1, target: self, action: #selector(move))
        
        
        
    }
    
    
//    @objc func move()  {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "CreatNewCardVC") as! CreatNewCardVC
//
////                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//
//    }
//

    
    @IBAction func BuMoreOptions(_ sender: Any) {
        
    }
    
    
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
    
    //4
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var FrontView: UIView!
       @IBAction func flipAction(_ sender: Any) {
        self.flipAnimation()
    
   }
    
    var isFlipped = false
    func flipAnimation()
    {
        if (!isFlipped){
            UIView.transition(with: FrontView, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            PostImage.image = UIImage(named: "ststistics")
            isFlipped = true
        }else{
            UIView.transition(with: FrontView, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
            PostImage.image = UIImage(named: "ME")
            isFlipped = false
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        cellMainVC.layer.cornerRadius = 12
//        cellMainVC.layer.shadowOpacity = 8
//        headerImage.cornerRadius = 50
//        cellImage.cornerRadius = 25
        
//        cellMainVC.dropShadow()
//        cellMainVC.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

        
    }
}
