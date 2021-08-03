//
//  ProfileVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 08/04/2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var ProfileTVOutlet: UITableView!
    var indicator:ProgressIndicator?
    
    
    var ArrPost = [ModelPosts]()
    var isFlipped = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // indicator hud ----------------//
        //    var indicator:ProgressIndicator?
        indicator = ProgressIndicator(inview:self.view,loadingViewColor: UIColor.lightGray, indicatorColor: #colorLiteral(red: 0.07058823529, green: 0.3568627451, blue: 0.6352941176, alpha: 1) , msg:  SalmanLocalize.textLocalize(key: "LPleaseWait") )
        indicator?.center = self.view.center
        self.view.addSubview(indicator!)
        //  end indicator hud ----------------//
        
        
        tableviewSetup()
        self.navigationItem.title = "Profile"
        getData ()
        
    }
    
    func tableviewSetup() {
        ProfileTVOutlet.dataSource = self
        ProfileTVOutlet.delegate = self
        ProfileTVOutlet.registerCellNib(cellClass: ProfieTVCell.self)
        ProfileTVOutlet.registerCellNib(cellClass: HeaderTVCell.self)
    }
    
    func getData () {
        
        self.indicator?.start()
        if Reachable.isConnectedToNetwork() {
            API.S_GetProfile { [self] (error :Error?, info :[ModelShowProfile]?, message : String?) in
                
                if error == nil && info != nil {
                    
                    if info!.isEmpty {
                        self.AlertShowMessage(controller: self, text: "No Content", status: 1)
                        self.indicator?.stop()
                    } else {
                        for data in info! {
                            ArrPost.append(contentsOf: data.posts)
                        }
                        self.indicator?.stop()
                        ProfileTVOutlet.reloadData()
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
    
    
    
    
}



extension ProfileVC : UITableViewDataSource, UITableViewDelegate , ProtocoalProfileButtons {
    
    func Flip(index: Int, view: UIView, lable: UILabel, image: UIImageView) {
        if (!isFlipped){
            UIView.transition(with: view, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            if ArrPost[index].back_img.isEmpty == true {
                image.image = #imageLiteral(resourceName: "bluelogo")
            } else {
                Helper.SetImage(EndPoint: ArrPost[index].back_img, image: image, name: "person.fill", status: 0)
            }
            lable.text = ArrPost[index].back_text
            isFlipped = true
        } else {
            UIView.transition(with: view, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)
            if ArrPost[index].front_img.isEmpty == true {
                image.image = #imageLiteral(resourceName: "bluelogo")
            } else {
                Helper.SetImage(EndPoint: ArrPost[index].front_img, image: image, name: "person.fill", status: 0)
            }
            lable.text = ArrPost[index].front_text
            isFlipped = false
        }
    }
    
    
    func More(index: Int) {
        
        
        let optionMenu = UIAlertController(title: nil, message: nil , preferredStyle: .actionSheet)
        
        
        let UpdateAction = UIAlertAction(title: "Update", style: .default, handler:
                                            { [self]
                                                (alert: UIAlertAction!) -> Void in
                                                // action
                                                //                                                TVeditComment.text = postArray[index - 1].text
                                                //
                                                //                                                if postArray[index].Image == "" {
                                                //                                                    BtnCancelComment.isHidden = true
                                                //                                                    IVEditComment.isHidden = true
                                                //                                                    HSuperComment.constant = 320
                                                //                                                    HVEComment.constant = 50
                                                //                                                } else {
                                                //                                                    BtnCancelComment.isHidden = false
                                                //                                                    IVEditComment.isHidden = false
                                                //                                                    HSuperComment.constant = 390
                                                //                                                    HVEComment.constant = 120
                                                //                                                    Helper.SetImage(EndPoint: postArray[index - 1].Image, image: IVEditComment, name: "2", status: 1)
                                                //                                                }
                                                //                                                ViewEditComment.isHidden = false
                                                //                                                EditId   = postArray[index - 1].Id
                                                //
                                                //                                                print(":::::::::::::::::::::::: \(EditId)")
                                                
                                                
                                            })
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler:
                                            { [self]
                                                (alert: UIAlertAction!) -> Void in
                                                // action
                                                //                                                if Helper.getId() == String(postArray[index - 1].UserId) {
                                                //
                                                //                                                    let alert2 = UIAlertController(title: "" , message: "Are You Sure To Delete ?", preferredStyle: .alert)
                                                //
                                                //                                                    alert2.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [self] (action) in
                                                //                                                        //                self.cellsNum -= 1
                                                //                                                        API.deletePost(Id: self.postArray[index - 1 ].Id) { [self] (error : Error?, status : Int, message : String?) in
                                                //                                                            if Reachable.isConnectedToNetwork(){
                                                //                                                                if error == nil && status == 0  {
                                                //                                                                    self.postArray.remove(at: index - 1 )
                                                //                                                                    self.AllPostsTV.reloadData()
                                                //                                                                } else if error == nil && status == -1 {
                                                //                                                                    self.showAlert(message: message!)
                                                //                                                                } else {
                                                //                                                                    self.AlertServerError(controller: self)
                                                //                                                                }
                                                //                                                            } else {
                                                //                                                                self.AlertInternet(controller: self)
                                                //                                                            }
                                                //                                                        }
                                                //                                                    })
                                                //                                                    )
                                                //                                                    alert2.addAction(UIAlertAction(title: "Cacel", style: .cancel, handler: { [self] (action) in
                                                //                                                        self.dismiss(animated: true, completion: nil)
                                                //
                                                //                                                    }))
                                                //                                                    self.present(alert2, animated: true, completion: nil)
                                                //
                                                //
                                                //                                                } else {
                                                //                                                    self.showAlert(message: "You Dont Have Any Authorize To Delete This Post")
                                                //                                                }
                                            })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
                                            {
                                                (alert: UIAlertAction!) -> Void in
                                                // action
                                                print("cancel")
                                                
                                            })
        
        
        optionMenu.addAction(UpdateAction)
        optionMenu.addAction(DeleteAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    func Star(index: Int, button: UIButton) {
        
        if ArrPost[index].in_favourites == 1 {
                      
            if Reachable.isConnectedToNetwork(){
                
                API.S_RemoveStar(post_id: Int(ArrPost[index].id)! ) { [self] (error : Error?, status : Bool?, message : String?) in
                    
                    if status == true {
                        for data in ArrPost {
                            if data.in_favourites == 1 {
                                data.in_favourites = 0
                                button.isSelected = false
                                ProfileTVOutlet.reloadData()

                            }
                        }
                        
                    } else if error == nil && status == false {
                        self.AlertShowMessage(controller: self, text: message!, status: 1)
                    }
                }
            } else {
                self.AlertInternet(controller: self)
            }
            
            
            
        } else {
            button.isSelected = true
            let id = ArrPost[index].id
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
            vc.post_id = Int(id)!
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    func Love(index: Int, button: UIButton , LCount : UILabel) {
        
        
        if Reachable.isConnectedToNetwork(){
            
            API.addOrRemovePostReact(PostId: Int(ArrPost[index].id)! ,  completion: { [self] (error : Error?, status : Bool?, message : String?) in
                if status == true {
                    
                    for data in ArrPost {
                        if data.id == ArrPost[index].id {
                            print(data.id)
                            
                            if data.user_liked == 1 {
                                button.isSelected = false
                                data.user_liked = 0
                                data.likes = data.likes - 1
                                LCount.text = "\(data.likes)"
                                //                                self.AllPostsTV.reloadRows(at: [index], with: .fade)
                                ProfileTVOutlet.reloadData()
                                
                            } else {
                                button.isSelected = true
                                data.user_liked = 1
                                data.likes = data.likes + 1
                                LCount.text = "\(data.likes)"
                                ProfileTVOutlet.reloadData()
                                
                                //                                self.AllPostsTV.reloadRows(at: [index], with: .fade)
                            }
                        }
                    }
                } else if error == nil && status == false {
                    self.AlertShowMessage(controller: self, text: message!, status: 1)
                }
            }
            )} else {
                self.AlertInternet(controller: self)
            }
        
        
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return ArrPost.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVCell") as! HeaderTVCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfieTVCell") as! ProfieTVCell
            
            cell.delegate = self
            cell.indexx = indexPath.row
            
            if ArrPost[indexPath.row].userprofile_img.isEmpty == true {
                cell.IVprofile.image = #imageLiteral(resourceName: "bluelogo")
            } else {
                Helper.SetImage(EndPoint: ArrPost[indexPath.row].userprofile_img, image: cell.IVprofile, name: "person.fill", status: 0)
            }
            cell.LaName.text  = "\(ArrPost[indexPath.row].userfName) \(ArrPost[indexPath.row].userlName)"
            cell.LaTime.text = ArrPost[indexPath.row].created_at
            
            
            
            
            Helper.SetImage(EndPoint: ArrPost[indexPath.row].front_img, image: cell.IVFront, name: "person.fill", status: 0)
            cell.LaFrontDesc.text = ArrPost[indexPath.row].front_text
            cell.LaNumLove.text  = "\(ArrPost[indexPath.row].likes)"

            
            if ArrPost[indexPath.row].user_liked == 0 {
                cell.BtnLove.isSelected = false
            } else {
                cell.BtnLove.isSelected = true
            }
            
            if ArrPost[indexPath.row].in_favourites == 0 {
                cell.BtnStar.isSelected = false
            } else {
                cell.BtnStar.isSelected = true
            }
        
            
            return cell
            
        }
        
    }
    
    
    
    
    
    
}
