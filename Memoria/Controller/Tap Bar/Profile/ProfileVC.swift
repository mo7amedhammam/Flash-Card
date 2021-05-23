//
//  ProfileVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    @IBOutlet weak var ProfileTVOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewSetup()
        self.navigationItem.title = "Profile"

    }
    
    func tableviewSetup() {
        ProfileTVOutlet.dataSource = self
        ProfileTVOutlet.delegate = self
        ProfileTVOutlet.registerCellNib(cellClass: ProfieTVCell.self)
        ProfileTVOutlet.registerCellNib(cellClass: HeaderTVCell.self)
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return 10
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
       let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVCell") as! HeaderTVCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfieTVCell") as! ProfieTVCell
            return cell

            }
        
    }
    
    
    

}
