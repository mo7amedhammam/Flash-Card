//
//  ModelAllUser.swift
//  Flash Card
//
//  Created by mac on 02/08/2021.
//

import UIKit

class ModelAllUser: NSObject {
    
    
    var id            = 0
    var user_type            = ""
    var fName            = ""
    var lName            = ""
    var profile_img            = ""
    var followers            = 0
    var is_follower            = 0
    
    
    init(
        
        id    : Int ,
        user_type    : String ,
        fName    : String ,
        lName    : String ,
        profile_img    : String ,
        followers    : Int ,
        is_follower    : Int
        
        
        
        
    ){
        
        self.id       =  id
        self.user_type       =  user_type
        self.fName       =  fName
        self.lName       =  lName
        self.profile_img       =  profile_img
        self.followers       =  followers
        self.is_follower       =  is_follower
        
    }
    
    
    
    
}
