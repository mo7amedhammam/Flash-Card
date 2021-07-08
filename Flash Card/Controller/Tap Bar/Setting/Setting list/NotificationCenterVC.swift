//
//  NotificationCenterVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 11/04/2021.
//

import UIKit

class NotificationCenterVC: UIViewController {
    @IBOutlet weak var timePickerOut: UIDatePicker!
    
    @IBOutlet weak var switchBtnOut: UISwitch!
    @IBOutlet weak var DatelabelOut: UILabel!
    var datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        showDatePicker()
        switchBtnOut.isOn = false
    }
    @IBAction func NotificationSwitch(_ sender: Any) {
        
        if ((sender as AnyObject).isOn == true) {
            print("on")
            } else {
                print("off")
            }
        
    }
    func showDatePicker() {
//        let timepicker = UIDatePicker()
        timePickerOut.datePickerMode = .time
        timePickerOut.addTarget(self, action: #selector(timeChange(sender:)   ), for: UIControl.Event.valueChanged )
        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "hh:mm:ss"
        let string = formatter.string(from: time)
        print(string)
    }
   @objc func timeChange(sender:UIDatePicker){
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_gb")
    formatter.dateFormat = "hh:mm:ss"
    let string = formatter.string(from: sender.date)
    print(string)
   }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

