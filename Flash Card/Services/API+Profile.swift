//
//  API+Profile.swift
//  Flash Card
//
//  Created by mac on 02/08/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    
    
    class func S_GetProfile ( completion : @escaping (_ error : Error? ,_ Inbody : [ModelShowProfile]? ,  _ message : String? ) ->Void) {
        
        let url = URLs.Profile + "?user_id=\(Helper.getid())&lang=ar"
        
        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]
        
        
        Alamofire.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: header )
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , nil  , "" )
                case .success(let value) :
                    let json = JSON(value)
                    print("json ::\(json)")
                    
                    var ArrProfile                 = [ModelShowProfile]()
                    var ArrFollowers               = [ModelFollowers]()
                    var ArrFollowing               = [ModelFollowing]()
                    var ArrPost                    = [ModelPosts]()
                    
                
                        
                        if json["data"]["followers"].array == nil || json["data"]["followers"].array?.isEmpty == true  {
                            
                        } else {
                            
                            guard let jsonResponseFolow = json["data"]["followers"].array else {
                                return
                            }
                            for folow in jsonResponseFolow {
                                
                                let Object = ModelFollowers(id: folow["id"].string ?? "" , user_type: folow["user_type"].string ?? "" , fName: folow["fName"].string ?? "" , lName: folow["lName"].string ?? "" , profile_img: folow["profile_img"].string ?? "" , is_following: folow["is_following"].int ?? 0 , is_follower: folow["is_follower"].int ?? 0 )
                                
                                ArrFollowers.append(Object)
                                
                                print("ArrCourses.count : \(ArrFollowers.count)")
                                
                            }
                        }
                        
                        
                        
                        if json["data"]["following"].array == nil || json["data"]["following"].array?.isEmpty == true  {
                            
                        } else {
                            guard let jsonResponseFollowing = json["data"]["following"].array else {
                                return
                            }
                            for foll in jsonResponseFollowing {
                                
                                let Object = ModelFollowing(id: foll["id"].string ?? ""  , user_type: foll["user_type"].string ?? "" , fName: foll["fName"].string ?? "" , lName: foll["lName"].string ?? "" , profile_img: foll["profile_img"].string ?? "" , is_following: foll["is_following"].int ?? 0 , is_follower: foll["is_follower"].int ?? 0 )
                                
                                ArrFollowing.append(Object)
                                
                                print("ArrCourses.count : \(ArrFollowing.count)")
                                
                            }
                        }
                        
                        // posts
                        
                        if json["data"]["posts"].array == nil || json["data"]["posts"].array?.isEmpty == true  {
                            
                        } else {
                            guard let jsonResponseposts = json["data"]["posts"].array else {
                                return
                            }
                            for pos in jsonResponseposts {
                                
                                let Object = ModelPosts(id: pos["id"].string ?? "" , front_text: pos["front_text"].string ?? "" , front_img: pos["front_img"].string ?? "" , back_text: pos["back_text"].string ?? "" , back_img: pos["back_img"].string ?? "" , reports: pos["reports"].int ?? 0 , likes: pos["likes"].int ?? 0 , in_favourites: pos["in_favourites"].int ?? 0 , user_liked: pos["user_liked"].int ?? 0 , user_reported: pos["user_reported"].int ?? 0 , created_by: pos["created_by"].string ?? "" , created_at: pos["created_at"].string ?? "" , updated_at: pos["updated_at"].string ?? "" , userid: pos["user"]["id"].string ?? "" , userfName: pos["user"]["fName"].string ?? "" , userlName: pos["user"]["lName"].string ?? "" , userprofile_img: pos["user"]["profile_img"].string ?? "" , useruser_type: pos["user"]["user_type"].string ?? "" )
                                
                                ArrPost.append(Object)
                                
                                print("ArrCourses.count : \(ArrFollowing.count)")
                                
                            }
                        }
                        
                        
                        
                        let object = ModelShowProfile(id: json["data"]["id"].string ?? "" , is_following: json["data"]["is_following"].int ?? 0 , user_type: json["data"]["user_type"].string ?? "" , fName: json["data"]["fName"].string ?? "" , lName: json["data"]["lName"].string ?? "" , username: json["data"]["username"].string ?? "" , mobile: json["data"]["mobile"].string ?? "" , email: json["data"]["email"].string ?? "" , gender: json["data"]["gender"].string ?? "" , address: json["data"]["address"].string ?? "" , profile_img: json["data"]["profile_img"].string ?? "" , cover_img: json["data"]["cover_img"].string ?? "" , university: json["data"]["university"].string ?? "" , mobile_verified: json["data"]["mobile_verified"].int ?? 0 , email_verified: json["data"]["email_verified"].int ?? 0 , account_status: json["data"]["account_status"].string ?? "" , del_schedule: json["data"]["del_schedule"].string ?? "" , joined_at: json["data"]["joined_at"].string ?? "" , followers: ArrFollowers, followers_count: json["data"]["followers_count"].int ?? 0 , following: ArrFollowing, following_count: json["data"]["following_count"].int ?? 0 , posts: ArrPost)
                        
                        ArrProfile.append(object)
                        
                        print("..json....\(ArrProfile)")
                        
                        
                        ArrFollowers.removeAll()
                        ArrFollowing.removeAll()
                        ArrPost.removeAll()
                    
                    
                    // end of }
                    completion(nil , ArrProfile , json["message"].string ?? "")
                }
            }
    }
    
    
    

    
    
    // posts/like?post_id=1
    
    
    
    class func  addOrRemovePostReact ( PostId : Int , completion : @escaping (_ error : Error? , _ status : Bool? ,_ message : String? ) ->Void) {
        
        
        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]
        let url = URLs.LovePost + "?post_id=\(PostId)"
        
        print("url  : \(url)")
        
        Alamofire.request(url, method: .post, parameters: nil , encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , false  , "" )
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    if json["status"] == true  {
                        completion(nil , true ,json["message"].string ?? "")
                        // liked a post successfully
                    } else {
                        
                        completion(nil , false ,json["message"].string ?? "")
                        
                    }
                    
                }
            }
        
    }
    
    
    
    
    
    class func S_RemoveStar ( post_id : Int , completion : @escaping (_ error : Error? , _ status : Bool? ,_ message : String? ) ->Void) {
        
        
        let header = [ "content-type" : "application/json"  , "Authorization" : Helper.gettoken() ]
        let parameter = [ "post_id" : post_id]

        let url = URLs.RemoveStar
        
        print("url  : \(url)")
        
        Alamofire.request(url, method: .post, parameters: parameter , encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200..<500)
            .responseJSON{ response in
                switch response.result {
                case .failure(let error) :
                    completion(error , false  , "" )
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    
                    if json["status"] == true  {
                        completion(nil , true ,json["message"].string ?? "")
                        // liked a post successfully
                    } else {
                        
                        completion(nil , false ,json["message"].string ?? "")
                        
                    }
                    
                }
            }
        
    }
    
    
    
    
    
    
}
