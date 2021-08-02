//
//  AllPeopleController.swift
//  Memoria
//
//  Created by Muhamed Hammam on 07/04/2021.
//

import UIKit

class AllPeopleController: UIViewController {
 

    @IBOutlet weak var allPeopleTVOutlet: UITableView!
    
    var indicator:ProgressIndicator?


    override func viewDidLoad() {
        super.viewDidLoad()

        
        // indicator hud ----------------//
            //    var indicator:ProgressIndicator?
        indicator = ProgressIndicator(inview:self.view,loadingViewColor: UIColor.lightGray, indicatorColor: #colorLiteral(red: 0.07058823529, green: 0.3568627451, blue: 0.6352941176, alpha: 1) , msg:  SalmanLocalize.textLocalize(key: "LPleaseWait") )
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        //  end indicator hud ----------------//
        
        tableSetup()
        registerCells()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "All People"

    }

    
    func registerCells(){
        allPeopleTVOutlet.registerCellNib(cellClass: AllPeopleCell.self)
//        sliderCollectionViewOutlet.registerCell(cellClass: HomeSlider.self ) //Extension handles sThis
//        tableViewOutlet.registerCellNib(cellClass: HomeTableViewCell.self) //Extension handles sThis
    }
    
    
    func tableSetup(){
        allPeopleTVOutlet.delegate = self
        allPeopleTVOutlet.dataSource = self
    }
    
    func getData () {
    
        if Reachable.isConnectedToNetwork() {
            API.S_GetAllPosts { (error : Error?, info : [ModelAllUser]?, message : String?) in
                
                if error == nil && info != nil {
                    
                } else if error == nil && info != nil {
                
                } else {
                }
                
                
            }
            
        } else {
        }
    
    
    
    }

}


extension AllPeopleController :  UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllPeopleCell") as! AllPeopleCell
        
        
      return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
}
