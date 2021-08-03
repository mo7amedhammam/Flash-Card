//
//  ModelShowProfile.swift
//  Flash Card
//
//  Created by mac on 02/08/2021.
//

import UIKit

class ModelShowProfile: NSObject {
    
    
    var  id                 = ""
    var  is_following       = 0
    var  user_type          = ""
    var  fName              = ""
    var  lName              = ""
    var  username           = ""
    var  mobile             = ""
    var  email              = ""
    var  gender             = ""
    var  address            = ""
    var  profile_img        = ""
    var  cover_img          = ""
    var  university         = ""
    var  mobile_verified    = 0
    var  email_verified     = 0
    var  account_status     = ""
    var  del_schedule       = ""
    var  joined_at          = ""
    var  followers          = [ModelFollowers]()
    var  followers_count    = 0
    var  following          = [ModelFollowing]()
    var  following_count    = 0
    var  posts              = [ModelPosts]()
    
    
    init (
    
        id                   : String ,
        is_following         : Int ,
        user_type            : String ,
        fName                : String ,
        lName                : String ,
        username             : String ,
        mobile               : String ,
        email                : String ,
        gender               : String ,
        address              : String ,
        profile_img          : String ,
        cover_img            : String ,
        university           : String ,
        mobile_verified      : Int ,
        email_verified       : Int ,
        account_status       : String ,
        del_schedule         : String ,
        joined_at            : String ,
        followers            : [ModelFollowers] ,
        followers_count      : Int ,
        following            : [ModelFollowing] ,
        following_count      : Int ,
        posts                : [ModelPosts]
  
    ){
        
        self.id                = id
        self.is_following      = is_following
        self.user_type         = user_type
        self.fName             = fName
        self.lName             = lName
        self.username          = username
        self.mobile            = mobile
        self.email             = email
        self.gender            = gender
        self.address           = address
        self.profile_img       = profile_img
        self.cover_img         = cover_img
        self.university        = university
        self.mobile_verified   = mobile_verified
        self.email_verified    = email_verified
        self.account_status    = account_status
        self.del_schedule      = del_schedule
        self.joined_at         = joined_at
        self.followers         = followers
        self.followers_count   = followers_count
        self.following         = following
        self.following_count   = following_count
        self.posts             = posts
   
        
    }

    
    
    
}



class ModelFollowers : NSObject {
    
    var id             = ""
    var user_type      = ""
    var fName          = ""
    var lName          = ""
    var profile_img    = ""
    var is_following   = 0
    var is_follower    = 0
    
    
    init(
        
        id           : String ,
        user_type    : String ,
        fName        : String ,
        lName        : String ,
        profile_img  : String ,
        is_following : Int ,
        is_follower  : Int
        
        
        
    ) {
        
        self.id             = id
        self.user_type      = user_type
        self.fName          = fName
        self.lName          = lName
        self.profile_img    = profile_img
        self.is_following   = is_following
        self.is_follower    = is_follower
        
        
    }
    
}



class ModelFollowing : NSObject {
    
    var id             = ""
    var user_type      = ""
    var fName          = ""
    var lName          = ""
    var profile_img    = ""
    var is_following   = 0
    var is_follower    = 0
    
    
    init(
        
        id           : String ,
        user_type    : String ,
        fName        : String ,
        lName        : String ,
        profile_img  : String ,
        is_following : Int ,
        is_follower  : Int
        
        
        
    ) {
        
        self.id             = id
        self.user_type      = user_type
        self.fName          = fName
        self.lName          = lName
        self.profile_img    = profile_img
        self.is_following   = is_following
        self.is_follower    = is_follower
        
        
    }
    
}



class ModelPosts : NSObject {
    
    
    var   id                  = ""
    var   front_text          = ""
    var   front_img           = ""
    var   back_text           = ""
    var   back_img            = ""
    var   reports             = 0
    var   likes               = 0
    var   in_favourites       = 0
    var   user_liked          = 0
    var   user_reported       = 0
    var   created_by          =  ""
    var   created_at          =  ""
    var   updated_at          =  ""
    var   userid              =  ""
    var   userfName           =  ""
    var   userlName           =  ""
    var   userprofile_img     =  ""
    var   useruser_type       =  ""
    
    
    
    
    init (
        
        id               : String ,
        front_text       : String ,
        front_img        : String ,
        back_text        : String ,
        back_img         : String ,
        reports          : Int ,
        likes            : Int ,
        in_favourites    : Int ,
        user_liked       : Int ,
        user_reported    : Int ,
        created_by       : String ,
        created_at       : String ,
        updated_at       : String ,
        userid           : String ,
        userfName        : String ,
        userlName        : String ,
        userprofile_img  : String ,
        useruser_type    : String
        
    ) {
        
        self.id                =   id
        self.front_text        =   front_text
        self.front_img         =   front_img
        self.back_text         =   back_text
        self.back_img          =   back_img
        self.reports           =   reports
        self.likes             =   likes
        self.in_favourites     =   in_favourites
        self.user_liked        =   user_liked
        self.user_reported     =   user_reported
        self.created_by        =   created_by
        self.created_at        =   created_at
        self.updated_at        =   updated_at
        self.userid            =   userid
        self.userfName         =   userfName
        self.userlName         =   userlName
        self.userprofile_img   =   userprofile_img
        self.useruser_type     =   useruser_type
        
        
        
        
        
    }
    
    
    
    
    
    
    
}
