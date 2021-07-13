//
//  SettingVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit
import Foundation
import PKHUD

class SettingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var SettingTVOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func getViewController<T>(_ viewControllerType: T.Type, with identifier: String) -> T where T: UIViewController {
            if #available(iOS 13.0, *) {
               let pushedVC = storyboard?.instantiateViewController(identifier: identifier) as! T
                navigationController?.pushViewController(pushedVC, animated: true)
                return pushedVC
            } else {
              let pushedVC = storyboard?.instantiateViewController(withIdentifier: identifier) as! T
                navigationController?.pushViewController(pushedVC, animated: true)
                return pushedVC
            }
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
        if Reachable.isConnectedToNetwork(){
        API.userLogOut() { (success, result, message) in
            if success {
                
                Helper.logout()
                _ = self.getViewController(Login.self, with: "Login")
//                Helper.GoToAnyScreen(storyboard: "Main", identifier: "Login")
//
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! Login
//                self.navigationController?.popToViewController(vc, animated: true)
                
//                self.navigationController?.popToRootViewController(animated: true)
            }else {
                HUD.flash(.label(result?.message), delay:  2.0)
                print(message!)
            }
        }
        
        }else{
            HUD.flash(.labeledError(title: "No Inernet Connection", subtitle: nil), delay: 2.0)

        }
    }
    
    
}
