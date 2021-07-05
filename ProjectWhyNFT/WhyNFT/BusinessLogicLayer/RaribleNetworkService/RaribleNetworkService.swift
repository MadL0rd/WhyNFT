//  RaribleNetworkService.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import Alamofire

class RaribleNetworkService: NetworkService {
    
    static let shared: RaribleNetworkServiceProtocol = RaribleNetworkService()
    
    private let requestBuilder = RaribleRequestBuilder.self
        
    var userId: String? {
        didSet {
            saveTokenInStorrage()
        }
    }
    
    var userTokenDrobbble: String? {
        let storrage = SecureStorage.shared
        return storrage.getStringValue(for: .userTokenDrobbble)
    }
    
    override init() {
        super.init()
        
        let storrage = SecureStorage.shared
        userId = storrage.getStringValue(for: .userIdRarible)
    }
    
    private func saveTokenInStorrage() {
        guard let userId = userId
        else { return }
        
        let storrage = SecureStorage.shared
        try? storrage.set(userId, for: .userIdRarible)
    }
}

extension RaribleNetworkService: RaribleNetworkServiceProtocol {
    
    var mainRaribleUrl: URL? {
        return URL(string: "https://rarible.com/")
    }
    
    func validateUserId(completion: @escaping RaribleValidateUserIdCompletion) {
        //        TODO: validate user id
        let result = userId != nil && userId?.isNotEmpty == true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(result))
        }
    }
    
    func setUserId(_ id: String) {
        userId = id
    }
    
    func forgetUserId() {
        userId = nil
        let storrage = SecureStorage.shared
        try? storrage.deleteValue(for: .userIdRarible)
    }
    
    func workSaleRequest(artWork: ArtWork, completion: @escaping WorkRequestCompletion) {
        guard let token = userTokenDrobbble,
              let userId = userId
        else {
            completion(.failure(.badToken))
            return
        }
        
        let request = requestBuilder.work(tokenDribbble: token, workId: String(artWork.artId), userWalletId: userId)
        makeDefaultRequest(dataRequest: request, completion: completion)
    }

    func worksAlreadyUsedCheck(artWorks: [ArtWork], completion: @escaping ShotsCheckCompletion) {
        guard let token = userTokenDrobbble
        else {
            completion(.failure(.badToken))
            return
        }
        
        let request = requestBuilder.shotsCheck(tokenDribbble: token, workIds: artWorks.map { $0.artId })
        makeDefaultRequest(dataRequest: request, completion: completion)
    }
    
    func uploadArtwork(artWork: ArtWork, completion: @escaping UploadArtworkCompletion) {
        guard let token = userTokenDrobbble,
              let userId = userId
        else {
            completion(.failure(.badToken))
            return
        }
        
        let request = requestBuilder.artWorkUpload(tokenDribbble: token, workId: artWork.artId, userWalletId: userId)
        makeDefaultRequest(dataRequest: request, completion: completion)
    }
}
