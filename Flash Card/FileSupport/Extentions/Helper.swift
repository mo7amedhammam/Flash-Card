//
//  Helper.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 25/05/2021.
//

import UIKit
import SystemConfiguration
import MapKit


class Helper: NSObject {
        
    class func setUserData( id : String , owner_mob_1 : String , email : String ,user_name : String ,type : String , token : String , chalet_id : String ){
        let def = UserDefaults.standard
        def.setValue(id, forKey: "id")
        def.setValue(owner_mob_1, forKey: "owner_mob_1")
        def.setValue(email, forKey: "email")
        def.setValue(user_name, forKey: "user_name")
        def.setValue(type, forKey: "gender")
        def.setValue(token, forKey: "token")
        def.setValue(chalet_id, forKey: "chalet_id")
        def.synchronize()
        //        restartApp()
    }
    
    
    class func getUser_id()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "id") as! String)
    }
    
    class func getUser_name() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "user_name") as! String)
    }
    class func getUser_phone() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "owner_mob_1") as! String)
    }
    class func getUser_email() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "email") as! String)
    }
    class func getUser_Type() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "gender") as! String)
    }
    class func getUser_Token() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "token") as! String)
    }
    
    class func getChalet_id() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "chalet_id") as! String)
    }
 
    // check in scene delegate
    class func getUserData()->Bool{
        let def = UserDefaults.standard
        return (def.object(forKey: "user_name") as? String) != nil
    }
    //save password
    class func setPasswordSave(password : String){
        let def = UserDefaults.standard
        def.setValue(password, forKey: "passwordSave")
        def.synchronize()
    }
    
    
    class func getPasswordSave()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "passwordSave") as! String)
    }
    
    //
    
    //save image
    class func setProfileImage(image : String){
        let def = UserDefaults.standard
        def.setValue(image, forKey: "profileImage")
        def.synchronize()
    }
    
    
    class func getProfileImage() ->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "profileImage") as! String)
    }
    
    
    //
    
    class func logout() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "id")
        def.removeObject(forKey: "owner_mob_1")
        def.removeObject(forKey: "email")
        def.removeObject(forKey: "user_name")
        def.removeObject(forKey: "gender")
        def.removeObject(forKey: "token")
        def.removeObject(forKey: "chalet_id")
        def.removeObject(forKey: "profileImage")


    }
    
    class func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
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
    
    

}
