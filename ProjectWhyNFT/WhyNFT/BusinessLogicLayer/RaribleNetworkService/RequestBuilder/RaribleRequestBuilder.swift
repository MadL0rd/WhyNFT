//  RaribleRequestBuilder.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import Alamofire

enum RaribleRequestBuilder {
    
    case work(tokenDribbble: String,
              workId: String,
              userWalletId: String)
    case shotsCheck(tokenDribbble: String,
                    workIds: [Int])
    case artWorkUpload(tokenDribbble: String,
              workId: Int,
              userWalletId: String)
}

extension RaribleRequestBuilder: DataRequestExecutable {
    
    var execute: DataRequest {
        switch self {
        
        case .work(tokenDribbble: let tokenDribbble, workId: let workId, userWalletId: let userWalletId):
            let parameters: [String: Any] = [
                "token": tokenDribbble,
                "image_id": workId,
                "user_address": userWalletId
            ]
            return AF.request(RaribleRoutes.work, method: .get, parameters: parameters)
            
        case .shotsCheck(tokenDribbble: let tokenDribbble, workIds: let workIds):
            let parameters: [String: Any] = [
                "token": tokenDribbble,
                "dribbble_ids": workIds
            ]
            return AF.request(RaribleRoutes.shotsCheck, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            
        case .artWorkUpload(tokenDribbble: let tokenDribbble, workId: let workId, userWalletId: let userWalletId):
            let parameters: [String: Any] = [
                "token": tokenDribbble,
                "dribbble_id": workId,
                "user_address": userWalletId
            ]
            return AF.request(RaribleRoutes.uploadWork, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
        }
    }
}
