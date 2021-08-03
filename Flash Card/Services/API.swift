//
//  API.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 04/07/2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class API: NSObject {
    
    
    //MARK: User Login
    /// -------------------- Login  -------------
    class func  userLogin ( email : String , password : String, lang : String , completion : @escaping (_ error : Error? , _ status : Bool? ,_ message : String? ) ->Void) {
        
        let jsonString = ["email" : email ,"password" : password , "lang" : lang]
        let url = URLs.Login
        
        Alamofire.request(url, method: .post, parameters: jsonString , encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , false  , "")
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    if json["status"] == true && json["message"] == "success" {
                        
                        Helper.setUserData(id: json["data"]["id"].string ?? "" , user_type: json["data"]["user_type"].string ?? "" , fName: json["data"]["fName"].string ?? "" , lName: json["data"]["lName"].string ?? "" , address: json["data"]["address"].string ?? "" , profile_img: json["data"]["profile_img"].string ?? "" , cover_img: json["data"]["cover_img"].string ?? "" , university: json["data"]["university"].string ?? "" , username: json["data"]["username"].string ?? "" , email: json["data"]["email"].string ?? "" , mobile: json["data"]["mobile"].string ?? "" , gender: json["data"]["gender"].string ?? "" , joined_at: json["data"]["joined_at"].string ?? "" , token: "Bearer \(json["data"]["token"].string ?? "" )" , email_verified: json["data"]["email_verified"].int ?? 0  , mobile_verified: json["data"]["mobile_verified"].int ?? 0 , del_schedule: json["data"]["del_schedule"].string ?? "" , account_status: json["data"]["account_status"].string ?? "" )
                        
                        completion(nil , true ,json["message"].string ?? "" )
                    } else {
                        completion(nil , false ,json["message"].string ?? "")
                    }
                }
            }
    }
    
    
    
    
    //MARK:  userRegister
    /// -------------------- userRegisterin  -------------
    class func  userRegister ( fName : String , lName : String , gender : String , username : String , mobile : String , email : String , password : String ,  password_confirmation : String , lang : String , completion : @escaping (_ error : Error? , _ status : Bool? ,_ message : String? ) ->Void) {
        
        let jsonString = ["fName": fName , "lName": lName , "gender": gender , "username": username , "mobile": mobile , "email": email , "password": password , "password_confirmation": password_confirmation , "lang" : lang]
        let url = URLs.Register
        
        Alamofire.request(url, method: .post, parameters: jsonString , encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , false  , "")
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    if json["status"] == true && json["message"] == "success" {
                        Helper.setUserData(id: json["data"]["id"].string ?? "" , user_type: json["data"]["user_type"].string ?? "" , fName: json["data"]["fName"].string ?? "" , lName: json["data"]["lName"].string ?? "" , address: json["data"]["address"].string ?? "" , profile_img: json["data"]["profile_img"].string ?? "" , cover_img: json["data"]["cover_img"].string ?? "" , university: json["data"]["university"].string ?? "" , username: json["data"]["username"].string ?? "" , email: json["data"]["email"].string ?? "" , mobile: json["data"]["mobile"].string ?? "" , gender: json["data"]["gender"].string ?? "" , joined_at: json["data"]["joined_at"].string ?? "" , token: "Bearer \(json["data"]["token"].string ?? "" )" , email_verified: json["data"]["email_verified"].int ?? 0  , mobile_verified: json["data"]["mobile_verified"].int ?? 0 , del_schedule: json["data"]["del_schedule"].string ?? "" , account_status: json["data"]["account_status"].string ?? "" )
                        completion(nil , true ,json["message"].string ?? "" )
                    } else {
                        completion(nil , false ,json["message"].string ?? "")
                    }
                }
            }
    }
    
    
    
    
    
    
    class func S_LogOut ( completion : @escaping (_ error : Error? , _ status : Bool? ,_ message : String? ) ->Void) {
        
        let header  = [ "X-Requested-With" : "XMLHttpRequest" ,  "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]

        let url = URLs.LogOut
        print("url : \(url)")
        
        Alamofire.request(url, method: .post, parameters: nil , encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , false  , "")
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    if json["status"] == true && json["message"] == "success"   {
                        completion(nil , true ,json["message"].string ?? "" )
                    } else {
                        completion(nil , false ,json["message"].string ?? "")
                    }
                }
            }
    }
    
    
    
    
    
    
    
 
    
    
    
        }

