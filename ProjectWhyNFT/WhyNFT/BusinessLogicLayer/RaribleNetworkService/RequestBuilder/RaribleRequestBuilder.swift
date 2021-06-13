
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
        }
    }
}
