//  RaribleRequestResults.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//
//  Codable result structures

import Foundation

struct WorkRequestResult: Codable {
    
    let result: String
}

struct ArtWorkSellingStatus: Codable {
    
    let dribbbleWorkID: Int
    let urlRaribleNftString: String
    let createdDateString: String
    
    var urlRaribleNft: URL? {
        return URL(string: urlRaribleNftString)
    }

    enum CodingKeys: String, CodingKey {
        case dribbbleWorkID = "dribbble_id"
        case urlRaribleNftString = "url"
        case createdDateString = "created"
    }
}

struct ShotsCheckRequestResult: Codable {
    
    let result: [ArtWorkSellingStatus]
}

struct ArtWorkUploadRequestResult: Codable {
    
    let result: ArtWorkSellingStatus
}
