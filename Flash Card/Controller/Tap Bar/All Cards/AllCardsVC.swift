//
//  AllPeopleVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 06/04/2021.
//

import UIKit

class AllCardsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllCardsTVCell0") as! AllCardsTVCell
            //setCardView(view: cell.StatusorImageV)
            cell.delegate = self
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllCardsTVCell") as! AllCardsTVCell
            //        cell.backgroundColor = .purple
            //        cell.cellLAble.textColor = .lightText
            //        cell.cellLAble.text = "name is: \(self.darshArray[indexPath.row])"
            cell.delegate = self
            return cell
        }
    }
    
    
    
    @IBOutlet weak var TVallCards: UITableView!
    var logedIn = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        // Do any additional setup after loading the view.
        TVallCards.dataSource = self
        TVallCards.delegate = self
        self.navigationItem.title = "All Cards"
        
    }
}


extension AllCardsVC:tableviewCellDelegate{
    func SelectFavouriteCategory(with title1: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
        // vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func creatNewCard(with title: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreatNewCardVC") as! CreatNewCardVC
        // vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
