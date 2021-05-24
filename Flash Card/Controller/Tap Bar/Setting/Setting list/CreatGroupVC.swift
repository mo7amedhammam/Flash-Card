//
//  CreatGroupVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 14/04/2021.
//

import UIKit

class CreatGroupVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    let myPickerData = [ "Public", "Private"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        myPickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        GroupPrivaceTF.text = myPickerData[row]
        PickerViewOut.isHidden = true
    }
    @IBOutlet weak var privacyView: UIView!
    
    @IBOutlet var containerViewOut: UIView!
    @IBOutlet weak var groupNameTF: UITextField!
    @IBOutlet weak var GroupPrivaceTF: UITextField!
    @IBOutlet weak var GroupNameVOut: UIView!
    @IBOutlet weak var GroupPrivacyOut: UIView!
    
//    @IBOutlet weak var PickerViewOut: UIPickerView!
    
    var PickerViewOut : UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        PickerViewOut = UIPickerView()

        PickerViewOut.dataSource = self
        PickerViewOut.delegate = self
        PickerViewOut.isHidden = true
        GroupPrivaceTF.inputView = PickerViewOut
        
     
    }
  
    
    
    @IBAction func BackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
