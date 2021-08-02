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
    var indicator:ProgressIndicator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // indicator hud ----------------//
        //    var indicator:ProgressIndicator?
        indicator = ProgressIndicator(inview:self.view,loadingViewColor: UIColor.lightGray, indicatorColor: #colorLiteral(red: 0.07058823529, green: 0.3568627451, blue: 0.6352941176, alpha: 1) , msg:  SalmanLocalize.textLocalize(key: "LPleaseWait") )
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        //  end indicator hud ----------------//
        
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
            showAlert(message: "enter your first name")
        } else if TFLname.text!.isEmpty{
            showAlert(message: "enter your last name")
        } else if TFUserName.text!.isEmpty{
            showAlert(message: "enter user name")
        } else if TFEmail.text!.isEmpty  || !Helper.isValidEmail(emailStr: TFEmail.text!) {
            showAlert(message: "enter a valid e-mail")
        } else if TFMobileNumber.text!.isEmpty{
            showAlert(message: "enter your mobile number")
        } else if TFGender.text!.isEmpty{
            showAlert(message: "gender is not selected")
        } else if TFPassword.text!.count < 8 {
            showAlert(message: "enter 8 characters password")
        } else if TFPassword.text != TFPasswordConfirm.text {
            showAlert(message: "password not match")
        } else if !BtnAgreeTermsOutlet.isSelected  {
            showAlert(message: "agree app terms")
        } else{
      
            self.indicator?.start()
            if Reachable.isConnectedToNetwork() {
                API.userRegister(fName: TFFname.text!, lName: TFLname.text!, gender: TFGender.text!, username: TFUserName.text!, mobile: TFMobileNumber.text!, email: TFEmail.text!, password: TFPassword.text!, password_confirmation: TFPasswordConfirm.text!, lang: "en" ) { (error : Error?, success : Bool?, message : String?) in
                    
                    if error == nil && success == true {
                        let vc = self.storyboard?.instantiateViewController(identifier: "HomeTabBar") as! HomeTabBar
                        self.navigationController?.pushViewController(vc, animated: true)
                        self.indicator?.stop()
                    } else if error == nil && success == true {
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
