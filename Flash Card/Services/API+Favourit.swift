//
//  API+Favourit.swift
//  Flash Card
//
//  Created by mac on 03/08/2021.
//

import Foundation
import Alamofire
import SwiftyJSON


extension API {
    
    
    
     class func  S_GetAllFavourit ( completion : @escaping (_ error : Error? ,_ Inbody : [ModelAllFavourit]? , _ message : String? ) ->Void) {
         
         let url = URLs.AllFavourit + "&lang=ar"
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
                     
                     let jsonfav        = json["data"]
                     var inbodyArr        = [ModelAllFavourit]()
                     var ArrSub            = [ModelSubFavourit]()
                     
                     
                     guard let inbody = jsonfav.array else {
                         completion(nil,nil , json["message"].string ?? "" )
                         return
                     }
                     
                     for data in inbody {
                        
                        
                        if data["subcategories"].array == nil || data["subcategories"].array?.isEmpty == true  {
                        } else {
                            
                            guard let jsonResponseSub = data["subcategories"].array else {
                                return
                            }
                            for data in jsonResponseSub {
                                
                                let Object = ModelSubFavourit(id: data["id"].string ?? "" , userid: data["user"]["id"].string ?? "" , userfName: data["user"]["fName"].string ?? "" , userlName: data["user"]["lName"].string ?? "" , useruser_type: data["user"]["user_type"].string ?? "" , userprofile_img: data["user"]["profile_img"].string ?? "" , front_text: data["front_text"].string ?? "" , front_img: data["front_img"].string ?? "" , back_text: data["back_text"].string ?? "" , back_img: data["back_img"].string ?? "" , user_liked: data["user_liked"].int ?? 0 , user_reported: data["user_reported"].int ?? 0 , likes: data["likes"].int ?? 0 , reports: data["reports"].int ?? 0 , created_at: data[""].string ?? "" , updated_at: data[""].string ?? "" )
                                
                                ArrSub.append(Object)
                                
                                print("ArrCourses.count : \(ArrSub.count)")
                                
                            }
                        }
                  
                        let object = ModelAllFavourit(id: data["id"].string ?? "" , user_id: data["user_id"].string ?? "" , name: data["name"].string ?? "" , subcategories: ArrSub)
                         
                         inbodyArr.append(object)
                        ArrSub.removeAll()
                     }
                     print("..json....\(inbodyArr)")
                     
                     completion(nil , inbodyArr , json["message"].string ?? "")
                 }
             }
     }
    
    
}
