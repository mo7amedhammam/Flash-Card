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
    
    var cellsNumber = 5
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return cellsNumber
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVCell") as! HeaderTVCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfieTVCell") as! ProfieTVCell
           
            cell.didDelete = {
                [weak self] in
                          guard let self = self else { return }

            let alert = UIAlertController(title: "", message: "What Would you Like To Do ?", preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Edit Post" , style: .default, handler: { [self] (action) in
                // action Here
                self.simpleErrorAlert(errorTilte: "Success Edit", errorBody: "", buttonTitle: "OK")
                //            self.determineMyCurrentLocation()
            }))

                alert.addAction(UIAlertAction(title: "Delete Post", style: .destructive, handler: { [self] (action) in
                // action Here
//                self.posttextarray.remove(at: indexPath.row)
                    let alert1 = UIAlertController(title: "", message: "Are You Sure To Delete?", preferredStyle: .alert)
                    alert1.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [self] (action) in
                self.cellsNumber -= 1
                self.ProfileTVOutlet.deleteRows(at: [indexPath], with: .fade)
                self.ProfileTVOutlet.reloadData()
                    
                    
                    }))

                    alert1.addAction(UIAlertAction(title: "Cacel", style: .cancel, handler: { [self] (action) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert1, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
    //          cancel Button with cancel style
            }))
            self.present(alert, animated: true, completion: nil)
            }
            
            cell.didStar = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
                // vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
            return cell
            
        }
        
    }
}


