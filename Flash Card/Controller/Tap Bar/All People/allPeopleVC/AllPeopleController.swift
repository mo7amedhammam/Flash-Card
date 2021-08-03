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
    var ArrUser = [ModelAllUser]()
    
    
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
        
        getData ()
        
        
    }
    
    
    func registerCells(){
        allPeopleTVOutlet.registerCellNib(cellClass: AllPeopleCell.self)
        //        sliderCollectionViewOutlet.registerCell(cellClass: HomeSlider.self ) //Extension handles sThis
        //        tableViewOutlet.registerCellNib(cellClass: HomeTableViewCell.self) //Extension handles sThis
    }
    
    
    func tableSetup(){
        allPeopleTVOutlet.delegate   = self
        allPeopleTVOutlet.dataSource = self
    }
    
    func getData () {
        self.indicator?.start()
        if Reachable.isConnectedToNetwork() {
            API.S_GetAllPosts { [self] (error : Error?, info : [ModelAllUser]?, message : String?) in
                
                if error == nil && info != nil {
                    if info!.isEmpty {
                        self.AlertShowMessage(controller: self, text: "No Content", status: 1)
                        self.indicator?.stop()
                    } else {
                        for data in info! {
                            ArrUser.append(data)
                        }
                        allPeopleTVOutlet.reloadData()
                        self.indicator?.stop()
                    }
                    
                } else if error == nil && info != nil {
                    self.AlertShowMessage(controller: self, text: message!, status: 1)
                    self.indicator?.stop()
                    
                } else {
                    self.AlertServerError(controller: self)
                    self.indicator?.stop()
                }
            }
            
        } else {
            self.AlertInternet(controller: self)
            self.indicator?.stop()
        }
        
        
        
    }
    
}


extension AllPeopleController :  UITableViewDelegate, UITableViewDataSource , FollowProtocoalAllPeople {
    
    
    func Follow(index: Int, Button: UIButton) {
      
        self.indicator?.start()
        if Reachable.isConnectedToNetwork() {
            API.S_Follow(profile_id: Int(ArrUser[index].id)!) { (error : Error?, success : Bool?, message : String?) in
                
                if success == true {
                    self.ArrUser.remove(at: index)
                    self.indicator?.stop()
                    self.allPeopleTVOutlet.reloadData()
                    Toast.show(message: "Success Follow ", controller: self)
                } else if  success == false {
                    self.showAlert(message: message!)
                    self.indicator?.stop()
                } else {
                    self.AlertServerError(controller: self)
                    self.indicator?.stop()
                    
                }
            }
        } else {
            self.AlertInternet(controller: self)
            self.indicator?.stop()
        }
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllPeopleCell") as! AllPeopleCell
        
        cell.delegate = self
        cell.index = indexPath.row
        cell.LaName.text = "\(ArrUser[indexPath.row].fName) \(ArrUser[indexPath.row].lName)"
        cell.LaJob.text  = ArrUser[indexPath.row].user_type
        
        if ArrUser[indexPath.row].profile_img.isEmpty == true  {
            cell.IVPerson.image = #imageLiteral(resourceName: "bluelogo")
        } else {
            Helper.SetImage(EndPoint: ArrUser[indexPath.row].profile_img , image: cell.IVPerson, name: "person.fill", status: 0)
        }
        
        print("image :::::::: \(ArrUser[indexPath.row].profile_img )")
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}
