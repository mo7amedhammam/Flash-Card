//
//  CreatNewUser.swift
//  Memoria
//
//  Created by Muhamed Hammam on 05/04/2021.
//

import UIKit
import IQKeyboardManagerSwift
import PKHUD

class CreatNewUser: UIViewController {
  
    @IBOutlet weak var BtnAgreeTermsOutlet: UIButton!
    @IBOutlet weak var BtnSignUpOutlet: UIButton!
    
    @IBOutlet weak var TFFname: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFLname: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFEmail: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFMobileNumber: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFUserName: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFGender: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFPassword: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var TFPasswordConfirm: SkyFloatingLabelTextFieldWithIcon!
    
    var  PickerViewOut = UIPickerView()
    let gendersArr = ["male" , "female"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setpicker()

    }

    
    @IBAction func BUAgreeTerms(_ sender: Any) {
        BtnAgreeTermsOutlet.isSelected = !BtnAgreeTermsOutlet.isSelected
    }
    
    @IBAction func BuGoToLogin(_ sender: Any) {
        print("go to login")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BuSignUp(_ sender: Any) {
        
        if TFFname.text!.isEmpty{
            showAlert(message: "enter your first name", buttonTitle: "OK")
          }else if TFLname.text!.isEmpty{
          showAlert(message: "enter your last name", buttonTitle: "OK")
          }else if TFUserName.text!.isEmpty{
            showAlert(message: "enter user name", buttonTitle: "OK")
          }else if TFEmail.text!.isEmpty  || !Helper.isValidEmail(emailStr: TFEmail.text!) {
            showAlert(message: "enter a valid e-mail", buttonTitle: "OK")
          }else if TFMobileNumber.text!.isEmpty{
            showAlert(message: "enter your mobile number", buttonTitle: "OK")
          }else if TFGender.text!.isEmpty{
            showAlert(message: "gender is not selected", buttonTitle: "OK")
          }else if TFPassword.text!.count < 8 {
            showAlert(message: "enter 8 characters password", buttonTitle: "OK")
          }else if TFPassword.text != TFPasswordConfirm.text {
            showAlert(message: "password not match", buttonTitle: "OK")
          }else if !BtnAgreeTermsOutlet.isSelected  {
            showAlert(message: "agree app terms", buttonTitle: "OK")
          }else{
            print( TFPassword.text!)
            print( TFPasswordConfirm.text!)
            
            self.CreatUser(fName: TFFname.text, lName: TFLname.text, gender: TFGender.text, username: TFUserName.text, mobile: TFMobileNumber.text, email: TFEmail.text, password: TFPassword.text, password_confirmation: TFPasswordConfirm.text, lang: "en")
    }
    }

    
    func CreatUser(fName: String?, lName: String?, gender: String?, username: String?, mobile: String?, email: String?, password: String?, password_confirmation: String?, lang: String?)  {
      
        if Reachable.isConnectedToNetwork(){
            API.userRegister(fName: fName!, lName: lName!, gender: gender!, username: username!, mobile: mobile!, email: email!, password: password!, password_confirmation: password_confirmation!, lang: lang!){ (success,result,error) in
            if success {
                
//                Helper.settoken(token: "Bearer " + (result?.data?.token)!)
                
                Helper.setUserData(id: result?.data?.id ?? "" , user_type: result?.data?.user_type ?? "", fName: result?.data?.fName ?? "", lName: result?.data?.lName ?? "", address: result?.data?.address ?? "", profile_img: result?.data?.profile_img ?? "", cover_img: result?.data?.cover_img ?? "", university: result?.data?.university ?? "", username: result?.data?.username ?? "", email: result?.data?.email ?? "", mobile: result?.data?.mobile ?? "", gender: result?.data?.gender ?? "", joined_at: result?.data?.joined_at ?? "", token: (result?.data?.token!)!, email_verified: result?.data?.email_verified ?? 0, mobile_verified: result?.data?.mobile_verified ?? 0, del_schedule: result?.data?.del_schedule ?? "", account_status: result?.data?.account_status ?? "")
                
                self.moveToHomeTab()

            }else {
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
    
    

    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension CreatNewUser:  UIPickerViewDelegate, UIPickerViewDataSource{
    //MARK: --- Gender Picker ------
    func setpicker()  {
    //Picker View
    PickerViewOut = UIPickerView()
    PickerViewOut.dataSource = self
    PickerViewOut.delegate = self
    TFGender.inputView = PickerViewOut
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gendersArr[row]
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        gendersArr.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 55
    }
  
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TFGender.text = gendersArr[row]
        self.view.endEditing(true)
    }
    
}
