//
//  NotificationsVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 06/05/2021.
//

import UIKit

class NotificationsVC: UIViewController {
    
    @IBOutlet weak var notificationsTVOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewSetup()
        self.navigationItem.title = "Notifications"

        
    }
    
    func tableviewSetup() {
        notificationsTVOutlet.dataSource = self
        notificationsTVOutlet.delegate = self
        notificationsTVOutlet.registerCellNib(cellClass: NotificationCell.self)
    }
    
 


    
}

extension NotificationsVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SegueNotiToCard", sender: self)
    }
    
    
    
    
}

