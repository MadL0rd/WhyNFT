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
    
    var purchaseManager: PurchaseManagerProtocol!

}

// MARK: - Configuration
extension SettingsViewModel: CustomizableSettingsViewModel {

}

// MARK: - Interface for view
extension SettingsViewModel: SettingsViewModelProtocol {

    var termsOfUsageUrl: URL? {
        return purchaseManager.termsOfUsageUrl
    }
    var privacyPolicyUrl: URL? {
        return purchaseManager.privacyPolicyUrl
    }
    var supportUrl: URL? {
        return purchaseManager.supportUrl
    }
    
    var aboutUsUrl: URL? {
        return URL(string: "https://www.notion.so/NaFTalene-FAQ-b4e51170ea7046728d18d9569525464e")
    }

    func rateApp() {
        purchaseManager.rateApp()
    }
    
    func disconnectFromDribbble() {
        dribbbleService.forgetUserToken()
    }
    
    func logOutRarible() {
        raribleService.forgetUserId()
    }

}

