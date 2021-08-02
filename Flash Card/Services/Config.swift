//
//  Config.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 04/07/2021.
//

import Foundation

struct URLs {
    
    static let BaseUrl = "http://flashbook.pina-app.com/api"
    
    ///Post > Body > fName - lName - gender - username - mobile - email - password - password_confirmation
    /// parameter ["lang" : en]
    static let Register = BaseUrl+"/auth/register"

    ///Post >Body> fName - lName - gender - username - mobile - email - password - password_confirmation
    /// parameter ["email" : String , "password": String]
    
    static let Login = BaseUrl+"/auth/login"
    
    static let AllUser = BaseUrl+"/users"

    
}
