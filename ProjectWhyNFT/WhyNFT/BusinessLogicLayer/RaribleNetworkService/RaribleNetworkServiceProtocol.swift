//  RaribleNetworkServiceProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import Foundation

protocol RaribleNetworkServiceProtocol: AnyObject {
    
    var mainRaribleUrl: URL? { get }
    
    func validateUserId(completion: @escaping RaribleValidateUserIdCompletion)
    func setUserId(_ id: String)
    func forgetUserId()
    
    func workSaleRequest(artWork: ArtWork, completion: @escaping WorkRequestCompletion)
}

