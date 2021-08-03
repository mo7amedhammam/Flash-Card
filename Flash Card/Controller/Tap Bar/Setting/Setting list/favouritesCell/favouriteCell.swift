//
//  favouriteCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 03/05/2021.
//

import UIKit

class favouriteCell: UICollectionViewCell {
    @IBOutlet weak var FavNameLA: UILabel!
    @IBOutlet weak var delBtnOut: UIButton!
    
    var delegate : favourtDelegate!
    var index = 0
    
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    
    }
    
    
    
  
    @IBAction func DelFavBtn(_ sender: Any) {
        self.delegate.DeleteFavourite(index: index)
    }

}

protocol favourtDelegate {
    func DeleteFavourite (index : Int)
}
