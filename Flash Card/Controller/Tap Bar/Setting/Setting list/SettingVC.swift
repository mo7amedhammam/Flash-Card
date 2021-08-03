//
//  SettingVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit
import Foundation

class SettingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var SettingTVOutlet: UITableView!
    
    
    var indicator:ProgressIndicator?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // indicator hud ----------------//
        //    var indicator:ProgressIndicator?
        indicator = ProgressIndicator(inview:self.view,loadingViewColor: UIColor.lightGray, indicatorColor: #colorLiteral(red: 0.07058823529, green: 0.3568627451, blue: 0.6352941176, alpha: 1) , msg:  SalmanLocalize.textLocalize(key: "LPleaseWait") )
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        //  end indicator hud ----------------//
        
        
        tableviewSetup()
        self.navigationItem.title = "Settings"
    }
    
    var settingLabelNames = ["Groups","Edit Profile","Notification Center","Statistics","Contact Us","About Us","Share App","Rate App","Language","Sign Out"]
    
    var logoImage: [UIImage] = [
        UIImage(systemName: "person.3.fill")!,
        UIImage(systemName: "square.and.pencil")!,
        UIImage(systemName: "bell.fill")!,
        UIImage(systemName: "chart.bar.xaxis")!,
        UIImage(systemName: "phone.fill")!,
        UIImage(systemName: "exclamationmark.circle.fill")!,
        UIImage(systemName: "arrowshape.turn.up.right.fill")!,
        UIImage(systemName: "star.fill")!,
        UIImage(systemName: "arrow.left.square.fill")!,
        UIImage(systemName: "arrow.left.square.fill")!
    ]
    var vcontrollers:[Any] = [GroupsVC(),EditProfileVC(),NotificationCenterVC(),StatisticsVC(),ContactUsVC(),AboutUsVC(),ShareAppVC(),RateAppVC(),SignOutVC()]
    
    func tableviewSetup() {
        SettingTVOutlet.dataSource = self
        SettingTVOutlet.delegate = self
        SettingTVOutlet.registerCellNib(cellClass: SettingTVCell.self)
        
    }
    
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return settingLabelNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTVCell") as! SettingTVCell
        cell.settingCellLable.text = settingLabelNames[indexPath.row]
        cell.SettingCellImage.image = logoImage[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        move(id: settingLabelNames[indexPath.row])
    }
    
    
    func move(id: String ){
        if id == "Sign Out"{
            actionSheet()
        }
        else{
            let vc = (storyboard?.instantiateViewController(withIdentifier: id))!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func actionSheet(){
        
        // 1
        let actionMenue = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        // 2
        let signOutAction = UIAlertAction(title: "Sign Out", style: .default) { (UIAlertAction) in
            
            print(Helper.gettoken())   // ok
            self.logutAction()
        }
//        let saveAction = UIAlertAction(title: "Save", style: .default)
        
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // 4
        actionMenue.addAction(signOutAction)
//        actionMenue.addAction(saveAction)
        actionMenue.addAction(cancelAction)
        
        // 5
        self.present(actionMenue, animated: true, completion: nil)

    }
    
    func logutAction()  {

        
        self.indicator?.start()
        if Reachable.isConnectedToNetwork() {
            API.S_LogOut { (error : Error?, success : Bool?, message : String?) in
              
                if error == nil && success == true {
                    
                    Helper.logout()
                    let vc = self.storyboard?.instantiateViewController(identifier: "Login") as! Login
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.indicator?.stop()
                    
                } else if error == nil && success == false {
                    self.AlertShowMessage(controller: self, text: message!, status: 1)
                    self.indicator?.stop()

                } else {
                    self.showAlert(message: "Server Error ")
                    self.indicator?.stop()

                }
                
            }
        } else {
            self.showAlert(message: "No Internet Connections")
            self.indicator?.stop()
        }
        
    }
    
    
}
