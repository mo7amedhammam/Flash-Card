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
        self.navigationController?.navigationBar.isHidden =  true
        self.tabBarController?.tabBar.isHidden = true
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
                login(email: TFEmail.text!, password: TFPassword.text!, lang: "en")
            }
        } else {
            // no internet
            showAlert(message: "No Internet Connection", buttonTitle: "OK")
        }
    }
    
    
    
   // var loginmodel = LoginModel?
    func login(email:String , password:String , lang : String)  {
        if Reachable.isConnectedToNetwork(){
            API.userLogin(Email: email , Password: password, lang: lang) { (success , result : LoginModel? , error) in
            if success {

//                print (result?.data?.id ?? "") // OK

                Helper.setUserData(id: result?.data?.id ?? "" , user_type: result?.data?.user_type ?? "", fName: result?.data?.fName ?? "", lName: result?.data?.lName ?? "", address: result?.data?.address ?? "", profile_img: result?.data?.profile_img ?? "", cover_img: result?.data?.cover_img ?? "", university: result?.data?.university ?? "", username: result?.data?.username ?? "", email: result?.data?.email ?? "", mobile: result?.data?.mobile ?? "", gender: result?.data?.gender ?? "", joined_at: result?.data?.joined_at ?? "", token: (result?.data?.token!)!, email_verified: result?.data?.email_verified ?? 0, mobile_verified: result?.data?.mobile_verified ?? 0, del_schedule: result?.data?.del_schedule ?? "", account_status: result?.data?.account_status ?? "")
        
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
