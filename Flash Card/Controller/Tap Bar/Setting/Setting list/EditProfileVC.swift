//
//  EditProfileVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 11/04/2021.
//

import UIKit

class EditProfileVC: UIViewController {
    
    
    @IBOutlet weak var nameLabelOut: UILabel!
    @IBOutlet weak var emailtfOut: UITextField!
    @IBOutlet weak var PhoneTfOut: UITextField!
    @IBOutlet weak var universitytfOut: UITextField!
    @IBOutlet weak var roleTfOut: UITextField!
    @IBOutlet weak var passwordTfOut: UITextField!
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    var imageindex = 0
    @IBAction func coveImageBtnPressed(_ sender: Any) {
        showPhotoMenu()
        imageindex = 0
//        coverImage.image = image
    }
    
    @IBAction func profileImageBtnPressed(_ sender: Any) {
        showPhotoMenu()
        imageindex = 1
        
    }
    
    // Pass Image To Your ImageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else { return }
        if imageindex == 0 {
            coverImage.image = image
        } else {
            profileImage.image = image
        }
    }
    
    
    var tag:Int!
    @IBAction func editBtnPressed(_ sender: UIButton) {
        
        self.showPopUp(pop: popupViewOut)
        switch sender.tag {
        case 0:
            nameLabelOut.text = "Edit Name"
            popUpTextFeild.placeholder = "mohamed Hammam"
            break
        case 1:
            popUpLabel.text = "Edit Profile"
            popUpTextFeild.placeholder = "mohamed.hammam.pro@gmail.com"
            break
        case 2:
            popUpLabel.text  = "Edit Mobile Number"
            popUpTextFeild.placeholder = "01101201322"
            break
            
        case 3:
            popUpLabel.text  = "Edit University"
            popUpTextFeild.placeholder = "Menofia University"
            break
            
        case 4:
            popUpLabel.text = "Edit Role"
            popUpTextFeild.placeholder = "Student"
            break
            
        case 5:
            popUpLabel.text = "Edit Password"
            popUpTextFeild.placeholder = "New Password"
            break
            
        default:
            popUpLabel.text = "Edit Label"
            popUpTextFeild.placeholder = "Enter New Value"
        }
        tag = sender.tag
        popUpTextFeild.text = ""
        
        
    }
    
    @IBOutlet var popupViewOut: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var popUpTextFeild: UITextField!
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        let newtext = popUpTextFeild.text!
        self.setNewValue(receiverTag: tag, value: newtext)
        self.hidePopUp(pop: popupViewOut)
        
    }
    
    func setNewValue(receiverTag : Int , value : String ){
        //        print(value)
        switch receiverTag {
        case 0:
            //            x = 15
            nameLabelOut.text = value
            break
        case 1:
            //            x = 15
            emailtfOut.text = value
            break
        case 2:
            PhoneTfOut.text = value
            break
        case 3:
            universitytfOut.text = value
            break
        case 4:
            roleTfOut.text = value
            break
        case 5:
            passwordTfOut.text = value
            break
        default:
            print("default")
        }
        //        print(x)
    }
    
    
    func showPopUp(pop:UIView) {
        self.view.addSubview(pop)
        pop.center    = self.view.center
        pop.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        pop.alpha     = 0
        UIView.animate(withDuration: 0.4) {
            pop.alpha     = 1
            pop.transform = CGAffineTransform.identity
        }
    }
    @IBAction func cancelPopUp(_ sender: Any) {
        self.hidePopUp(pop: popupViewOut)
    }
    
    func hidePopUp (pop : UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            pop.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            pop.alpha     = 0
        }) { (success:Bool) in
            pop.removeFromSuperview()
        }
    }
    
}



//*************  move to another view passing data
//
//        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "gotoeditpopup") as! goToEditProfilePopUp
//        vc.modalPresentationStyle = .popover
//        self.present(vc, animated: true, completion: nil)


//*************  dismiss presented view
//        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "Edit Profile") as! EditProfileVC
//        self.dismiss(animated: true, completion: nil)


