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
            setRoundedView(roundedView: cell.headerImage)
            //            setCardView(view: cell.StatusorImageV)
            cell.delegate = self
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllCardsTVCell") as! AllCardsTVCell
            //            setRoundedView(roundedView: cell.cellImage)
            cell.PostImage.cornerRadius = 5
            
            setCardView(view: cell.contentView)
            
            
            //        cell.backgroundColor = .purple
            //        cell.cellLAble.textColor = .lightText
            //        cell.cellLAble.text = "name is: \(self.darshArray[indexPath.row])"
            
            return cell
        }
    }
    
    
    
    
    func setRoundedView (roundedView:UIView) {
        let saveCenter = roundedView.center
        let newFrame:CGRect = CGRect(origin: CGPoint(x: roundedView.frame.origin.x,y :roundedView.frame.origin.y), size: CGSize(width: roundedView.frame.size.width, height: roundedView.frame.size.height))
        roundedView.layer.cornerRadius = roundedView.frame.height/2
        roundedView.frame = newFrame;
        roundedView.center = saveCenter
        roundedView.clipsToBounds = true
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

func setCardView(view : UIView){
    
    view.layer.masksToBounds = false
    view.layer.shadowOffset = CGSize(width: 0, height: 0);
    view.layer.cornerRadius = 1;
    view.layer.shadowRadius = 1;
    view.layer.shadowOpacity = 1;
    
}

extension AllCardsVC:tableviewCellDelegate{
    func creatNewCard(with title: String) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "CreatNewCardVC") as! CreatNewCardVC
        
        //                vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
    }
    
    
}
