//
//  FavouritesVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 02/05/2021.
//

import UIKit

class FavouritesVC: UIViewController {
    

    
    @IBOutlet weak var collectionViewOut: UICollectionView!

    
    let favouriteCellObject = favouriteCell()
    var clicked = true
    var post_id = 0 
    var indicator:ProgressIndicator?
    var ArrFav    = [ModelAllFavourit]()
    var ArrSubFav = [ModelSubFavourit]()

    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // indicator hud ----------------//
        //    var indicator:ProgressIndicator?
        indicator = ProgressIndicator(inview:self.view,loadingViewColor: UIColor.lightGray, indicatorColor: #colorLiteral(red: 0.07058823529, green: 0.3568627451, blue: 0.6352941176, alpha: 1) , msg:  SalmanLocalize.textLocalize(key: "LPleaseWait") )
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        //  end indicator hud ----------------//
        
        
        collectionViewOut.delegate   = self
        collectionViewOut.dataSource = self
        
    }
    
    
    func getAllFavourit() {
        
        
        self.indicator?.start()
        if Reachable.isConnectedToNetwork() {
            API.S_GetAllFavourit { (error : Error?, info : [ModelAllFavourit]?, message : String?) in
        
                if error == nil && info != nil {
                    
                    if info!.isEmpty {
                        self.AlertShowMessage(controller: self, text: "No Content", status: 1)
                        self.indicator?.stop()
                    } else {
                        for data in info! {
                            ArrFav.append(contentsOf: data)
                            ArrSubFav.append(data.subcategories)
                        }
                        self.indicator?.stop()
                        collectionViewOut.reloadData()
                    }
                    
                } else if error == nil && info == nil {
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
  
    
    @IBAction func aditBtn(_ sender: Any) {
        clicked =  !clicked
        collectionViewOut.reloadData()
    
    }
  
    
    func AddNewFavouriteList(){
        let alert = UIAlertController(title: "Name Your List", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { TitleTF in
            TitleTF.placeholder = "Enter name..."
            TitleTF.textAlignment = .center
        })
        
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [self] (action) in
            let listTitle = alert.textFields?.first?.text
            self.FavListArr.append(listTitle!)
            self.collectionViewOut.reloadData()
            print(listTitle!)
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

// collectionView in 2 collumns
extension FavouritesVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionViewOut.frame.size.width - space) / 2.0
        return CGSize(width: size , height: 200)
    }
    
}


extension FavouritesVC :  UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
//    // delete cell in collection
//
//         func DeleteFavourite(value: String) {
//        for data in self.FavListArr {
//            if data == value {
//                self.FavListArr = self.FavListArr.filter{$0 != data}
//                self.collectionViewOut.reloadData()
//            }
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrFav.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            AddNewFavouriteList()
        } else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionViewOut.dequeueReusableCell(withReuseIdentifier: "favouritesPlusCell", for: indexPath) as! favouritesPlusCell
        let cell = collectionViewOut.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as! favouriteCell
        cell.delBtnOut.isHidden = clicked
        
        if indexPath.row == 0 {
            return cell0
        } else {
//            cell.delegate = self
            cell.FavNameLA.text = ArrFav[indexPath.row - 1 ].name

            
            
            
            return cell
            
        }
    }
    
    
    
}
