//
//  Config.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 04/07/2021.
//

import Foundation

struct URLs {
    
    static let BaseUrl = "http://flashbook.pina-app.com/api/"
    
    static let Register = BaseUrl + "auth/register"
    static let Login    = BaseUrl + "auth/login"
    static let AllUser  = BaseUrl + "users"
    static let Follow   = BaseUrl + "profile/follow"
    static let Profile  = BaseUrl + "profile/show"
    static let LogOut   = BaseUrl + "auth/logout"
    static let LovePost = BaseUrl + "posts/like"
    static let RemoveStar = BaseUrl + "profile/subcategories/delete"
    static let AddStar    = BaseUrl + "profile/subcategories/add"
    static let AllFavourit = BaseUrl + "profile/categories"

    
}
