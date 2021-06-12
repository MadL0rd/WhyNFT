//  DribbbleCompletionTypealiases.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Alamofire

// typealias Get<#Something#>Completion = (Result<Get<#Something#>Result, NetworkServiceError>) -> Void

// MARK: - Account Access
typealias SignInDribbbleCompletion = (Result<Void, DribbbleEntranceError>) -> Void
typealias GetTokenDribbbleCompletion = (Result<OauthTokenRequestResult, NetworkServiceError>) -> Void
typealias GetDribbbleUserCompletion = (Result<DribbbleUser, NetworkServiceError>) -> Void
