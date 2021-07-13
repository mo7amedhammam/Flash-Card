//
//  API.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 04/07/2021.
//

import Foundation
import Alamofire
import PKHUD


class API: NSObject {
    
    //MARK: --------- register -----------
    class func userRegister(fName: String?, lName: String?, gender: String?, username: String?, mobile: String?, email: String?, password: String?, password_confirmation: String?, lang: String?, completion : @escaping ( Bool , LoginModel?, String?) ->Void ) {
        HUD.show(.progress)
        AF.request(APIRouter.SignUp(fName: fName ?? "", lName: lName ?? "", gender: gender ?? "", username: username ?? "", mobile: mobile ?? "", email: email ?? "", password: password ?? "", password_confirmation: password_confirmation ?? "", lang: lang ?? "")).responseDecodable(completionHandler: {(response : DataResponse< LoginModel? , AFError> ) in

            HUD.hide()
            switch response.result{
            
            case .failure(let error):
                completion(false, nil, error.localizedDescription)
                HUD.flash(.label(error.localizedDescription),delay: 2.0)

            case .success(let model):
                guard model != nil else {return}

                if model?.status == true{
                    completion(true, model, nil)
                } else{
                    completion(false, nil, model?.message)
                    HUD.flash(.label(model?.message),delay: 2.0)
                }
            }
          
        })
        
    }
    
    

    //MARK:  ----- User Login -----
    class func  userLogin ( Email : String, Password : String ,lang: String, completion : @escaping (Bool,LoginModel?, String?) ->Void) {
        HUD.show(.progress)
        AF.request(APIRouter.Login(email: Email, password: Password, lang: "en")).responseDecodable(completionHandler: {(response: DataResponse<LoginModel?, AFError>) in
            
            HUD.hide()
            switch response.result {
            
            case .failure(let error):
                completion(false,nil, error.localizedDescription)
                HUD.flash(.label(error.localizedDescription),delay: 2.0)

            case .success(let model):
                guard model != nil else {return}
                
                if model?.status == true {
                   completion(true,model,nil)
                    
                               } else {
                                completion(false,nil,model?.message)
                                HUD.flash(.label(model?.message),delay: 2.0)

                               }
                           }
                       })
            }
    
    //MARK: --- logout ---
    class func userLogOut( completion : @escaping ( Bool ,LogOutModel? , String?) ->Void ){
        HUD.show(.progress)
        AF.request(APIRouter.SignOut).responseDecodable(completionHandler: {(response: DataResponse<LogOutModel?, AFError>) in
            print(response.response?.statusCode ?? 0)
            HUD.hide()
            switch response.result {
            
            case .failure(let error):
                completion(false,nil, error.localizedDescription)
                HUD.flash(.label(error.localizedDescription),delay: 2.0)
                print(error.localizedDescription)
                print(String(describing: error))
                
            case .success(let model):
                guard model != nil else {return}
                
                if model?.status == true {
                    completion(true,model,nil)
                    
                } else {
                    completion(false,nil,model?.message)
                    HUD.flash(.label(model?.message),delay: 2.0)
                    
                }
            }
        })
    }
    
    
    
    //MARK: --- Get Posts -----
    class func  getPosts ( lang : String , completion : @escaping ([PostModel]?) ->Void) {
        HUD.show(.progress)
        AF.request(APIRouter.getPosts(lang: lang)).responseDecodable(completionHandler: {(response: DataResponse<PostModel?, AFError>) in
            
            HUD.hide()
            switch response.result {
            
            case .failure(let error):
                completion([])
                print(error.localizedDescription)
                HUD.flash(.label(error.localizedDescription),delay: 2.0)
                
            case .success(let model):
              //  guard model != nil else {return}
                if model?.status == true && model?.message == "success"{
                    completion([model?.data] as? Array)
                    
                }
//                if model != nil && model?.isEmpty == false {
//                    completion(model)
//                }
//                if model?.first?.status == true {
//                    completion(model?.first?.data ?? [])
//
//                }
                else {
                    completion([])
                    
                }
            }
        })
    }
    
    
    
    
    
        }

