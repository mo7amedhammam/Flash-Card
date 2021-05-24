//
//  FavouritesVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 02/05/2021.
//

import UIKit

class FavouritesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , favourtDelegate {
    
    //    let cellobject = favouriteCell()
    var toggleflag = 0
    let favouriteCellObject = favouriteCell()
    @IBAction func aditBtn(_ sender: Any) {
        favouriteCellObject.toggleDelBtn()
        collectionViewOut.reloadData()
        
    }
    
    func DeleteFavourite(value: String) {
        for data in self.FavListArr {
            if data == value {
                self.FavListArr = self.FavListArr.filter{$0 != data}
                self.collectionViewOut.reloadData()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionsetup()
    }
    
    
    // image picker in CollectionView
    @IBOutlet weak var collectionViewOut: UICollectionView!
    var FavListArr = ["Geo","comp"]
    
    func collectionsetup() {
        collectionViewOut.delegate = self
        collectionViewOut.dataSource = self
        collectionViewOut.isUserInteractionEnabled = true
        //        collectionViewOut.registerCell(cellClass: favouritesPlusCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FavListArr.count+1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            AddNewFavouriteList()
        } else{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell0 = collectionViewOut.dequeueReusableCell(withReuseIdentifier: "favouritesPlusCell", for: indexPath) as! favouritesPlusCell
        let cell = collectionViewOut.dequeueReusableCell(withReuseIdentifier: "favouriteCell", for: indexPath) as! favouriteCell
        
        if indexPath.row == 0 {
            return cell0
        } else {
            cell.delegate = self
            cell.FavNameLA.text = FavListArr[indexPath.row-1]
            cell.index = FavListArr[indexPath.row-1]
            
            return cell
            
        }
        //        return cell
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
