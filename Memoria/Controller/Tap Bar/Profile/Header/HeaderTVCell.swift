//
//  HeaderTVCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit

class HeaderTVCell: UITableViewCell {

    @IBOutlet weak var ProfileImageOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setRoundedView(roundedView: ProfileImageOutlet)
        // Initialization code
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
