//
//  KeychainStorageError.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation

enum KeychainStorageError: Error {
    case itemNotFound
    case failedToSetValue
    case failedToUpdateValue
    case failedToDeleteValue
    case failedToConvertToData
}
