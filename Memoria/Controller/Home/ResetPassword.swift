//
//  ResetPassword.swift
//  Memoria
//
//  Created by Muhamed Hammam on 07/04/2021.
//

import UIKit

class ResetPassword: UIViewController {

    @IBOutlet weak var resetEmailTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var ResetPasswordBtOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackBTn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.navigationBar.popItem(animated: true)
        
    }
    
    

}
