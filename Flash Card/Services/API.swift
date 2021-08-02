//
//  API.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 04/07/2021.
//

import Foundation
import Alamofire
import PKHUD

protocol NetworkDelegate {
    
    func updateProgressViewWith(fractions:Double)
}

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
                   completion(true,model!,nil)
                    
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
    class func  getPosts ( lang : String , completion : @escaping (PostModel?,String?) ->Void) {
       // HUD.show(.progress)
        AF.request(APIRouter.getPosts(lang: lang)).responseDecodable(completionHandler: {(response: DataResponse<PostModel?, AFError>) in
            print(response.response?.statusCode ?? 0)
            HUD.hide()
            switch response.result {
            
            case .failure(let error):
                completion(nil,"There is something wrong please try agian later.")
                print(error.localizedDescription)
                HUD.flash(.label(error.localizedDescription),delay: 2.0)
                
            case .success(let model):
              //  guard model != nil else {return}
                if model?.status == true && model?.message == "success"{
//                    var adsImagePaths = [PostModel]()
//                    adsImagePaths.removeAll()
//                    model?.data?.forEach({ (ads) in
//                        adsImagePaths.append(ads)
//                    })
                    completion(model, nil)
                  //  HUD.hide()
                   // completion(model.data ?? [] , nil)
                    
                }
//                if model != nil && model?.isEmpty == false {
//                    completion(model)
//                }
//                if model?.first?.status == true {
//                    completion(model?.first?.data ?? [])
//
//                }
                else {
                    completion(nil, "There is something wrong please try agian later.")
                    
                }
            }
        })
    }
    
    //MARK: --- add Post -----
//    class func  addPost ( lang : String ,front_img: UIImage, front_text: String, back_img: UIImage, back_text: String, arrImage : [UIImage] , completion : @escaping (PostModel?,String?) ->Void) {
    class func  addPost ( lang : String , front_text: String, back_text: String, arrImage : [UIImage] , completion : @escaping (Bool,String?) ->Void) {

       // HUD.show(.progress)
        
        let url = "http://flashbook.pina-app.com/api/posts/create"
        let parameters  = ["lang": lang, "front_text" : front_text , "back_text" : back_text ] as [String : Any]
        let headers : HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": Helper.gettoken(),
            "Accept": "application/json",
            "X-Requested-With" : "XMLHttpRequest"
        ]
        
        
        AF.upload(multipartFormData: {multipartFormData in
            for (key, value) in parameters {
                       multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                   }

                   for img in arrImage {
                       guard let imgData = img.jpegData(compressionQuality: 1) else { return }
                       multipartFormData.append(imgData, withName: "file", fileName:  "image.jpeg", mimeType: "image/jpeg")
                   }

        }, to: url,
                 method: .post,
                headers: headers)
                .responseJSON { (resp) in
//                    defer{SVProgressHUD.dismiss()}
                    print("resp is \(resp)")
                    print("uploaded")
                    completion(true, nil)
                }
        
    }
    
    static var delegate:NetworkDelegate?
    class func newPost(frontImage: UIImage ,  WithName frontimagename:String ,File backImage: Data, WithName backimagename:String  , front_text: String , back_text: String , completionHandler: @escaping(Bool,String?)->Void) {

        
            let queryItems = [URLQueryItem(name: "lang", value: "en"),URLQueryItem(name: "front_text", value: front_text),URLQueryItem(name: "back_text", value: back_text)]
            //print(queryItems)
            var urlComps = URLComponents(string: "http://flashbook.pina-app.com/api/posts/create")!
            urlComps.queryItems = queryItems
            let headers:HTTPHeaders = ["Accept":"application/json","Content-Type":"application/json"]
             
            let method:HTTPMethod = .post
            let result = urlComps.url!
            
            AF.upload(multipartFormData: { (multipartFormData) in
             
                multipartFormData.append(frontImage.pngData()!, withName: frontimagename, fileName: "\(frontimagename)", mimeType: "image/png")
                multipartFormData.append(backImage as! URL , withName: backimagename, fileName: "\(backimagename)", mimeType: "image/png")
               



            }, to: result,method:method, headers:headers).uploadProgress(closure: { (progress) in
                self.delegate?.updateProgressViewWith(fractions: progress.fractionCompleted)
            }) .responseDecodable { (response: DataResponse<PostModel, AFError>) in
                switch response.result {
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(false, error.localizedDescription)
                        break
                case .success(let model):

                   print(response.response!.statusCode)
                     print(model.message ?? "")
                    if model.status == true {
                        print("-----------------")
                        print(model)
                        print("-----------------")
                        completionHandler(true,model.message ?? "")
                    } else {
                        if model.data != nil {
//                            completionHandler(false , model.data.name?[0] )
//                        } else if model.messages?.email  != nil {
//                            completionHandler(false , model.messages?.email?[0] )
//                        } else if model.messages?.mobile  != nil {
//                            completionHandler(false , model.messages?.mobile?[0] )
//                        } else if model.messages?.country_id  != nil {
//                            completionHandler(false , model.messages?.country_id?[0] )
//                        }  else if model.messages?.city_id  != nil {
//                            completionHandler(false , model.messages?.city_id?[0] )
//                        }  else if model.messages?.address  != nil {
//                            completionHandler(false , model.messages?.address?[0] )
//                        }  else if model.messages?.destination  != nil {
//                            completionHandler(false , model.messages?.destination?[0] )
//                        }
                    }
                  }
                }
        
        
        
        
            }
        
//    class func Post(front_img : UIImage?,front_text:String?,back_img:UIImage?,back_text:String?  ){
//
//        let url = "http://flashbook.pina-app.com/api/posts/create"
//        let parameters  = ["lang": "en", "front_img" : front_img , "front_text" : front_text , "back_img" : back_img , "back_text" : back_text ] as [String : Any]
//        let headers : HTTPHeaders = [
//            "Content-Type": "application/x-www-form-urlencoded",
//            "Authorization": Helper.gettoken(),
//            "Accept": "application/json",
//            "X-Requested-With" : "XMLHttpRequest"
//        ]
//
//    AF.upload(
//        multipartFormData: { multipartFormData in
//            multipartFormData.append(front_img!.jpegData(compressionQuality: 0.5)!, withName: front_text! , fileName: "landing.jpeg", mimeType: "image/jpeg")
//            multipartFormData.append(data: Data, withName: front_text!)
//
//    },
//        to: "url", method: .post , headers: headers)
//        .response { resp in
//            print("response is:" , resp)
//
//    }
//    }
        

}
    
    
    
    
    
    
    
    //MARK: --- Get Categories -----
    class func  getCategories ( lang : String , completion : @escaping (CategoriesModel?,String?) ->Void) {
        HUD.show(.progress)
        AF.request(APIRouter.getCategory(lang: lang)).responseDecodable(completionHandler: {(response: DataResponse<CategoriesModel?, AFError>) in
            print(response.response?.statusCode ?? 0)
            HUD.hide()
            switch response.result {
            
            case .failure(let error):
                completion(nil,"There is something wrong please try agian later.")
                print(error.localizedDescription)
                HUD.flash(.label(error.localizedDescription),delay: 2.0)
                
            case .success(let model):
              //  guard model != nil else {return}
                if model?.status == true && model?.message == "success"{
                    completion(model, nil)
   
                }

                else {
                    completion(nil, "There is something wrong please try agian later.")
                    
                }
            }
        })
    }
    
    
    
}


