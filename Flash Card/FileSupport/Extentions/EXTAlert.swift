//
//  EXTAlert.swift
//  Memoria
//
//  Created by Muhamed Hammam on 05/04/2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(message: String, title: String = "" , buttonTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: buttonTitle, style: .destructive, handler: nil)
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
        // if no connection
    func connectionErrorAlert (controller : UIViewController) {
        //            let actionSheet  = UIAlertController(title: SalmanLocalize.textLocalize(key: "Lnointernet") , message: "", preferredStyle: .alert)
        //
        //            let alertAction = UIAlertAction(title: SalmanLocalize.textLocalize(key: "LReloadPage") , style: .default, handler: { (_) in
        //        controller.viewDidLoad()
        //    })
        
        let actionSheet  = UIAlertController(title: "Lnointernet" , message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Reload Page", style: .default, handler: { (_) in
            
            controller.viewDidLoad()
        })
        actionSheet.addAction(alertAction)
        
        //            let alertAction1 = UIAlertAction(title: SalmanLocalize.textLocalize(key: "LGoBack"), style: .default, handler: { (_) in
        //                self.dismiss(animated: true, completion: nil)
        //            })
        
        let alertAction1 = UIAlertAction(title:"Go Back", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        })
        actionSheet.addAction(alertAction1)
        // valide ipad action sheet
        if let popoverController = actionSheet.popoverPresentationController {
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.sourceView = self.view
            popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        //------------------------
        present(actionSheet, animated: true, completion: nil)
    }
    
    // if there is connection but no data
    func serverErrorAlert (controller : UIViewController) {
        //            let actionSheet  = UIAlertController(title:  SalmanLocalize.textLocalize(key: "Lservererror"), message: "", preferredStyle: .alert)
        //            let alertAction = UIAlertAction(title: SalmanLocalize.textLocalize(key: "LReloadPage"), style: .default, handler: { (_) in
        //                controller.viewDidLoad()
        //            })
        
        let actionSheet  = UIAlertController(title:"Server Error", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title:"Reload Page", style: .default, handler: { (_) in
            controller.viewDidLoad()
        })
        actionSheet.addAction(alertAction)
        
        //            let alertAction1 = UIAlertAction(title: SalmanLocalize.textLocalize(key: "LGoBack"), style: .default, handler: { (_) in
        //                self.dismiss(animated: true, completion: nil)
        //            })
        let alertAction1 = UIAlertAction(title:"Go Back", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        })
        actionSheet.addAction(alertAction1)
        
        // valide ipad action sheet
        if let popoverController = actionSheet.popoverPresentationController {
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.sourceView = self.view
            popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        }
        //------------------------
        present(actionSheet, animated: true, completion: nil)
    }
    
    // ---------------------------------------
    //             Hammam
    // ---------------------------------------
    //    Dismiss alert  function && Error
    func simpleErrorAlert(errorTilte:String,errorBody : String, buttonTitle:String){
        let alert = UIAlertController.init(title: errorTilte, message: errorBody, preferredStyle: .alert)
        let dismissbutton = UIAlertAction.init(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(dismissbutton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    // alert takes input and action buttons
    func alertForInput(SetTitle:String,SetMessage:String,Button1:String,Button2:String){
        let alert = UIAlertController(title: SetTitle, message: SetMessage, preferredStyle: .alert)
        
        // text input TF
        alert.addTextField(configurationHandler: { TitleTF in
            TitleTF.placeholder = "TextField1 PlaceHolder..."
            TitleTF.textAlignment = .center
        })
        
        // text input TF
        
        alert.addTextField(configurationHandler: { BodyTF in
            BodyTF.placeholder = "TextField2 PlaceHolder..."
        })
        
        alert.addAction(UIAlertAction(title: Button1, style: .default, handler: { (action) in
            let noteTitle = alert.textFields?.first?.text
            let noteBody = alert.textFields?.last?.text
            print(noteTitle!)
            print(noteBody!)
            
            //            self.determineMyCurrentLocation()
            
        }))
        alert.addAction(UIAlertAction(title: Button2, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
////    let
//    // alert takes input and action buttons
//    func moreButtonalert(SetTitle:String,SetMessage:String){
//        let alert = UIAlertController(title: SetTitle, message: SetMessage, preferredStyle: .actionSheet)
//        
//        alert.addAction(UIAlertAction(title: "Edit Post" , style: .default, handler: { [self] (action) in
//            // action Here
////            let input1 = alert.textFields?.first?.text
////            let input2 = alert.textFields?.last?.text
////            print(input1!)
////            print(input2!)
//            AllCardsVC().DeletePost(value:"" )
//            self.simpleErrorAlert(errorTilte: "Success Edit", errorBody: "", buttonTitle: "OK")
//            //            self.determineMyCurrentLocation()
//        
//            
//        }))
//        alert.addAction(UIAlertAction(title: "Delete Post", style: .default, handler: { (action) in
//            // action Here
//            self.simpleErrorAlert(errorTilte: "Success Delete", errorBody: "", buttonTitle: "OK")
//            //            self.determineMyCurrentLocation()
//            
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
////          cancel Button with cancel style
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }

    
    
}
