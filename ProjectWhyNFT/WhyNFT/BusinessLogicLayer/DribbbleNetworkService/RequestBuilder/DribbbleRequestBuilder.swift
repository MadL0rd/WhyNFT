//  DribbbleRequestBuilder.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Alamofire

enum DribbbleRequestBuilder {
    
    case oauthToken(clientId: String,
                    clientSecret: String,
                    accessCode: String,
                    callbackUrl: String)
    case getUser(token: String)
    case getUserShots(token: String,
                      page: Int)
}

extension DribbbleRequestBuilder: DataRequestExecutable {
    
    var execute: DataRequest {
        switch self {
        case .oauthToken(clientId: let clientId,
                         clientSecret: let clientSecret,
                         accessCode: let accessCode,
                         callbackUrl: let callbackUrl):
            
            let parameters: [String: Any] = [
                "client_id": clientId,
                "client_secret": clientSecret,
                "code": accessCode,
                "redirect_uri": callbackUrl
            ]
            
            return AF.request(DribbbleRoutes.oauthToken, method: .post, parameters: parameters)
            
        case .getUser(token: let token):
            let header = ApiDribbbleRoutes.makeAuthHeadersFromToken(token: token)
            return AF.request(ApiDribbbleRoutes.user, headers: header)
            
        case .getUserShots(token: let token, page: let page):
            let header = ApiDribbbleRoutes.makeAuthHeadersFromToken(token: token)
            let parameters: [String: Any] = [ "page": page ]
            return AF.request(ApiDribbbleRoutes.shots, parameters: parameters, headers: header)
            
        }
    }
}
