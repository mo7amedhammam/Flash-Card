//
//  EXTAlert.swift
//  Memoria
//
//  Created by Muhamed Hammam on 05/04/2021.
//

import UIKit

extension UIViewController {
    func showAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alertController.addAction(OKAction)
        // valide ipad action sheet
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.sourceView = self.view
            popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        //------------------------
        self.present(alertController, animated: true, completion: nil)

    }
}
