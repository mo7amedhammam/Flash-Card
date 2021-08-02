////
////  APIRouter.swift
////  Flash Card
////
////  Created by Muhamed Hammam on 05/07/2021.
////
//
//import Foundation
//import Alamofire
//
//typealias completionHandeller = (_ success: Bool) -> ()
//
//enum APIRouter: URLRequestConvertible {
//
//
//    //MARK:- Base URL
//    static let BaseUrl = "http://flashbook.pina-app.com"
//
//    //MARK: - - Cases - -
//    case Login(email:String, password:String , lang:String)
//    case SignUp(fName:String, lName:String ,gender:String ,username:String ,mobile:String ,email:String ,password:String , password_confirmation:String ,  lang:String)
//    case SignOut
//    case getPosts(lang:String)
//
//
//    //MARK:- HTTP Method
//    private var method: HTTPMethod {
//        switch self {
//        case .Login: return .post
//        case .SignUp: return .post
//        case .SignOut: return .post
//        case .getPosts: return .get
//        }
//    }
//
//
//
//    //MARK:- Path (End Point)
//    private var path: String {
//        switch self {
//        case .Login: return "/api/auth/login"
//        case .SignUp: return "/api/auth/register"
//        case .SignOut: return "/api/auth/logout"
//        case .getPosts: return "/api/posts"
//
//        }
//    }
//
//    //MARK:- Build Complete Request
//    func asURLRequest() throws -> URLRequest {
//        let url = try APIRouter.BaseUrl.asURL().appendingPathComponent(path)
//        let urlComponents      = URLComponents(url: url, resolvingAgainstBaseURL: true)!
//        var urlRequest         = URLRequest(url: url)
//        urlRequest.httpMethod  = method.rawValue
//        var parameters         = Parameters()
//        //        urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//
//        switch self {
//        case let .Login(email, passwoerd , lang) :
//            parameters  = ["email": email, "password": passwoerd , "lang": lang]
//            urlRequest            = URLRequest(url: urlComponents.url!)
//            urlRequest            = try JSONEncoding.default.encode(urlRequest, with: parameters)
//            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpMethod = method.rawValue
//            return urlRequest
//
//        case let .SignUp(fName, lName, gender , username, mobile, email, password, password_confirmation , lang) :
//            parameters  = ["fName": fName, "lName": lName, "gender": gender, "username": username, "mobile": mobile, "email": email, "password": password, "password_confirmation": password_confirmation, "lang": lang]
//            urlRequest            = URLRequest(url: urlComponents.url!)
//            urlRequest            = try JSONEncoding.default.encode(urlRequest, with: parameters)
//            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpMethod = method.rawValue
//            return urlRequest
//
//        case .SignOut:
//
//            urlRequest.setValue( Helper.gettoken(), forHTTPHeaderField: "Authorization")
//            urlRequest.setValue( "XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
//            urlRequest            = URLRequest(url: urlComponents.url!)
//            // urlRequest            = try JSONEncoding.default.encode(urlRequest, with: nil)
//            urlRequest.httpMethod = method.rawValue
//            return urlRequest
//
//        case let .getPosts(lang):
//            parameters  = ["lang": lang]
//            urlRequest.addValue( Helper.gettoken(), forHTTPHeaderField: "Authorization")
//            urlRequest.addValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
//            urlRequest            = URLRequest(url: urlComponents.url!)
//            urlRequest            = try JSONEncoding.default.encode(urlRequest, with: nil)
//            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpMethod = method.rawValue
//            return urlRequest
//        }
//    }
//
//}
