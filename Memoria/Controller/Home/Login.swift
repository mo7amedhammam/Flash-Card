//
//  Login.swift
//  Memoria
//
//  Created by Muhamed Hammam on 05/04/2021.
//

import UIKit
class Login: UIViewController {

    @IBOutlet weak var BtnShowPassword: UIButton!
    
    @IBOutlet weak var userNameTF: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var passwordTf: SkyFloatingLabelTextFieldWithIcon!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTf.isSecureTextEntry = true

        // Do any additional setup after loading the view.
    }
    

    
    var clicked = 0
    @IBAction func BUAgreeTerms(_ sender: Any) {
        if clicked == 0 {
            clicked = 1
            BtnShowPassword.isSelected = true
            passwordTf.isSecureTextEntry = false
        }else{
            clicked = 0
            BtnShowPassword.isSelected = false
            passwordTf.isSecureTextEntry = true
        }
        
    }
    @IBAction func DontHaveAccountBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreatNewUser") as! CreatNewUser
        self.navigationController?.pushViewController(vc, animated: true)

    }
}
