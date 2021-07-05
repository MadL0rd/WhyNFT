//  RaribleCompletionTypealiases.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import Alamofire

typealias RaribleValidateUserIdCompletion = (Result<Bool, NetworkServiceError>) -> Void
typealias WorkRequestCompletion = (Result<WorkRequestResult, NetworkServiceError>) -> Void
typealias ShotsCheckCompletion = (Result<ShotsCheckRequestResult, NetworkServiceError>) -> Void
typealias UploadArtworkCompletion = (Result<ArtWorkUploadRequestResult, NetworkServiceError>) -> Void

