//  DribbbleErrors.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Alamofire

enum DribbbleEntranceError: Error {
    
    case wrongCode
    case wrongEmail
    case cannotParceData
    case unknown
    case badToken
    
    var localizedDescription: String {
        switch self {
        case .cannotParceData:
            return R.string.localizable.cannotParceData()
        case .unknown:
            return R.string.localizable.unknownError()
        case .badToken:
            return R.string.localizable.badToken()
        case .wrongCode:
            return R.string.localizable.wrongCode()
        case .wrongEmail:
            return R.string.localizable.wrongEmail()
        }
    }
}
