//  DribbbleCompletionTypealiases.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Alamofire

typealias SignInDribbbleCompletion = (Result<Void, DribbbleEntranceError>) -> Void
typealias GetTokenDribbbleCompletion = (Result<OauthTokenRequestResult, NetworkServiceError>) -> Void
typealias GetDribbbleUserCompletion = (Result<DribbbleUser, NetworkServiceError>) -> Void
typealias GetDribbbleUserWorksCompletion = (Result<[DribbbleWork], NetworkServiceError>) -> Void
