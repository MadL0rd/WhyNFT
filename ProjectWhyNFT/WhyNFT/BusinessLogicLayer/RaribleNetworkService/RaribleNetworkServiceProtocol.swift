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
    func worksAlreadyUsedCheck(artWorks: [ArtWork], completion: @escaping ShotsCheckCompletion)
    func uploadArtwork(artWork: ArtWork, completion: @escaping UploadArtworkCompletion)
}

