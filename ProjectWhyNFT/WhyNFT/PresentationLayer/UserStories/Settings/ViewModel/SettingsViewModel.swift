//
//  SettingsViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 12.06.2021.
//

import Foundation
import StoreKit

final class SettingsViewModel {
    
	var output: SettingsOutput?
    
    var dribbbleService: DribbbleNetworkServiceProtocol!
    var raribleService: RaribleNetworkServiceProtocol!
}

// MARK: - Configuration
extension SettingsViewModel: CustomizableSettingsViewModel {

}

// MARK: - Interface for view
extension SettingsViewModel: SettingsViewModelProtocol {

//    var termsOfUsageUrl: URL? {
//        return purchaseManager.termsOfUsageUrl
//    }
//    var privacyPolicyUrl: URL? {
//        return purchaseManager.privacyPolicyUrl
//    }
//    var supportUrl: URL? {
//        return purchaseManager.supportUrl
//    }
//
//    func rateApp() {
//        purchaseManager.rateApp()
//    }
    
    func disconnectFromDribbble() {
        dribbbleService.forgetUserToken()
    }
    
    func logOutRarible() {
        raribleService.forgetUserId()
    }

}

