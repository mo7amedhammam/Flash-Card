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
//        presentSplash()
        //        passwordTf.isSecureTextEntry = true
        
    }
    
//    func presentSplash() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "splashScreenVC") as! splashScreenVC
//        modalPresentationStyle = .popover
//        present(vc, animated: true, completion: nil)
//        
//    }
    
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreatNewUser") as! CreatNewUser
        //        self.navigationController?.pushViewController(vc, animated: true)
        //  performSegue(withIdentifier: "gotoCreatUser", sender: nil)
//        self.dismiss(animated: true, completion: nil)
//        present(vc, animated: true, completion: nil)
                vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func RessetPasswordBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ResetPassword") as! ResetPassword
                vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
 
    }
    
    
    @IBAction func Skip(_ sender: Any) {
        print("push Pressed")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AllCardsVC") as! AllCardsVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
    
}
