//
//  NewCardImageCVCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 20/04/2021.
//

import UIKit

class NewCardImageCVCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    setCardView(view: ViewOut)
    
    
    }
    @IBOutlet weak var ViewOut: UIView!
    @IBOutlet weak var imageOut: UIImageView!
    
}
