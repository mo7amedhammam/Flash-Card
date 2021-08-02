//
//  Login.swift
//  Memoria
//
//  Created by Muhamed Hammam on 05/04/2021.
//

import UIKit
import PKHUD

class Login: UIViewController {
    
    @IBOutlet weak var BtnShowPassword: UIButton!
    
    @IBOutlet weak var TFEmail: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var TFPassword: SkyFloatingLabelTextFieldWithIcon!
    
    var indicator:ProgressIndicator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // indicator hud ----------------//
        //    var indicator:ProgressIndicator?
        indicator = ProgressIndicator(inview:self.view,loadingViewColor: UIColor.lightGray, indicatorColor: #colorLiteral(red: 0.07058823529, green: 0.3568627451, blue: 0.6352941176, alpha: 1) , msg:  SalmanLocalize.textLocalize(key: "LPleaseWait") )
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        //  end indicator hud ----------------//
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        presentSplash()
    }
    
    
    func presentSplash() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "splashScreenVC") as! splashScreenVC
        modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
        
    }
    
    var clicked = 0
    @IBAction func BUAgreeTerms(_ sender: Any) {
        if clicked == 0 {
            clicked = 1
            BtnShowPassword.isSelected = true
            TFPassword.isSecureTextEntry = false
        }else{
            clicked = 0
            BtnShowPassword.isSelected = false
            TFPassword.isSecureTextEntry = true
        }
        
    }
    
    
    @IBAction func BtnSignIn(_ sender: Any) {
        
        if TFEmail.text == "" {
            self.showAlert(message: "Please Enter Your Email")
        } else if TFPassword.text == "" {
            self.showAlert(message: "Please Enter Your Password")
        } else {
            self.indicator?.start()
            if Reachable.isConnectedToNetwork() {
                API.userLogin(email: TFEmail.text! , password: TFPassword.text!, lang: "en") { [self] (error : Error?, success : Bool?, message : String?) in
                    if error == nil && success == true {
                        let vc = storyboard?.instantiateViewController(identifier: "HomeTabBar") as! HomeTabBar
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.indicator?.stop()
                    } else if error == nil && success == false {
                        self.showAlert(message: message!)
                        self.indicator?.stop()
                    } else {
                        self.showAlert(message: "Server Error")
                        self.indicator?.stop()
                        
                    }
                }
            } else {
                self.showAlert(message: "No Internet Connection")
                self.indicator?.stop()
            }
        }
        
    }
    
    @IBAction func DontHaveAccountBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreatNewUser") as! CreatNewUser
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func RessetPasswordBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ResetPassword") as! ResetPassword
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
