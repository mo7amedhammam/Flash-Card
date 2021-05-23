//
//  RoundedImage.swift
//  Memoria
//
//  Created by Muhamed Hammam on 06/05/2021.
//

import Foundation
import UIKit

// MARK: ImageView extension to make rounded
@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
