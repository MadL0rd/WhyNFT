
//  RaribleRoutes.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import Alamofire

enum RaribleRoutes: String, URLConvertible {
    
    static let endpoint = "http://5245dc8666af.ngrok.io/api/"
    
    case work = "work/"

    func asURL() throws -> URL {
        guard let url = URL(string: RaribleRoutes.endpoint + self.rawValue)
        else { throw RequestBuildError.cannotCreateUrl }
        return url
    }
    
    static func makeAuthHeadersFromToken(token: String, contentType: ContentType? = nil) -> HTTPHeaders {
        if let contentType = contentType {
            return [
                "Authorization": "Token \(token)",
                "Content-Type": contentType.rawValue
            ]
        } else {
            return ["Authorization": "Token \(token)"]
        }
    }
}
