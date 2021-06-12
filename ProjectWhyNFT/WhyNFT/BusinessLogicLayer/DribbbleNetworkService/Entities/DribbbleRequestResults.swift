//  DribbbleRequestResults.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//
//  Codable result structures

import Foundation

struct OauthTokenRequestResult: Codable {
    let accessToken: String
    let tokenType: String
    let scope: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope = "scope"
    }
}
