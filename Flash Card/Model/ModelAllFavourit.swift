//
//  ModelAllFavourit.swift
//  Flash Card
//
//  Created by mac on 03/08/2021.
//

import UIKit

class ModelAllFavourit: NSObject {
    
    var  id              = ""
    var  user_id              = ""
    var  name              = ""
    var  subcategories     = [ModelSubFavourit]()
    
    init(
        
        id            : String ,
        user_id       : String ,
        name          : String ,
        subcategories : [ModelSubFavourit]
    
        ) {
        
        self.id   = id
        self.user_id   = user_id
        self.name   = name
        self.subcategories   = subcategories
        
        
    }
    
    
    
}

class ModelSubFavourit: NSObject {
    
    var  id     = ""
    var  userid     = ""
    var  userfName     = ""
    var  userlName     = ""
    var  useruser_type     = ""
    var  userprofile_img     = ""
    var  front_text     = ""
    var  front_img     = ""
    var  back_text     = ""
    var  back_img     = ""
    var  user_liked                 = 0
    var  user_reported                 = 0
    var  likes                 = 0
    var  reports                 = 0
    var  created_at           = ""
    var  updated_at           = ""
    
    
    init(
        
        id   : String ,
        userid   : String ,
        userfName   : String ,
        userlName   : String ,
        useruser_type   : String ,
        userprofile_img   : String ,
        front_text   : String ,
        front_img   : String ,
        back_text   : String ,
        back_img   : String ,
        user_liked   : Int ,
        user_reported   : Int ,
        likes   : Int ,
        reports   : Int ,
        created_at   : String ,
        updated_at   : String
        
        
    ) {
        
        self.id   =   id
        self.userid   =   userid
        self.userfName   =   userfName
        self.userlName   =   userlName
        self.useruser_type   =   useruser_type
        self.userprofile_img   =   userprofile_img
        self.front_text   =   front_text
        self.front_img   =   front_img
        self.back_text   =   back_text
        self.back_img   =   back_img
        self.user_liked   =   user_liked
        self.user_reported   =   user_reported
        self.likes   =   likes
        self.reports   =   reports
        self.created_at   =   created_at
        self.updated_at   =   updated_at
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
