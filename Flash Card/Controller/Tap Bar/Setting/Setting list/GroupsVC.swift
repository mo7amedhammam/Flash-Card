//
//  GroupsVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 14/04/2021.
//

import UIKit

class GroupsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    @IBOutlet weak var GroupsTVOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
 GroupsTableSetup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreatGroupBtn(_ sender: Any) {
     move(id: "CreatGroupVC")
    }
    func move(id: String ){
        let vc = (storyboard?.instantiateViewController(withIdentifier: id)) as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func BackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        return cell
    }
    
    func GroupsTableSetup(){
        GroupsTVOutlet.dataSource = self
        GroupsTVOutlet.delegate = self
        GroupsTVOutlet.registerCellNib(cellClass: GroupCell.self)
        
    }
    
    

}
