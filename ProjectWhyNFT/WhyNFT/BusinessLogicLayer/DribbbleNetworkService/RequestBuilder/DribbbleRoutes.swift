//  DribbbleRoutes.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Alamofire

enum DribbbleRoutes: String, URLConvertible {
    
    static let endpoint = "https://dribbble.com/"
    
    case oauthAuthorize = "oauth/authorize/"
    case oauthToken = "oauth/token/"

    func asURL() throws -> URL {
        guard let url = URL(string: DribbbleRoutes.endpoint + self.rawValue)
        else { throw RequestBuildError.cannotCreateUrl }
        return url
    }
}

enum ApiDribbbleRoutes: String, URLConvertible {
    
    static let endpoint = "https://api.dribbble.com/v2/"
    
    case user = "user/"

    func asURL() throws -> URL {
        guard let url = URL(string: ApiDribbbleRoutes.endpoint + self.rawValue)
        else { throw RequestBuildError.cannotCreateUrl }
        return url
    }
    
    static func makeAuthHeadersFromToken(token: String, contentType: ContentType? = nil) -> HTTPHeaders {
        if let contentType = contentType {
            return [
                "Authorization": "Bearer \(token)",
                "Content-Type": contentType.rawValue
            ]
        } else {
            return ["Authorization": "Bearer \(token)"]
        }
    }
}

enum ContentType: String {
    case json = "application/json"
    case formData = "multipart/form-data"
}
