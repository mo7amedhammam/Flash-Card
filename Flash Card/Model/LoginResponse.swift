//
//  LoginResponse.swift
//  Flash Card
//
//  Created by Muhamed Hammam on 05/07/2021.
//

import Foundation
struct  LoginModel : Codable {
    let status : Bool?
    let message : String?
    let data : LoginResponse?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(LoginResponse.self, forKey: .data)
    }

}

// MARK: ------ model ------

struct LoginResponse : Codable {
    let id : String?
    let user_type : String?
    let fName : String?
    let lName : String?
    let address : String?
    let profile_img : String?
    let cover_img : String?
    let university : String?
    let username : String?
    let email : String?
    let mobile : String?
    let gender : String?
    let joined_at : String?
    let token : String?
    let email_verified : Int?
    let mobile_verified : Int?
    let del_schedule : String?
    let account_status : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_type = "user_type"
        case fName = "fName"
        case lName = "lName"
        case address = "address"
        case profile_img = "profile_img"
        case cover_img = "cover_img"
        case university = "university"
        case username = "username"
        case email = "email"
        case mobile = "mobile"
        case gender = "gender"
        case joined_at = "joined_at"
        case token = "token"
        case email_verified = "email_verified"
        case mobile_verified = "mobile_verified"
        case del_schedule = "del_schedule"
        case account_status = "account_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
        fName = try values.decodeIfPresent(String.self, forKey: .fName)
        lName = try values.decodeIfPresent(String.self, forKey: .lName)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        profile_img = try values.decodeIfPresent(String.self, forKey: .profile_img)
        cover_img = try values.decodeIfPresent(String.self, forKey: .cover_img)
        university = try values.decodeIfPresent(String.self, forKey: .university)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        joined_at = try values.decodeIfPresent(String.self, forKey: .joined_at)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        email_verified = try values.decodeIfPresent(Int.self, forKey: .email_verified)
        mobile_verified = try values.decodeIfPresent(Int.self, forKey: .mobile_verified)
        del_schedule = try values.decodeIfPresent(String.self, forKey: .del_schedule)
        account_status = try values.decodeIfPresent(String.self, forKey: .account_status)
    }
    
}



