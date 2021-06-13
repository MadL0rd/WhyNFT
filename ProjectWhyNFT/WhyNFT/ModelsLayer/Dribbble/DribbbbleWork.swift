//
//  DribbbleWork.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation

struct DribbbleWork: Codable, ArtWork {

    var artId: Int {
        return id
    }
    var artPreviewUrl: URL? {
        return URL(string: images.normal)
    }
    var artHtmlUrl: URL? {
        return URL(string: htmlURL)
    }
    var artTitle: String? {
        return title
    }
    var artDescription: String? {
        return description
    }
    
    let animated: Bool
    let description: String
    let height: Int
    let htmlURL: String
    let id: Int
    let images: DribbbleWorkImages
    let lowProfile: Bool
    let title: String
    let width: Int
    let publishedAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case animated = "animated"
        case description = "description"
        case height = "height"
        case htmlURL = "html_url"
        case id = "id"
        case images = "images"
        case lowProfile = "low_profile"
        case title = "title"
        case width = "width"
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
    }
}

struct DribbbleWorkImages: Codable {
    let hidpi: String
    let normal: String
    let teaser: String
    
    enum CodingKeys: String, CodingKey {
        case hidpi
        case normal
        case teaser
    }
}
