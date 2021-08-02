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
    
   
    class func  GetAllPosts (  completion : @escaping (_ error : Error? ,_ Inbody : [ModelAllUser]? , _ message : String? ) ->Void) {
        
        let url = URLs.AllUser
              
        let header : [String : HTTPHeader] = [ "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: header)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , nil , "" )
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    let jsonPosts        = json["Response"]
                    var inbodyArr        = [PostModel]()
                    var ArrComment       = [CommentsModel]()
                    
                    
                    guard let inbody = jsonPosts.array else {
                        completion(nil,nil , json["Message"].string ?? "" )
                        return
                    }
                    for data in inbody {
                   
                        let object = PostModel( Title : data["Title"].string ?? "" , Detailes :  data["Detailes"].string ?? ""  , CreationDate :  data["CreationDate"].string ?? "" ,  CreationTime:  data["CreationTime"].string ?? "" , Id: data["Id"].int ?? 0, text:  data["text"].string ?? "" , Image: data["Image"].string ?? "", UserId: data["UserId"].string ?? "", UserImage: data["UserImage"].string ?? "", IsPinPost: data["IsPinPost"].bool ?? false, FirstName: data["FirstName"].string ?? "", IsFavoritePost: data["IsFavoritePost"].bool ?? false, ReactType: data["ReactType"].int ?? 0 , ReactCount: data["ReactCount"].int ?? 0 , PinTime : data["PinTime"].string ?? "" , Comments: ArrComment)
                        
                        inbodyArr.append(object)
                        ArrComment.removeAll()
                    }
                    print("..json....\(inbodyArr)")
                    completion(nil , inbodyArr , json["Message"].string ?? "")
                }
            }
    }
    
    
    
    
    
}
