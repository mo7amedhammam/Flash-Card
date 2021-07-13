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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//        presentSplash()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("branch ")
        print("Ragab Branch")
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
//        print("------ login -----")
        if Reachable.isConnectedToNetwork() {
            if TFEmail.text!.isEmpty  || Helper.isValidEmail(emailStr: TFEmail.text!) == false {
                showAlert(message: "Please Enter Valid Email", buttonTitle: "OK")
            } else if TFPassword.text!.isEmpty {
                    showAlert(message: "Please Enter Your Password", buttonTitle: "OK")
            }else{
               // your code
            login(email: TFEmail.text!, password: TFPassword.text!)
            }
        } else {
            // no internet
            showAlert(message: "No Internet Connection", buttonTitle: "OK")
        }
    }
    
    
    
   // var loginmodel = LoginModel?
    func login(email:String , password:String)  {
        if Reachable.isConnectedToNetwork(){
                API.userLogin(Email: TFEmail.text!, Password: TFPassword.text!, lang: "en") { (success,result,error) in
            if success {

                Helper.settoken(token: "Bearer "+(result?.data?.token)!)
     
                self.moveToHomeTab()
                
            }else{
                HUD.flash(.label(result?.message), delay:  2.0)
            }
        }
            }else{
                HUD.flash(.labeledError(title: "No Inernet Connection", subtitle: nil), delay: 2.0)
            }
        }
    
    func moveToHomeTab (){
        let vc = storyboard?.instantiateViewController(identifier: "HomeTabBar") as! HomeTabBar
        self.navigationController?.pushViewController(vc, animated: true)
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
