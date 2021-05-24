//
//  ShareAppVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 11/04/2021.
//

import UIKit

class ShareAppVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
