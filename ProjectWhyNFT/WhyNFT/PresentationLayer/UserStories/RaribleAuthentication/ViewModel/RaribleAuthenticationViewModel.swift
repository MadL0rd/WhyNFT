//
//  RaribleAuthenticationViewModel.swift
//  WhyNFT
//
//  Created by Антон Текутов on 13.06.2021.
//

import UIKit

final class RaribleAuthenticationViewModel {
    
	var output: RaribleAuthenticationOutput?
    
    var raribleService: RaribleNetworkServiceProtocol!

}

// MARK: - Configuration
extension RaribleAuthenticationViewModel: CustomizableRaribleAuthenticationViewModel {

}

// MARK: - Interface for view
extension RaribleAuthenticationViewModel: RaribleAuthenticationViewModelProtocol {

    func openRaribleLink() {
        guard let url = raribleService.mainRaribleUrl
        else { return }
        UIApplication.shared.open(url)
    }
    
    func saveWallet(userId: String) {
        raribleService.setUserId(userId)
    }
}

