//  DribbbleNetworkService.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Alamofire

class DribbbleNetworkService: NetworkService {
    
    static let shared: DribbbleNetworkServiceProtocol = DribbbleNetworkService()
    
    private let requestBuilder = DribbbleRequestBuilder.self
    
    internal var token: String? {
        didSet {
            saveTokenInStorrage()
        }
    }
    
    override init() {
        super.init()
        
        let storrage = SecureStorage.shared
        token = storrage.getStringValue(for: .userTokenDrobbble)
    }
    
    private func saveTokenInStorrage() {
        guard let token = token
        else { return }
        
        let storrage = SecureStorage.shared
        try? storrage.set(token, for: .userTokenDrobbble)
    }
}

extension DribbbleNetworkService: DribbbleNetworkServiceProtocol {
    
    func createTokenAndAuthenticate(completion: @escaping SignInDribbbleCompletion) {
        
        guard let authorizeUrl = try? DribbbleRoutes.oauthAuthorize.asURL()
        else {
            completion(.failure(.unknown))
            return
        }
        
        let clientId = LocalOnlyConstants.dribbbleClientId
        let clientSecret = LocalOnlyConstants.dribbbleClientSecret
        let callbackUrl = LocalOnlyConstants.dribbbleCallbackUrl
        
        let clientIdQuery = URLQueryItem(name: "client_id", value: clientId)
        let redirectUrlQuery = URLQueryItem(name: "redirect_uri", value: callbackUrl)
        let scopeQuery = URLQueryItem(name: "scope", value: "public+upload")
        
        var components = URLComponents(url: authorizeUrl, resolvingAgainstBaseURL: true)
        components?.queryItems = [clientIdQuery, redirectUrlQuery, scopeQuery]
        
        let deeplinkHandler: (_ : URL) -> Void = { [ weak self ] url in
            guard let self = self
            else { return }
            
            guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems,
                  let accessCode = queryItems.first(where: { $0.name == "code" })?.value
            else { return }
            
            let request = self.requestBuilder.oauthToken(clientId: clientId,
                                                         clientSecret: clientSecret,
                                                         accessCode: accessCode,
                                                         callbackUrl: callbackUrl)
            
            let tokenCompletion: GetTokenDribbbleCompletion = { result in
                switch result {
                case .success(let data):
                    self.token = data.accessToken
                    completion(.success(()))
                    
                case .failure(let error):
                    completion(.failure(.unknown))
                    print(error)
                }
            }
            
            self.makeDefaultRequest(dataRequest: request,
                                    completion: tokenCompletion)
            
        }
        
        //        TODO: needs check duplicate collision
        if #available(iOS 13.0, *) {
            SceneDelegate.urlHandlers.append(deeplinkHandler)
        } else {
            AppDelegate.urlHandlers.append(deeplinkHandler)
        }

        UIApplication.shared.open(components!.url!, options: [:], completionHandler: nil)
    }
    
    func forgetUserToken() {
        token = ""
        let storrage = SecureStorage.shared
        try? storrage.deleteValue(for: .userTokenDrobbble)
    }   
    
    func getCurrentUser(completion: @escaping GetDribbbleUserCompletion) {
        guard let token = token
        else {
            completion(.failure(.badToken))
            return
        }
        
        let request = requestBuilder.getUser(token: token)
        makeDefaultRequest(dataRequest: request, completion: completion)
    }
    
    func getCurrentUserWorks(page: Int, completion: @escaping GetDribbbleUserWorksCompletion) {
        guard let token = token
        else {
            completion(.failure(.badToken))
            return
        }
        
        let request = requestBuilder.getUserShots(token: token, page: page)
        makeDefaultRequest(dataRequest: request, completion: completion)
    }
}
