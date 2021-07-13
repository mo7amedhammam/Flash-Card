//
//  LogOutModel.swift
//  Flash Card
//
//  Created by Mohamed Hammam on 13/07/2021.
//

import Foundation
//MARK: ---- Logout ----
struct  LogOutModel : Codable {
    let status : Bool?
    let message : String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
}
