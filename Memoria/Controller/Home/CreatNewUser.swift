//
//  CreatNewUser.swift
//  Memoria
//
//  Created by Muhamed Hammam on 05/04/2021.
//

import UIKit



class CreatNewUser: UIViewController {

    
    @IBOutlet weak var firstNameOutlet: UITextField!
    @IBOutlet weak var BtnAgreeTermsOutlet: UIButton!
    @IBOutlet weak var BtnSignUpOutlet: UIButton!
    @IBOutlet weak var FnameTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var LnameTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var EmailTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var MobileNumberTF: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var UniversityTF: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var GenderTF: SkyFloatingLabelTextFieldWithIcon!

    @IBOutlet weak var PasswordTF: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var confirmPasswordTF: SkyFloatingLabelTextFieldWithIcon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var agreeClicked = 0
    @IBAction func BUAgreeTerms(_ sender: Any) {
        if agreeClicked == 0 {
            BtnAgreeTermsOutlet.isSelected = true
            agreeClicked = 1
        }else{
            BtnAgreeTermsOutlet.isSelected = false
            agreeClicked = 0
        }
        
    }
    
    @IBAction func BuGoToLogin(_ sender: Any) {
        print("go to login")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func BuSignUp(_ sender: Any) {
//        let firstname = firstNameOutlet?.text
        print("SignUp with \(firstNameOutlet?.text ?? "DefaultValue")")

    }
    
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
