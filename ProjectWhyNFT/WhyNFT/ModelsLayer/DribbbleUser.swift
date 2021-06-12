//
//  DribbbleUser.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation

struct DribbbleUser: Codable {
    
    let avatarUrlString: String
    let bio: String
    let createdAt: String
    let followersCount: Int
    let htmlUrl: String
    let id: Int
    let location: String
    let login: String
    let name: String
    let type: String
    
    var avatarUrl: URL? {
        return URL(string: avatarUrlString)
    }
    
    enum CodingKeys: String, CodingKey {
        case avatarUrlString = "avatar_url"
        case bio = "bio"
        case createdAt = "created_at"
        case followersCount = "followers_count"
        case htmlUrl = "html_url"
        case id = "id"
        case location = "location"
        case login = "login"
        case name = "name"
        case type = "type"
    }
}
