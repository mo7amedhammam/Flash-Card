//
//  TVHeaderCell.swift
//  Memoria
//
//  Created by Muhamed Hammam on 06/04/2021.
//

import UIKit

class TVHeaderCell: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // this class instantiate the nib and returns classType
    class func HeaderNibInnerClass() -> TVHeaderCell {
        let myClassNib = UINib(nibName: "TVHeaderCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TVHeaderCell  //instantiate()[0] >> first view in the Nib
            return myClassNib
        }
}
