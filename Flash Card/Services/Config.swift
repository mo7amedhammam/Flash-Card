//
//  Config.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 04/07/2021.
//

import Foundation

struct URLs {
    
    static let BaseUrl = "http://flashbook.pina-app.com"
    
    ///Post > Body > fName - lName - gender - username - mobile - email - password - password_confirmation
    /// parameter ["lang" : en]
    static let Register = BaseUrl+"/api/auth/register"

    ///Post >Body> fName - lName - gender - username - mobile - email - password - password_confirmation
    /// parameter ["email" : String , "password": String]
    static let Login = BaseUrl+"/api/auth/login"
    
}
