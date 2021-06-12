//  DribbbleNetworkServiceProtocol.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation

protocol DribbbleNetworkServiceProtocol: AnyObject {
    
    func createTokenAndAuthenticate(completion: @escaping SignInDribbbleCompletion)
    func forgetUserToken()
    func getCurrentUser(completion: @escaping GetDribbbleUserCompletion)
}

