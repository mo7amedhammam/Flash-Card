//
//  CardView.swift
//  Memoria
//
//  Created by Muhamed Hammam on 22/04/2021.
//

import UIKit
import AVFoundation


@IBDesignable class CardView: UIView {

        
    var CornerRadius : CGFloat = 5
    var ofsetWidth : CGFloat = 5
    var ofsethHight : CGFloat = 5
    var ofsethShadowOpacity : Float = 5
    var mycolour = UIColor.systemGray4

    override func layoutSubviews() {
        layer.cornerRadius = self.CornerRadius
        layer.shadowColor = self.mycolour.cgColor
        layer.shadowOffset  = CGSize(width: self.ofsetWidth, height: self.ofsethHight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            layer.shadowOpacity = self.ofsethShadowOpacity

    }
    
}
