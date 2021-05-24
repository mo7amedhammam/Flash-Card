//
//  innerGroupVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 18/04/2021.
//

import UIKit

class innerGroupVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var innerTVOut: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableviewSetup()
    }
    
    func tableviewSetup() {
        innerTVOut.dataSource = self
        innerTVOut.delegate = self
        innerTVOut.registerCellNib(cellClass: InnerGroupHeader.self)
        innerTVOut.registerCellNib(cellClass: InnerGroupCell.self)
    }
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return 10
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
       let cell = tableView.dequeueReusableCell(withIdentifier: "InnerGroupHeader") as! InnerGroupHeader
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InnerGroupCell") as! InnerGroupCell
            return cell

            }
        
    }
    
    
    

}
