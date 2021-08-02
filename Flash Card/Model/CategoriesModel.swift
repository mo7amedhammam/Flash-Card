//
//  CategoriesModel.swift
//  Flash Card
//
//  Created by Mohamed Hammam on 02/08/2021.
//

import Foundation
struct CategoriesModel : Codable {
    let status : Bool?
    let message : String?
    let data : [Data]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }



struct Data : Codable {
    let id : String?
    let user_id : String?
    let name : String?
    let subcategories : [Subcategories]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case name = "name"
        case subcategories = "subcategories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        subcategories = try values.decodeIfPresent([Subcategories].self, forKey: .subcategories)
    }

}
struct Subcategories : Codable {
    let id : String?
    let user : User?
    let front_text : String?
    let front_img : String?
    let back_text : String?
    let back_img : String?
    let user_liked : Int?
    let user_reported : Int?
    let likes : Int?
    let reports : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user = "user"
        case front_text = "front_text"
        case front_img = "front_img"
        case back_text = "back_text"
        case back_img = "back_img"
        case user_liked = "user_liked"
        case user_reported = "user_reported"
        case likes = "likes"
        case reports = "reports"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        front_text = try values.decodeIfPresent(String.self, forKey: .front_text)
        front_img = try values.decodeIfPresent(String.self, forKey: .front_img)
        back_text = try values.decodeIfPresent(String.self, forKey: .back_text)
        back_img = try values.decodeIfPresent(String.self, forKey: .back_img)
        user_liked = try values.decodeIfPresent(Int.self, forKey: .user_liked)
        user_reported = try values.decodeIfPresent(Int.self, forKey: .user_reported)
        likes = try values.decodeIfPresent(Int.self, forKey: .likes)
        reports = try values.decodeIfPresent(Int.self, forKey: .reports)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

    struct User : Codable {
        let id : String?
        let fName : String?
        let lName : String?
        let user_type : String?
        let profile_img : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case fName = "fName"
            case lName = "lName"
            case user_type = "user_type"
            case profile_img = "profile_img"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            fName = try values.decodeIfPresent(String.self, forKey: .fName)
            lName = try values.decodeIfPresent(String.self, forKey: .lName)
            user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
            profile_img = try values.decodeIfPresent(String.self, forKey: .profile_img)
        }

    }

}
