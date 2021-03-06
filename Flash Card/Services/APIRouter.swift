//
//  APIRouter.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 05/07/2021.
//

import Foundation
import Alamofire

typealias completionHandeller = (_ success: Bool) -> ()

enum APIRouter: URLRequestConvertible {

    
    //MARK:- Base URL
    static let BaseUrl = "http://flashbook.pina-app.com/"
    
    //MARK: - - Cases - -
    case Login(email:String, password:String , lang:String)
    case SignUp(fName:String, lName:String ,gender:String ,username:String ,mobile:String ,email:String ,password:String , password_confirmation:String ,  lang:String)
    case SignOut
    case getPosts(lang:String)

    
    case getCategory(lang:String)

    
    //MARK:- HTTP Method
    private var method: HTTPMethod {
        switch self {
        case .Login: return .post
        case .SignUp: return .post
        case .SignOut: return .post
        case .getPosts: return .get
            
            
        case .getCategory: return .get
    }
    }


//MARK:- Path (End Point)
private var path: String {
    switch self {
            case .Login: return "api/auth/login"
            case .SignUp: return "api/auth/register"
            case .SignOut: return "api/auth/logout"
            case .getPosts: return "api/posts"

                
           case .getCategory: return "api/profile/categories"
    }
}

//MARK:- Build Complete Request
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.BaseUrl.asURL().appendingPathComponent(path)
        var urlComponents      = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var urlRequest         = URLRequest(url: url)
        urlRequest.httpMethod  = method.rawValue
        var parameters         = Parameters()
//        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    
        switch self {
                case let .Login(email, passwoerd , lang) :
                    parameters  = ["email": email, "password": passwoerd , "lang": lang]
                    urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                    
                    urlRequest            = URLRequest(url: urlComponents.url!)
                    urlRequest            = try JSONEncoding.default.encode(urlRequest, with: parameters)
                    urlRequest.httpMethod = method.rawValue
                    return urlRequest
                    
        case let .SignUp(fName, lName, gender , username, mobile, email, password, password_confirmation , lang) :
            parameters  = ["fName": fName, "lName": lName, "gender": gender, "username": username, "mobile": mobile, "email": email, "password": password, "password_confirmation": password_confirmation, "lang": lang]
            urlRequest            = URLRequest(url: urlComponents.url!)
            urlRequest            = try JSONEncoding.default.encode(urlRequest, with: parameters)
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = method.rawValue
            return urlRequest
                    
        case .SignOut:
            urlRequest            = URLRequest(url: urlComponents.url!)
            urlRequest.setValue( Helper.gettoken(), forHTTPHeaderField: "Authorization")
          //  urlRequest.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
           // application/json
//            urlRequest.setValue( "XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        
            urlRequest            = try JSONEncoding.default.encode(urlRequest)
            urlRequest.httpMethod = method.rawValue
            print(urlRequest)
            return urlRequest
            
        case let .getPosts(lang):
           
            let queryIems = [URLQueryItem(name: "lang", value:lang)]
            urlComponents.queryItems = queryIems
            urlRequest               = URLRequest(url: urlComponents.url!)
            urlRequest.setValue( Helper.gettoken(), forHTTPHeaderField: "Authorization")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
           // urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            urlRequest = try JSONEncoding.default.encode(urlRequest)
            urlRequest.httpMethod    = method.rawValue
            return urlRequest
            
       
     
        
        
        case let .getCategory(lang):
            parameters  = ["lang": lang,]

            
//            let queryIems = [URLQueryItem(name: "lang", value:lang)]
//            urlComponents.queryItems = queryIems
            urlRequest               = URLRequest(url: urlComponents.url!)
            urlRequest.setValue( Helper.gettoken(), forHTTPHeaderField: "Authorization")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
           // urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
            urlRequest.httpMethod    = method.rawValue
            return urlRequest
            
       
        
        }
    }
}
