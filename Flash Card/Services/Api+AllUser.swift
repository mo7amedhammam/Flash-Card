//
//  Api+AllUser.swift
//  Flash Card
//
//  Created by mac on 02/08/2021.
//

import Foundation
import Alamofire
import SwiftyJSON


extension API {
    
   
    class func  S_GetAllPosts ( completion : @escaping (_ error : Error? ,_ Inbody : [ModelAllUser]? , _ message : String? ) ->Void) {
        
        let url = URLs.AllUser
        print("url : \(url)")
              
        let header  = [ "X-Requested-With" : "XMLHttpRequest" ,  "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , nil , "" )
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    let jsonPosts        = json["data"]
                    var inbodyArr        = [ModelAllUser]()
                    
                    
                    guard let inbody = jsonPosts.array else {
                        completion(nil,nil , json["message"].string ?? "" )
                        return
                    }
                    
                    for data in inbody {
                   
                        let object = ModelAllUser(id: data["id"].string ?? "" , user_type:  data["user_type"].string ?? "" , fName: data["fName"].string ?? "" , lName: data["lName"].string ?? "" , profile_img: data["profile_img"].string ?? "" , followers:  data["followers"].int ?? 0 , is_follower:  data["is_follower"].int ?? 0 )
                        
                        inbodyArr.append(object)
                    }
                    print("..json....\(inbodyArr)")
                    
                    completion(nil , inbodyArr , json["message"].string ?? "")
                }
            }
    }
 

    
    
    class func S_Follow ( profile_id : Int , completion : @escaping (_ error : Error? , _ status : Bool? ,_ message : String? ) ->Void) {
        
        let parameter = ["profile_id" : profile_id ]
        let header  = [ "X-Requested-With" : "XMLHttpRequest" ,  "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]

        let url = URLs.Follow + "?profile_id=\(profile_id)"
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
                    
                    if json["status"] == true  {
                        completion(nil , true ,json["message"].string ?? "" )
                    } else {
                        completion(nil , false ,json["message"].string ?? "")
                    }
                }
            }
    }
    
    
    
    
    
    
    
    
}
