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
    var index = ""
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
//        delBtnOut.isHidden = true
        
    }

    @IBAction func DelFavBtn(_ sender: Any) {
        self.delegate.DeleteFavourite(value: index)
    }
    
    func toggleDelBtn(){
      delBtnOut.isHidden = !delBtnOut.isHidden
    }
}


protocol favourtDelegate {
   
    func DeleteFavourite (value : String)
}