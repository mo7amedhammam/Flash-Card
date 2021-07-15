//
//  AllPeopleVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 06/04/2021.
//

import UIKit
import PKHUD


class AllCardsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var postData : [Data]?
    var cellsNumber = 5
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData?.count ?? 0 + 1
        //        return posttextarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllCardsTVCell0") as! AllCardsTVCell
            //setCardView(view: cell.StatusorImageV)
            cell.delegate = self
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllCardsTVCell") as! AllCardsTVCell
            cell.cellMainLabel.text = "\(postData?[indexPath.row-1].user?.fName ?? "")+\(postData?[indexPath.row-1].user?.lName ?? "")"
            cell.TimeLabel.text = postData?[indexPath.row-1].created_at
            
            
            
            
            
            //        cell.backgroundColor = .purple
            //        cell.cellLAble.textColor = .lightText
            //            cell.PostLa.text = "\(posttextarray[indexPath.row])"
            
            //            cell.delegate = self
            //---------- Delete and Edit ------------
            
            //            cell.didDelete = {
            //                [weak self] in
            //                          guard let self = self else { return }
            //
            //            let alert = UIAlertController(title: "", message: "What Would you Like To Do ?", preferredStyle: .actionSheet)
            //
            //            alert.addAction(UIAlertAction(title: "Edit Post" , style: .default, handler: { [self] (action) in
            //                // action Here
            //                self.simpleErrorAlert(errorTilte: "Success Edit", errorBody: "", buttonTitle: "OK")
            //                //            self.determineMyCurrentLocation()
            //            }))
            //
            //                alert.addAction(UIAlertAction(title: "Delete Post", style: .destructive, handler: { [self] (action) in
            //                // action Here
            ////                self.posttextarray.remove(at: indexPath.row)
            //                    let alert1 = UIAlertController(title: "", message: "Are You Sure To Delete?", preferredStyle: .alert)
            //                    alert1.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [self] (action) in
            //                self.cellsNumber -= 1
            //                self.allCardsTVOutlet.deleteRows(at: [indexPath], with: .fade)
            //                self.allCardsTVOutlet.reloadData()
            //                    }))
            //
            //                    alert1.addAction(UIAlertAction(title: "Cacel", style: .cancel, handler: { [self] (action) in
            //                        self.dismiss(animated: true, completion: nil)
            //                    }))
            //                    self.present(alert1, animated: true, completion: nil)
            //            }))
            //            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            //    //          cancel Button with cancel style
            //            }))
            //            self.present(alert, animated: true, completion: nil)
            //            }
            
            cell.didStar = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
                // vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
            return cell
        }
        
    }
    
    //    // Override to support editing the table view.
    //         func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    //        {
    //            if editingStyle == .delete {
    //                // Delete the row from the data source
    //                // posttextarray.remove(at: indexPath.row)
    //                // Then, delete the row from the table itself
    //                tableView.deleteRows(at: [indexPath], with: .fade)
    //            }
    //        }
    //
    
    
    @IBOutlet weak var allCardsTVOutlet: UITableView!
    var logedIn = 0
    
    var refreshcontrol:UIRefreshControl!
    func addRefreshControl() {
        refreshcontrol = UIRefreshControl()
        refreshcontrol.tintColor = .red
        refreshcontrol.addTarget(self, action: #selector(refreshingfunction), for: .valueChanged)
        allCardsTVOutlet.addSubview(refreshcontrol)
    }
    @objc func refreshingfunction()  {
        getPosts(type: "refresh")
//        chekNetworkThenReloadData()
        
//        refreshcontrol.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "All Cards"
        allCardsTVOutlet.dataSource = self
        allCardsTVOutlet.delegate = self
        chekNetworkThenReloadData()
        addRefreshControl()
        getPosts(type: "loadData")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPosts(type: "loadData")
    }
    
    func chekNetworkThenReloadData() {
        if Reachable.isConnectedToNetwork(){
            //good Connection data looks Good -> Load it
            allCardsTVOutlet.reloadData()
            
            // good connection but no data -> Server Error
            if cellsNumber == 0{
                //            if posttextarray.count == 0{
                serverErrorAlert(controller: self)
            }
        }else{
            //   -> Network ConncetionError
            connectionErrorAlert(controller: self)
            showAlert(message: "Please Check your Internet Connection", title: "Network Error", buttonTitle: "OK")
        }
        
    }
    
    
    // -----------------------------------------------------
    // -----------------------------------------------------
    
    func getPosts(type : String){
        if type == "refresh"{
            self.refreshcontrol.beginRefreshing()
            postData?.removeAll()
        }else{
            HUD.show(.progress)
        }
        API.getPosts(lang: "en") { result,err  in
            if result?.data != nil && result?.data?.isEmpty == false {
                if let postsArr = result?.data {
                    self.postData = postsArr
                    print(self.postData ?? [])
                    self.allCardsTVOutlet.reloadData()
                        if type == "refresh"{
                            self.refreshcontrol.endRefreshing()
                        }
                    HUD.hide()
                }
            }
        }
    }
    
    
    
    
}


extension AllCardsVC:tableviewCellDelegate{
    
    func SelectFavouriteCategory(with title1: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
        // vc.modalPresentationStyle = .fullScreen
        //        if firstTimeForStar.clicked1 == 1 {
        
        self.present(vc, animated: true, completion: nil)
        
        //        }else if firstTimeForStar.isSelected == true {
        //        }
        
    }
    
    func creatNewCard(with title: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreatNewCardVC") as! CreatNewCardVC
        // vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
}
