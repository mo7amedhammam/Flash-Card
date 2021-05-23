//
//  FavouritesCarsdVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 09/05/2021.
//

import UIKit

class NotificationCardsVC: UIViewController {
    
    @IBOutlet weak var notificationsCardCVOutlet: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSetup()
        self.navigationController?.navigationItem.title = "Notifications"
    }
    
    
    func collectionViewSetup() {
        notificationsCardCVOutlet.dataSource = self
        notificationsCardCVOutlet.delegate = self
        notificationsCardCVOutlet.registerCell(cellClass: notificationCardCVcell.self)
    }
    
    
    @IBOutlet weak var emptyLabel: UILabel!
    var collectionviewcellnumbers = 5
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"empty notification")
        iv.contentMode = .center
        //        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    
    @IBAction func tapGest(_ sender: UIPanGestureRecognizer) {
        
        
        let card = sender.view
        let transition = sender.translation(in: self.view)
        
        //        let cardYanchor = card.center.y - view.center.y
        //        card.center = CGPoint(x: view.frame.minX + transition.x ,y : view.frame.minY + transition.y)
        //
        //        if yFromCenter > 0 {
        //            print("UP")
        //        }else{
        //            print("Down")
        //        }
        if sender.state == UIGestureRecognizer.State.began{
            print("began")
        }else if sender.state == UIGestureRecognizer.State.changed{
            //            print("changed")
            card?.transform = CGAffineTransform(translationX: transition.x, y: 0)
        }else if sender.state == UIGestureRecognizer.State.ended{
            // back to center
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                card?.transform = .identity
            }, completion: nil)
            print("ended")
            
            
            
            //            if (card?.center.x)! < 75 {
            ////                print("moved left")
            //                UIView.animate(withDuration: 0.3, animations: {
            //                    card?.center = CGPoint(x: (card?.center.x)!-200, y: (card?.center.y)!)
            //                })
            //            } else if (card?.center.x)! > (view.frame.width - 75){
            ////                print("moved left")
            //                card?.center = CGPoint(x: (card?.center.x)!+200, y: (card?.center.y)!)
            //
            //            }
            
        }
    }
    
}


extension NotificationCardsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionviewcellnumbers == 0){
            //            collectionView.setEmptyMessage("Nothing to show :(")
            //            collectionView.backgroundColor = .red
            collectionView.backgroundView = imageView
            emptyLabel.isHidden = false
            
        } else {
            //             collectionView.restore()
            emptyLabel.isHidden = true
        }
        return collectionviewcellnumbers
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "notificationCardCVcell", for: indexPath) as! notificationCardCVcell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  notificationsCardCVOutlet.bounds.size    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



//extension UICollectionView {
//
//    func setEmptyMessage(_ message: String) {
//
//        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
//        messageLabel.text = message
//        messageLabel.textColor = .black
//        messageLabel.numberOfLines = 0;
//        messageLabel.textAlignment = .center;
//        messageLabel.font = UIFont(name: "TrebuchetMS", size: 32)
//        messageLabel.sizeToFit()
//
//        self.backgroundView = messageLabel;
//    }
//
//    func restore() {
//        self.backgroundView = nil
//    }
//}
