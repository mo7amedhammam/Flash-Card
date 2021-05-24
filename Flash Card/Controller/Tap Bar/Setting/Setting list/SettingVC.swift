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
        let vc = (storyboard?.instantiateViewController(withIdentifier: id)) as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
