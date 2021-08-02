//
//  Helper.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 25/05/2021.
//

import UIKit
import SystemConfiguration
import MapKit
import Foundation
import Kingfisher


class Helper: NSObject {
    
        
    class func setUserData( id : String , user_type : String , fName : String ,lName : String , address : String , profile_img : String ,  cover_img : String , university : String , username : String , email : String , mobile : String , gender : String, joined_at : String , token : String , email_verified : Int , mobile_verified : Int , del_schedule : String , account_status : String ){
        let def = UserDefaults.standard
        
        def.setValue(id                    , forKey: "id")
        def.setValue(user_type             , forKey: "user_type")
        def.setValue(fName                 , forKey: "fName")
        def.setValue(lName                 , forKey: "lName")
        def.setValue(address               , forKey: "address")
        def.setValue(profile_img           , forKey: "profile_img")
        def.setValue(cover_img             , forKey: "cover_img")
        def.setValue(university            , forKey: "university")
        def.setValue(username              , forKey: "username")
        def.setValue(email                 , forKey: "email")
        def.setValue(mobile                , forKey: "mobile")
        def.setValue(gender                , forKey: "gender")
        def.setValue(joined_at             , forKey: "joined_at")
        def.setValue("Bearer " + token      , forKey: "token")
        def.setValue(email_verified        , forKey: "email_verified")
        def.setValue(mobile_verified       , forKey: "mobile_verified")
        def.setValue(del_schedule          , forKey: "del_schedule")
        def.setValue(account_status        , forKey: "account_status")
        
        def.synchronize()
        //        restartApp()
    }
    
    
    class func getid()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "id") as! String)
    }
    class func getuser_type() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "user_type") as! String)
    }
    class func getfName() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "fName") as! String)
    }
    class func getlName() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "lName") as! String)
    }
    class func getaddress() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "address") as! String)
    }
    class func getprofile_img() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "profile_img") as! String)
    }
    class func getcover_img() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "cover_img") as! String)
    }
    class func getuniversity() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "university") as! String)
    }
    class func getusername() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "username") as! String)
    }
    class func getemail() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "email") as! String)
    }
    class func getmobile() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "mobile") as! String)
    }
    class func getgender() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "gender") as! String)
    }
    class func getjoined_at() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "joined_at") as! String)
    }
    class func gettoken() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "token") as! String)
    }
    class func getemail_verified() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "email_verified") as! String)
    }
    class func getmobile_verified() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "mobile_verified") as! String)
    }
    class func getdel_schedule() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "del_schedule") as! String)
    }
    class func getaccount_status() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "account_status") as! String)
    }
    
    
    // check in scene delegate
    class func CheckDateExist()->Bool{
        let def = UserDefaults.standard
        return (def.object(forKey: "user_name") as? String) != nil
    }
    
    //save token
    class func settoken(token : String){
        let def = UserDefaults.standard
        def.setValue(token, forKey: "token")
        def.synchronize()
    }
    
    
    //save password
    class func setPassword(password : String){
        let def = UserDefaults.standard
        def.setValue(password, forKey: "password")
        def.synchronize()
    }
    
    
    class func getPassword()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "password") as! String)
    }
    
    //
    
//    //save image
//    class func setProfileImage(image : String){
//        let def = UserDefaults.standard
//        def.setValue(image, forKey: "profileImage")
//        def.synchronize()
//    }
//    
//    
//    class func getProfileImage() ->String {
//        let def = UserDefaults.standard
//        return (def.object(forKey: "profileImage") as! String)
//    }
    
    
    //
    
    class func logout() {
        let def = UserDefaults.standard
        def.removeObject( forKey: "id")
        def.removeObject( forKey: "user_type")
        def.removeObject( forKey: "fName")
        def.removeObject( forKey: "lName")
        def.removeObject( forKey: "address")
        def.removeObject( forKey: "profile_img")
        def.removeObject( forKey: "cover_img")
        def.removeObject( forKey: "university")
        def.removeObject( forKey: "username")
        def.removeObject( forKey: "email")
        def.removeObject( forKey: "mobile")
        def.removeObject( forKey: "gender")
        def.removeObject( forKey: "joined_at")
        def.removeObject( forKey: "token")
        def.removeObject( forKey: "email_verified")
        def.removeObject( forKey: "mobile_verified")
        def.removeObject( forKey: "del_schedule")
        def.removeObject( forKey: "account_status")


    }
    
    class func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    class func isValidPassword(passwordStr:String) -> Bool {
        let passwordRegEx = "(?=.{8,})"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: passwordStr)
    }
    
    class func dialNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
        }
    }
    
    
    class func SetImage (EndPoint : String? , image : UIImageView , name : String , status : Int) {
            // status == 0 system  else 1 named
            if EndPoint != nil || EndPoint == "" {
                let url = URL(string: URLs.BaseUrl + EndPoint!)
                image.kf.indicatorType = .activity
                    image.kf.setImage(with: url)
                } else {
                    if status == 0 {
                        image.image = UIImage(systemName: name)
                        
                    } else {
                        image.image = UIImage(named: name)
                        
                    }
                }
            }
    
    class func openWhatsapp(){
        let urlWhats = "whatsapp://send?phone=(+20 111 108 7446)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(whatsappURL)
                    }
                }
                else {
                    print("Install Whatsapp")
                }
            }
        }
    }
    
    
    
    class func GoToAnyScreen (storyboard : String , identifier : String) {
        guard let window = UIApplication.shared.keyWindow else{return}
        let storyboard = UIStoryboard(name: storyboard , bundle: nil)
        var vc:UIViewController
        vc = storyboard.instantiateViewController(withIdentifier: identifier )
        window.rootViewController = vc
    }
    
    class func PushToAnyScreen (TargetStoryboard : String , targetViewController : String) {
        let storyboard = UIStoryboard(name: TargetStoryboard , bundle: nil)
        var vc:UIViewController
        vc = storyboard.instantiateViewController(withIdentifier: targetViewController )
        let nav = UINavigationController()
        nav.pushViewController(vc, animated: true)
    }
    class func PopAnyScreen () {
      
        let nav = UINavigationController()
        nav.popViewController(animated: true)
    }
    class func PopAnyRootScreen () {
      
        let nav = UINavigationController()
        nav.popToRootViewController(animated: true)
    }
    
   
    
    
    class func retreiveCityName(lattitude: Double, longitude: Double, completionHandler: @escaping (String?) -> Void) {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(CLLocation(latitude: lattitude, longitude: longitude), completionHandler:
            {
                placeMarks, error in
                let country = placeMarks?.first?.country
                let admin = placeMarks?.first?.administrativeArea
                let subLocality = placeMarks?.first?.subLocality
                let name = placeMarks?.first?.name

                let address = "\(country ?? ""),\(admin ?? ""),\(subLocality ?? ""),\(name ?? "")"


                completionHandler(address)
             })
        }
    
    
    
    
    enum pushTo {
        case tabBar
        case VC
    }
    class func PushTo(type:pushTo,id: AnyClass ){
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let nav = UINavigationController()

        switch type {
        case .tabBar:
            let  vc = (storyboard.instantiateViewController(withIdentifier: "\(id)")) as! UITabBarController
            vc.selectedIndex = 0
            print("push")
            nav.pushViewController(vc , animated: true)

        case .VC:
            let vc = (storyboard.instantiateViewController(withIdentifier: "\(id)")) as UIViewController
            nav.pushViewController(vc , animated: true)

        }

    }
    
    

}

//extension UIImageView {
//    func loadImage(endPoint: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(from: "http://flashbook.pina-app.com + \(endPoint)" as! Decoder ) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
