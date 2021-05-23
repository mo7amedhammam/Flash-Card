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
        
        setRoundedView(roundedView: ImageOutlet)
        setCardView(view: MainViewOutlet)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        view.layer.shadowOpacity = 0.3;

        }

}
